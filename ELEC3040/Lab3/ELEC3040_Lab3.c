/*--------------------------------------
Gabriel Emerson
ELEC 3040
Lab 3
8/30/21
---------------------------------------*/
#include "stm32l432xx.h" /* Microcontroller information */
/* Define global variables */
static int counter; 
static int counter2;
static int run;
static int up;
/*---------------------------------------------------*/
/* Initialize GPIO pins used in the program */
/* PA1 = push button */
/* PA2 = push button */
/* PB3 = blue LED, PB4 = green LED */
/*---------------------------------------------------*/
static void PinSetup () {
 /* Configure PA1 as input pin to read switch */
   RCC->AHB2ENR |= 0x01; /* Enable GPIOA clock (bit 0) */
   GPIOA->MODER &= ~(0x03FFFC3C); /* General purpose input mode */
   GPIOA->MODER |=  (0x01555400); /* General purpose output mode*/

    /* Configure PB4,PB3 as output pins to drive LEDs */
   RCC->AHB2ENR |= 0x02; /* Enable GPIOB clock (bit 1) */
   GPIOB->MODER &= ~(0x000003C0); /* Clear PB4-PB3 mode bits */
   GPIOB->MODER |=  (0x00000140); /* General purpose output mode for PB4-PB3*/
}

static void interrupt_setup() {
/**		RCC->APB2ENR |= 0x01; // Turn on clock for SYSCFG
		SYSCFG->EXTICR[0] &= ~SYSCFG_EXTICR1_EXTI1; //Clear EXTI1 bit in config register
		SYSCFG->EXTICR[0] |=  SYSCFG_EXTICR1_EXTI1_PA; //Select PA1 as interrupt source
		SYSCFG->EXTICR[0] |=  SYSCFG_EXTICR1_EXTI2_PA; //Select PA2 as interrupt source
		EXTI->RTSR1 |= EXTI_RTSR1_RT1; // Rising edge triggered for EXTI1
		EXTI->RTSR1 |= EXTI_RTSR1_RT2; // Rising edge triggered for EXTI2
		EXTI->PR1 = EXTI_PR1_PIF1; // Clear EXTI1 pending bit
		EXTI->PR1 = EXTI_PR1_PIF2; // Clear EXTI2 pending bit
		EXTI->IMR1 |=  EXTI_IMR1_IM1; // Enable EXTI1
		EXTI->IMR1 |=  EXTI_IMR1_IM2; // Enable EXTI2
		NVIC_ClearPendingIRQ(EXTI1_IRQn); // Clear NVIC pending bit
		NVIC_ClearPendingIRQ(EXTI2_IRQn); // Clear NVIC pending bit
		NVIC_EnableIRQ(EXTI1_IRQn); // Enables IRQ
    NVIC_EnableIRQ(EXTI2_IRQn); // Enables IRQ
*/	
		/** I think these would do the same thing but give actual numbers
	======================================================================= */
   EXTI->RTSR1 |= 0x0006; // line2-1 are rising edge triggered
   EXTI->IMR1 |= 0x0006; //line 2-1 are not masked; therefore they're enabled
   EXTI->PR1 |= 0x0006; //clear pending for EXTI2-1
   EXTI->PR1 |= 0x0006; //clear pending for PA2-1
   NVIC_EnableIRQ(EXTI1_IRQn);
   NVIC_EnableIRQ(EXTI2_IRQn);
   SYSCFG->EXTICR[0] &= 0xF00F;
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

static void count() {
    
   if (run == 1) {
      counter2 = (counter2 < 9) ? (counter2 + 1) : 0;  //Infinite counter, Keeps from going over 10 
      if (up == 1) {
         counter = (counter < 9) ? (counter + 1) : 0;
      }
      else {
         counter = (counter > 0) ? (counter - 1) : 9;
      }
   // Clear, and grab the bit for LED's in PA12-5
      GPIOA->ODR &= 0x0000; //clear the bits
      GPIOA ->ODR |= counter << 5;
      GPIOA ->ODR |= counter2 << 9; 
   } 
}
	 
//Interrupt called when PA1 is pressed
void EXTI1_IRQHandler() {
   __disable_irq();
   if (run == 0) {
      run = 1;
   }
   else {
      run = 0;
   }
   GPIOB->ODR ^= 0x0008; //Set PB3=1 to turn on blue LED (in BSRR lower half)  
   EXTI->PR1 |= 0x0002;
   NVIC_ClearPendingIRQ(EXTI1_IRQn);
   __enable_irq();
}

//Interrupt called when PA2 is pressed
void EXTI2_IRQHandler() {
   __disable_irq();
   if (up == 1) {
      up = 0;
   }
   else {
      up = 1;
   }
   GPIOB->ODR ^= 0x0010; //Set PB4 = 1 to turn ON green LED (in BSRR lower half)
   EXTI->PR1 |= 0x0004;
   NVIC_ClearPendingIRQ(EXTI2_IRQn);
   __enable_irq();
}


int main() {
   PinSetup();
   interrupt_setup();
   counter = 0;
   counter2 = 0;
   run = 0;
   up = 0;
   GPIOA->ODR &= 0x0000;
   while(1) {
      count();
      delay(); // Delay for half a second
   }
}