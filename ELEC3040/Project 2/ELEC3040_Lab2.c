/*--------------------------------------
Gabriel Emerson
ELEC 3040
Lab 2
8/24/21
---------------------------------------*/
#include "stm32l432xx.h" /* Microcontroller information */
/* Define global variables */
int counter; /* c */
int counter2;
unsigned char sw1; //state of SW1
unsigned char sw2; //state of SW2
/*---------------------------------------------------*/
/* Initialize GPIO pins used in the program */
/* PA0 = push button */
/* PB4 = blue LED, PB3 = green LED */
/*---------------------------------------------------*/
void PinSetup () {
 /* Configure PA0 as input pin to read switch */
   RCC->AHB2ENR |= 0x01; /* Enable GPIOA clock (bit 0) */
   GPIOA->MODER &= ~(0x03FFFC3C); /* General purpose input mode */
   GPIOA->MODER |=  (0x01555400); /* General purpose output mode*/

// GPIOB IS NOT NEEDED FOR THIS LAB
//    /* Configure PB4,PB3 as output pins to drive LEDs */
//    RCC->AHB2ENR |= 0x02; /* Enable GPIOB clock (bit 1) */
//    GPIOB->MODER &= ~(0x000003C0); /* Clear PB4-PB3 mode bits */
//		GPIOB->MODER |=  (0x00000140); /* General purpose output mode*/
}
/*----------------------------------------------------------*/
/* Delay function - do nothing for about 1 seconds */
/*----------------------------------------------------------*/
// Delay is exactly 0.5s
void delay () {
   int i,j,n;
   for (i=0; i<20; i++) { //outer loop
      for (j=0; j<8225; j++) { //inner loop
         n = j; //dummy operation for single-step test
      } //do nothing
   }
}

void count() {
    
   if (sw2 == 1) {
      counter = (counter > 0) ? (counter - 1) : 9;
   }
   else {
      counter = (counter < 9) ? (counter + 1) : 0;
   }
   counter2 = (counter2 + 1) % 10; //Infinite counter, Keeps from going over 10
   GPIOA->ODR &= 0x0000; //clear the bits
   GPIOA ->ODR |= counter << 5;
   GPIOA ->ODR |= counter2 << 9; 
}

int main() {
   PinSetup();
   counter = 0;
   sw1 = 0;
   sw2 = 0;
   GPIOA->ODR &= 0x0000;
   while(1) {
      sw1 = (GPIOA->IDR & 0x02) ? 1 : 0; //Read GPIOA and mask all but bit 1
      if (sw1 == 1) {
         count();
      }
      delay();
      sw1 = (GPIOA->IDR & 0x02) ? 1 : 0; //Read GPIOA and mask all but bit 1
      sw2 = (GPIOA->IDR & 0x04) ? 1 : 0; //Read GPIOA and mask all but bit 2
   }
}