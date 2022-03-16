
/**   */
public class BankLoan {
   // constant fields
   private static final int MAX_LOAN_AMOUNT = 100000;
   // instance variables (can be used within the class)
   private String customerName;
   private double balance, interestRate;
   private static int loansCreated = 0;
   /**Constructor.
    *@param customerNameIn -
    *@param interestRateIn -
    */
   public BankLoan(String customerNameIn, double interestRateIn) {
      customerName = customerNameIn;
      interestRate = interestRateIn;
      balance = 0;
      loansCreated++;
   }
   /** Method to get loan.
    *@return -wasLoanMade
    *@param amount -
    */
   public boolean borrowFromBank(double amount) {
      boolean wasLoanMade = false;
      if (balance + amount < MAX_LOAN_AMOUNT) {
         wasLoanMade = true;
         balance += amount;
      }
      return wasLoanMade;
   }
   /** Method to pay the bank.
    *@return -newBalance
    *@param amountPaid -
    */
   public double payBank(double amountPaid) {
      double newBalance = balance - amountPaid;
      if (newBalance < 0) {
         balance = 0;
         // paid too much, return the overcharge
         return Math.abs(newBalance);
      }
      else {
         balance = newBalance;
         return 0;
      }
   }
   /** Method to get the balance.
    *@return -balance
    */
   public double getBalance() {
      return balance;
   }
   /** Method that sets the interest rate.
    *@return -boolean
    *@param interestRateIn -
    */
   public boolean setInterestRate(double interestRateIn) {
      if (interestRateIn >= 0 && interestRateIn <= 1) {
         interestRate = interestRateIn;
         return true;
      }
      else {
         return false;
      }
   }
   /** Method to get Interest Rate.
    *@return -interestRate
    */
   public double getInterestRate() {
      return interestRate;
   }
   /**Method to charge interest.
    *
    */
   public void chargeInterest() {
      balance = balance * (1 + interestRate);
   }
   /** toString method.
    *@return -output
    */
   public String toString() {
      String output = "Name: " + customerName + "\r\n"
         + "Interest rate: " + interestRate + "%\r\n"
         + "Balance: $" + balance + "\r\n";
      return output;
   }
   /** Finds amount.
    *@return -output
    *@param amount -
    */
   public static boolean isAmountValid(double amount) {
      boolean output = false;
      if (amount >= 0) {
         output = true;
      }
      return output;
   }
   /** Determines if balance is over 0.
    *@return -output
    *@param loan -
    */
   public static boolean isInDebt(BankLoan loan) {
      boolean output = false;
      if (loan.getBalance() > 0) {
         return true;
      }
      return output;
   }
   /** Method to get loans.
    *@return -loansCreated
    */
   public static int getLoansCreated() { 
      return loansCreated;
   }
   /** Method to reset loans.
    *
    */
   public static void resetLoansCreated() { 
      loansCreated = 0;
   }

}