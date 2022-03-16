//Gabe Emerson
//gte0002
//project1_gte0002.cpp
//September 6, 2019
//Flow of control program
//Compile using standard g++

#include <iostream>
using namespace std;

int main() {

	//format Output
   cout.setf(ios::fixed);
   cout.setf(ios::showpoint);
   cout.precision(2);

	//Obtain User Input
   cout << "Loan Amount: ";
   double loanAmount;
   cin >> loanAmount;
   cout << "Interest rate (% per year): ";
   double rate;
   cin >> rate;
   cout << "Monthly Payments: ";
   double payment;
   cin >> payment;
	
	//Change interest to decimal
   rate = rate / 100;
	//Make it monthly
   rate = rate / 12;
	
	//Initialize variables
   double balance = loanAmount;
   double interest = 0.0;
   double principal = 0.0;
   double totalInterest = 0.0;
   int month = 0;
	
	//Monthly payment enough to pay interest
   bool canPay;
   interest = balance * rate;
   if (payment <= interest) {
      cout << "You will need a higher monthly payment, otherwise you will not be able to pay off the loan" << endl;
      canPay = false;
   }
   else {
      canPay = true;
   }
	
   if (canPay) {
      if (loanAmount - payment < 1000) {
      	//Start of table
         cout << "************************************************************" << endl;
         cout << "\tAmortization Table" << endl;
         cout << "************************************************************" << endl;
         cout << "Month\tBalance\t   Payment\tRate\tInterest   Principal" << endl;
         cout << "0\t$" << loanAmount << "   N/A\t\tN/A\tN/A\t    N/A" << endl;
      	
      	//Calculate Monthly Payments
         while (balance > 0.0) {
            month++;
            interest = balance * rate;
            totalInterest = totalInterest + interest;
         	//Check if payment is more than user can pay
            if (payment > (balance + interest)) {
               payment = balance + interest;
            }
            principal = payment - interest;
            balance = balance - principal;
         
         	//Output
            cout << month << "\t$" << balance << "\t   $" << payment << "\t" << rate * 100 << "\t$" << interest << "\t    $" << principal << endl;
         }
      
      //Output Total
         cout << "************************************************************" << endl << endl;
         cout << "It takes " << month << " months to pay off the loan." << endl;
         cout << "Total interest paid is: $" << totalInterest << endl;
      
      }
      else {
      	//Start of Table
         cout << "********************************************************************" << endl;
         cout << "\tAmortization Table" << endl;
         cout << "********************************************************************" << endl;
         cout << "Month\tBalance\t\t   Payment\tRate\tInterest   Principal" << endl;
         cout << "0\t$" << loanAmount << "  \t   N/A\t\tN/A\tN/A\t    N/A" << endl;
      
      	//Calculate Monthly Payments
         while (balance > 0.0) {
            month++;
            interest = balance * rate;
            totalInterest = totalInterest + interest;
         	//Check if payment is more than user can pay
            if (payment > (balance + interest)) {
               payment = balance + interest;
            }
            principal = payment - interest;
            balance = balance - principal;
         
         	//Output
            cout << month << "\t$" << balance << "   \t   $" << payment << "\t" << rate * 100 << "\t$" << interest << "\t    $" << principal << endl;
         }
      
      //Output Total
         cout << "********************************************************************" << endl << endl;
         cout << "It takes " << month << " months to pay off the loan." << endl;
         cout << "Total interest paid is: $" << totalInterest << endl;
      }
   }
}









