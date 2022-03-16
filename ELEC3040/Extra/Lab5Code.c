/*====================================================*/
/* Antonio Cacicedo */
/* ELEC 3040/3050 - Lab 4, Program 1 */
/* Runs a decade counter until the keypad is pressed. Then it displays the key pressed for 3 seconds. */
/*====================================================*/

#include "stm32l4xx.h" /* Microcontroller information */

/* Define Global Variables */
unsigned int static counter; // Global Decade Counter
int static start; // Decides if the machine starts or stops

/*---------------------------------------------------*/
/* Initialize GPIO pins used in the program */
/* PA 11-8 = Column Output */
/* PA 5-2 = Row Input */
/* PB0 = AND Gate IRQ */
/* PB 6-3 = Display Output */
/*---------------------------------------------------*/
void PinSetup () {
	/* Configure GPIOA */
	RCC->AHB2ENR |= 0x01; /* Enable GPIOA clock (bit 0) */
	GPIOA->MODER &= ~(0xFF0FF0); /* Clear bits 11-8 and 5-2 */
	GPIOA->MODER |= (0x550000); /* Sets PA 11-8 as General Output */
	GPIOA->MODER &= ~(0xFF0); /* Sets PA 5-2 as General Input */
	
	/* Configure GPIOB */
	RCC->AHB2ENR |= 0x02; /* Enable GPIOB clock (bit 1) */
	GPIOB->MODER &= ~(0x3FC3); /* Clear bits 0 and 6-3 */
	GPIOB->MODER |= (0x1540); /* Sets PB 6-3 as General Output */
	GPIOB->MODER &= ~(0x3); /* Sets PB 0 as General Input */
	
	/* Configure the PUPDR */
	GPIOA->PUPDR &= ~(0x00000FF0); /* Clears bits 2 - 5 */
	GPIOA->PUPDR |= (0x00000550); /* Pulls the pins high */
}

/*---------------------------------------------------*/
/* Sets up the an Interrupt triggered by PB0 and the Timer Interrupt */
/*---------------------------------------------------*/
void InterruptSetup () {
	
	// SYSCFG Module
	
	/* enable SYSCFG clock –only necessary for change of SYSCFG */ 
	RCC->APB2ENR |= 0x01;  // Set bit 0 of APB2ENR to turn on clock for SYSCFG
	
	/* select PB0 as EXTI0 */ 
	SYSCFG->EXTICR[0] &= ~SYSCFG_EXTICR1_EXTI0; //clear EXTI0 bit in config reg
	SYSCFG->EXTICR[0] |=  SYSCFG_EXTICR1_EXTI0_PB; //select PB0 as interrupt source
	
	// EXTI Modules
	
	EXTI->FTSR1 |= 0x0001; // enables falling edge of EXTI 0
	EXTI->PR1   |= 0x0001; // Clear Interupt flag 0
	EXTI->IMR1  |= 0x0001; // Enable EXTI0
	
	// NVIC Module
	
	NVIC_ClearPendingIRQ(EXTI0_IRQn); // Clear NVIC pending bit
	NVIC_EnableIRQ(EXTI0_IRQn); //Enable IRQ
}

