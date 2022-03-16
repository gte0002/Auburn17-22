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
char keys[4][4] = {{0x1,0x2,0x3,0xa}, 
                     {0x4,0x5,0x6,0xb},
                     {0x7,0x8,0x9,0xc},
                     {0xf,0x0,0xe,0xd}};
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
 * PB3-0 = Rows
 * PB7-4 = Columns
**/
/*---------------------------------------------------*/
static void PinSetup () {
 /* Configure PA1 as input pin to read switch */
   RCC->AHB2ENR |= 0x01; /* Enable GPIOA clock (bit 0) */
   GPIOA->MODER &= ~(0x00FF0FF0); /* General purpose input mode. Turns on pins PA12-8, PA5-2 */
   //GPIOA->MODER |=  (0x01555400); /* General purpose output mode*/

    /* Configure PB6-3, PB0 as output pins */
   RCC->AHB2ENR |= 0x02; /* Enable GPIOB clock (bit 1) */
   GPIOB->MODER &= ~(0x00003FC3); /* General purpose input mode. Turns on pins PB6-3, PB0 */
   GPIOB->MODER |=  (0x00001541); /* General purpose output mode for PB6-3, PB0*/
   
   //PUPDR setups
   GPIOB->PUPDR &= ~(0x00000FF); //Clears bits Pull up/down resistors for PB3-0
   GPIOB->PUPDR |= (0x00000055); //Set bits to 01 for PUPDR pull-up Pb3-0 to maintain logic 1
}

static void interrupt_setup() {
   EXTI->RTSR1 |= 0x0002; // line1 are rising edge triggered
   EXTI->IMR1 |= 0x0002; //line 1 are not masked; therefore they're enabled
   EXTI->PR1 |= 0x0002; //clear pending for EXTI1
   EXTI->PR1 |= 0x0002; //clear pending for PA1
   NVIC_EnableIRQ(EXTI1_IRQn);
   //NVIC_EnableIRQ(EXTI2_IRQn);
   SYSCFG->EXTICR[0] &= 0xFF0F;
   __enable_irq();
}	

/*----------------------------------------------------------*/
/* Delay function - do nothing for about 1 seconds */
/*----------------------------------------------------------*/
// Delay is exactly 0.5s
static void delay() {
   int i,j,n;
   for (i=0; i<20; i++) { //outer loop
      for (j=0; j<8225; j++) { //inner loop
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

locate find_key() {
   locate loc;
   loc.col = 0;
   loc.row = 0;
   for (int i = 0; i < 4; i++) {
      GPIOB->ODR = (0xF << 4); //setting all columns high
      GPIOB->ODR = GPIOB->ODR ^(1<<(4+i)); //clearing each individual column
      small_delay();
      for (int j = 0; j < 4; j++) {
         int test = GPIOB->IDR;
         if (!(test & (1 << j))) {
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
	 
//Interrupt called when PA1 is pressed
void EXTI1_IRQHandler() {
   __disable_irq();
   check++;
   locate loc = find_key();
   if (loc.col != -1 && loc.row != -1) {
      disp_intr_value = 5;
      intr_value = keys[loc.row][loc.col];
   }
   EXTI->PR |= 0x0002;
   NVIC_ClearPendingIRQ(EXTI1_IRQn);
   __enable_irq();
}

void display() {
   GPIOB->ODR &= (~(0xF) << 4); //CHECK THISSSSSSSSSSSSSSSS
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
   GPIOB->ODR &= 0x0000;
   while(1) {
      count();
      display();
   }
}