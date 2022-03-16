#include<stdio.h>
#include<math.h>

int main() {
	int arr[10];
	int i;
	double sum = 0.0;

	printf("Input 10 numbers to calculate their average square root:\n");
	for(i=0; i<10; i++) {
		printf("Element - %d: ", i+1);
		scanf("%d", &arr[i]);
	}
	for(i=0; i<10; i++) {
		sum = sum + sqrt(arr[i]);
	}
	double avg = sum / 10;
	
	printf("Average of the elements square roots: %.2f\n", avg);
	return 0;
}
