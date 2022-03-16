/*--------------------------------------
Gabriel Emerson
ELEC 3040
Lab 5
9/13/21
---------------------------------------*/
#include "stm32l432xx.h" /* Microcontroller information */
/* Define global variables */
static int counter; 
static int check = 0;
static int intr_value = 0xFF;
static int disp_intr_value = 0;
//char keys[4][4] = {{0x1,0x2,0x3,0xa}, 
//                     {0x4,0x5,0x6,0xb},
//                     {0x7,0x8,0x9,0xc},
//                    {0xe,0x0,0xf,0xd}};
// THE KEYPAD IS REVERSED SO WE REVERSE THE VALUES
char keys[4][4] = {{0xd,0xf,0x0,0xe}, 
                     {0xc,0x9,0x8,0x7},
                     {0xb,0x6,0x5,0x4},
                     {0xa,0x3,0x2,0x1}};
// Define to locate which key was pressed on keypad
typedef struct locate {
   int col;
   int row;
} locate;

// Define structure for Timer and initialize to 0.0.
#define PRESCALE (uint32_t) 0x3B
#define ARR1 (uint32_t) 0xFFFF
int ones; 
int tens;
int timr_cnt = 0;

// MUST DECLARE DISPLAY() FUNCTION BEFORE USING
// I HAVE NO IDEA WHY
void display();

/*---------------------------------------------------*/
/* Initialize GPIO pins used in the program */
/*---------------------------------------------------*/
//GPIO MODER SETTINGS
// 00 = Digital Input Mode
// 01 = Digital Output mode
// 10 = Alternate Function Mode
// 11 = Analog Input Mode

//GPIO PUPDR SETTINGS
// 00 = No pull-up or pull-down
// 01 = Activate pull-up
// 10 = Activate pull-down
/** 
 * PA5-2 = Rows
 * PA11-8 = Columns
**/
/*---------------------------------------------------*/
static void PinSetup () {
 /* Configure PA11-8, PA5-2 as input pins to read switch */
   RCC->AHB2ENR |= 0x01; /* Enable GPIOA clock (bit 0) */
   GPIOA->MODER &= ~(0x00FF0FF0); /* General purpose input mode. Turns on pins PA11-8, PA5-2 */
   GPIOA->MODER |=  (0x00550000); /* General purpose output mode for PA11-8*/

    /* Configure PB6-3 as output pins, PB0 as input */
   RCC->AHB2ENR |= 0x02; /* Enable GPIOB clock (bit 1) */
   GPIOB->MODER &= ~(0x00003FC3); /* General purpose input mode. Turns on pins PB6-3, PB0 */
   GPIOB->MODER |=  (0x00001540); /* General purpose output mode for PB6-3*/
   
   //PUPDR setups
   GPIOA->PUPDR &= ~(0x00000FF0); //Clears bits Pull up/down resistors for PA5-2
   GPIOA->PUPDR |= (0x00000550); //Set bits to 01 for PUPDR pull-up PA5-2
	
	 GPIOA->ODR &= ~(0xF00); //Clear PA11-8
}

		// Setup interupt for EXTI0, PB0
static void interrupt_setup() {
   RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
   SYSCFG->EXTICR[0] &= 0xFFF0;
   SYSCFG->EXTICR[0] |= 0x0001;
	 EXTI->FTSR1 |= 0x0001; // line 0 are rising edge triggered
   EXTI->IMR1 |= 0x0001; //line 0 are not masked; therefore is enabled
   EXTI->PR1 |= 0x0001; //clear pending for EXTI0
   NVIC_EnableIRQ(EXTI0_IRQn);
   //__enable_irq();
}	

		// Setup for Timer7
static void timer_setup() {
	 RCC->APB1ENR1 |= RCC_APB1ENR1_TIM7EN; //enable clock for timer 7    
   TIM7->DIER |= TIM_DIER_UIE; //DMA interrupt enable register
   NVIC_EnableIRQ(TIM7_IRQn);
   //NVIC_SetPriority(TIM7_IRQn, 0);
   TIM7->CR1 |= TIM_CR1_CEN; //TIM7 control register enables timer to begin counting
   TIM7->PSC = PRESCALE; //TIM7 prescale register
   TIM7->CNT = ARR1; //TIM7 autoreload register count up
   __enable_irq(); //enables interrupts globally
}
/*----------------------------------------------------------*/
/* Delay function - do nothing */
/*----------------------------------------------------------*/

// Small delay used for buffering
static void small_delay() {
   int i,j,n;
   for (i=0; i<20; i++) { //outer loop
      for (j=0; j<20; j++) { //inner loop
         n = j; //dummy operation for single-step test
      } //do nothing
   }
}

static void count() {
   counter = (counter < 9) ? (counter + 1) : 0;
}

// Used to find the key being pressed
// IF CANT FIND KEY, SET LOC.COL AND LOC.ROW BACK TO 0. ADD loc.col = -1 AND loc.row = -1 ABOVE RETURN loc (LINE 138)
locate find_key() {
   locate loc;
   loc.col = -1;
   loc.row = -1;
   for (int i = 0; i < 4; i++) {
			GPIOA->ODR = (0xF << 8); //setting all columns high
      GPIOA->ODR = GPIOA->ODR ^(1<<(8+i)); //clearing each individual column
      small_delay();
		  int test = GPIOA->IDR;
      for (int j = 0; j < 4; j++) {
         if (!(test & (1 << j+2))) {
            loc.col = i;
            loc.row = j;
            return loc;
         }
      }
   }
   return loc;
}
	 
//Interrupt called when PB0 is pressed
void EXTI0_IRQHandler() {
   __disable_irq();
   check++;
   locate loc = find_key();
   if (loc.col != -1 && loc.row != -1) {
       intr_value = keys[loc.row][loc.col];
   }

   if (intr_value == 0x0) {
       timr_cnt = ~timr_cnt;
       TIM7->CR1 ^= TIM_CR1_CEN;
   }

   else if (intr_value == 0x1 && timr_cnt != 0) {
       counter = 0;
			 display();
       TIM7->CNT = 0; //resets counter register
   }
   EXTI->PR1 |= 0x0001;
   NVIC_ClearPendingIRQ(EXTI0_IRQn);
	 GPIOA->ODR &= ~(0xF00); // Clear PA11-8
   __enable_irq();
}

/**
 * Based on settings, should interrupt every 0.1 s
 * Meant to call the count function on each interrupt
 */
void TIM7_IRQHandler() {
    __disable_irq();
    if ((TIM7->SR & 0x01) == 0x01) {
        count();
        display();
        TIM7->SR &= ~TIM_SR_UIF;
    }
    NVIC_ClearPendingIRQ(TIM7_IRQn);
    __enable_irq();
}

void display() {
   GPIOA->ODR &= ~(0xF00); // Clear PA11-8
	 GPIOB->ODR = counter << 3;//Sets ODR LEDS PB6-3 to the counter value
}

int main() {
   PinSetup();
   interrupt_setup();
	 timer_setup();
   counter = 0;
   GPIOB->ODR &= 0xC03F;
   while(1);
}