/*---------------------------------------------------*/
/* Sets up the Interrupt at PB0 */
/*---------------------------------------------------*/
void EXTI0_IRQHandler () {
	__disable_irq();
	
	int special; // check for number
	special = 0;
	int column = 0;
	int row = 0;
	int j;
	
	// set up column checker
	special = ~(GPIOA->IDR) & 0x04; // row 4
	if (special != 0) { row = 0x04; }
	special = 0;
	special = ~(GPIOA->IDR) & 0x08; // row 3
	if (special != 0) { row = 0x08; }
	special = 0;
	special = ~(GPIOA->IDR) & 0x10; // row 2
	if (special != 0) { row = 0x10; }
	special = 0;
	special = ~(GPIOA->IDR) & 0x20; // row 1
	if (special != 0) { row = 0x20; }
	special = 0;
	
	/* polling 1 */
	GPIOA->ODR |= (0xF00); // 1 1 1 1
	GPIOA->ODR &= ~(0x100); // 1 1 1 0
	for (j = 0; j < 100; j++) { j = j; }; // dummy loop
	special = (~(GPIOA->IDR)) & row; // column 4
	if (special != 0) { column = 4; }
	special = 0;
	
	/* polling 2 */
	GPIOA->ODR |= (0xF00); // 1 1 1 1
	GPIOA->ODR &= ~(0x200); // 1 1 0 1
	for (j = 0; j < 100; j++) { j = j; }; // dummy loop
	special = (~(GPIOA->IDR)) & row; // column 3
	if (special != 0) { column = 3; }
	special = 0;
	
	/* polling 3 */
	GPIOA->ODR |= (0xF00); // 1 1 1 1
	GPIOA->ODR &= ~(0x400); // 1 0 1 1
	for (j = 0; j < 100; j++) { j = j; }; // dummy loop
	special = (~(GPIOA->IDR)) & row; // column 2
	if (special != 0) { column = 2; }
	special = 0;
	
	/* polling 4 */
	GPIOA->ODR |= (0xF00); // 1 1 1 1
	GPIOA->ODR &= ~(0x800); // 0 1 1 1
	for (j = 0; j < 100; j++) { j = j; }; // dummy loop
	special = (~(GPIOA->IDR)) & row; // column 1
	if (special != 0) { column = 1; }
	special = 0;
	
	GPIOA->ODR &= ~(0xF00); // Clears the ODR for the Keypad and sets the bits needed to 0
	
	if (row == 0x04) { // Input of 0
		if (column == 2) {
			if (start == 0) { // Start the Timer
				TIM7->CR1 |= TIM_CR1_CEN;    //Bit CEN=1 to enable counting
			}
			else { // Stop the Timer
				TIM7->CR1 &= ~0x0001; // Bit CEN = 0 to disable counting
			}
			start = ~start; // Sets the timers to be setup
		}
	}
	
	if (row == 0x20) { // Input of 1
		if (column == 1) {
			if (start == 0) {
				counter = 0; // Resets the stopwatch
				GPIOB->ODR &= ~(0x78); // Clears the Pins 3 - 6
				GPIOB->ODR |= counter << 3; // Sets the bits to be equal to the counter
			}
		}
	}
	
	for (int i = 0; i < 20000; i++); // avoid debouncing (1/5 * .5s = .1s)
	
	EXTI->PR1 |= 0x0001; // Clear Interupt flag 0
	NVIC_ClearPendingIRQ(EXTI0_IRQn); // Clears NVIC pending flag 0
	
	__enable_irq();
}

// Issue was not intializing variables before interrupt enabling
/*---------------------------------------------------*/
/* Controls Timer Interrupt */
/*---------------------------------------------------*/
void TIM7_IRQHandler() {
	__disable_irq();
	if (counter >= 10) {
		counter = 0;
	}
	
	GPIOB->ODR &= ~(0x78); // Clears the Pins 3 - 6
	GPIOB->ODR |= counter << 3; // Sets the bits to be equal to the counter
	
	counter++;
	
	TIM7->SR &= ~TIM_SR_UIF; // Fixs the Interrupt UIF
	
	NVIC_ClearPendingIRQ(TIM7_IRQn); // Clear NVIC pending bit
	__enable_irq();
}

/*---------------------------------------------------*/
/* Sets up the Timer */
/*---------------------------------------------------*/
void TimerSetup() {
	RCC->APB1ENR1 |= RCC_APB1ENR1_TIM7EN; // Enable Clock
	
	TIM7->PSC = 0x76;//prescaler value
	TIM7->ARR = 0x3FE5;//auto-reload value
	
	// UIE in DIER
	TIM7->DIER |= TIM_DIER_UIE; // Enables Interrupts in Timer 7
	
	NVIC_ClearPendingIRQ(TIM7_IRQn); // Clear NVIC pending bit
	NVIC_EnableIRQ(TIM7_IRQn);    // enable TIM2 interrupts
	
	// CPU
	__enable_irq();
	
	TIM7->SR &= ~TIM_SR_UIF; // Fixs the Interrupt UIF
	
}

int main(void) {
	PinSetup(); // Configure GPIO Pins
	InterruptSetup(); // Configures the Interrupt 
	TimerSetup();
	counter = 0; // Sets counter = 0
	start = 0; // Sets the stopwatch as stopped
	GPIOA->ODR &= ~(0xF00); // Clears the ODR for the Keypad and sets the bits needed to 0
	
	while(1) {

	}
}
