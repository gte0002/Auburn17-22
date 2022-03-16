/*--------------------------------------
Gabriel Emerson
ELEC 3040
Lab 4
9/4/21
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
   __enable_irq();
}	

/*----------------------------------------------------------*/
/* Delay function - do nothing for about 1 seconds */
/*----------------------------------------------------------*/
// Delay is approx 1 second
static void delay() {
   int i,j,n;
   for (i=0; i<20; i++) { //outer loop
      for (j=0; j<16450; j++) { //inner loop
         n = j; //dummy operation for single-step test
      } //do nothing
   }
}

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
locate find_key() {
   locate loc;
   loc.col = 0;
   loc.row = 0;
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
   loc.col = -1;
   loc.row = -1;
   return loc;
}
	 
//Interrupt called when PB0 is pressed
void EXTI0_IRQHandler() {
   __disable_irq();
   check++;
   locate loc = find_key();
   if (loc.col != -1 && loc.row != -1) {
      disp_intr_value = 5;
      intr_value = keys[loc.row][loc.col];
   }
   EXTI->PR1 |= 0x0001;
   NVIC_ClearPendingIRQ(EXTI0_IRQn);
   __enable_irq();
}

void display() {
   GPIOA->ODR &= (~(0xF) << 8);
   if (disp_intr_value) {
      GPIOB->ODR = intr_value << 3;//Sets ODR LEDS PB6-3 to  the keypad value
      delay();
      disp_intr_value--;
   }
   else {
      GPIOB->ODR = counter << 3; //Sets ODR LEDS PB6-3 to counter
      delay(); //delay one second
   }
}

int main() {
   PinSetup();
   interrupt_setup();
   counter = 0;
   GPIOB->ODR &= 0xC03F;
   while(1) {
      count();
      display();
   }
}