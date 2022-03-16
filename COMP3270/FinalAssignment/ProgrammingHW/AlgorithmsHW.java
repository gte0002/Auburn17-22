/*
* @author Gabriel Emerson           
* @version 4/13/21
*
* Comp 3270 
* Programming Homework Assignment
* 
* I certify that I wrote the code I am submitting. I did not copy whole or parts of it 
* from another student or have another person write the code for me. Any code I am
* reusing in my program is clearly marked as such with its source clearly identified in comments.
*
* -----------------Websites used for help in making this program--------------------*
* https://www.javatpoint.com/java-string-to-int                                     *
* https://www.geeksforgeeks.org/split-string-java-examples/                         *
* https://www.geeksforgeeks.org/java-system-nanotime-vs-system-currenttimemillis/   *
* https://www.geeksforgeeks.org/java-io-printwriter-class-java-set-1/               *
* ----------------------------------------------------------------------------------*
*/
import java.lang.System;
import java.util.Scanner;
import java.io.File;
import java.io.IOException;
import java.util.Random;
import java.io.PrintWriter;

/******************************************************************/

public class AlgorithmsHW {

   public static void main(String[] args) throws IOException {
   
   // Read file
      File filein = new File("phw_input.txt");
      Scanner fileScan = new Scanner(filein);
      int[] arrayIn = new int[10];
      
   // Seperate commas from input line of int
      String numInput = fileScan.nextLine();
      String[] numSep = numInput.split(",");
   
   // Put into arrayIn   
      for (int i = 0; i < arrayIn.length; i++) {
         arrayIn[i] = Integer.parseInt(numSep[i]);
      }
   
   // Run each algorithm on arrayIn
      AlgorithmsHW test = new AlgorithmsHW();
      System.out.println("algorithm-1: " + test.Algorithm1(arrayIn));
      System.out.println("algorithm-2: " + test.Algorithm2(arrayIn));
      System.out.println("algorithm-3: " + test.MaxSum(arrayIn, 0, 9));
      System.out.println("algorithm-4: " + test.Algorithm4(arrayIn));
   
   // Next step:
   
      int arrayVal = 0;
      int[][] storeArrays = new int[19][];
      
   // Create 19 integer arrays with length 10, 15, 20, ... 95, 100 
      for (int i = 10; i <= 100; i = i + 5) {
         int[] tArray = new int[i];
         
         for (int j = 0; j < i; j++) {
         // Generate random values between 200 and -200
            int r = new Random().nextInt(200 + 200) - 200;
            tArray[j] = r;
         }
         
         storeArrays[arrayVal] = tArray;
         arrayVal++;
      }
   
   // Create matrix for time data
      long[][] inputMatrix = new long[19][8];
      
      // Algorithm1 Time
      for (int i = 0; i < 19; i++) {
      
         long t1 = System.nanoTime();
         long result = 0;
         
         //Testing 1000 Runs
         for (int j = 0; j < 1000; j++) {
            test.Algorithm1(storeArrays[i]);
            long t2 = System.nanoTime();
            long difference = t2 - t1;
            result = result + difference;
         }
        
         long average = result / 1000;
         inputMatrix[i][0] = average;
      }
   
      // Algorithm2 Time
      for (int i = 0; i < 19; i++) {
      
         long t1 = System.nanoTime();
         long result = 0;
         
         // Testing 1000 runs
         for (int j = 0; j < 1000; j++) {
            test.Algorithm2(storeArrays[i]);
            long t2 = System.nanoTime();
            long difference = t2 - t1;
            result = result + difference;
         }
        
         long average = result / 1000;
         inputMatrix[i][1] = average;
      }
      
      // Algorithm3 Time
      for (int i = 0; i < 19; i++) {
      
         long t1 = System.nanoTime();
         long result = 0;
         
         // Testing 1000 runs
         for (int j = 0; j < 1000; j++) {
            test.MaxSum(storeArrays[i], 0, storeArrays[i].length - 1);
            long t2 = System.nanoTime();
            long difference = t2 - t1;
            result = result + difference;
         }
        
         long average = result / 1000;
         inputMatrix[i][2] = average;
      }
      
      // Algorithm4 Time
      for (int i = 0; i < 19; i++) {
      
         long t1 = System.nanoTime();
         long result = 0;
         
         // Testing 1000 runs
         for (int j = 0; j < 1000; j++) {
            test.Algorithm4(storeArrays[i]);
            long t2 = System.nanoTime();
            long difference = t2 - t1;
            result = result + difference;
         }
        
         long average = result / 1000;
         inputMatrix[i][3] = average;
      }
   
      /* Run the ceiling function and add to matrix.
       * Ceiling values are modified by multiplying by 100k. This is done to add more consistency
       * to our data.
       */
      
      
      int location = 0;   
      for (int i = 10; i <= 100; i = i + 5) {
         inputMatrix[location][4] = (long)Math.ceil(Math.pow(i, 3) * 100000);
         inputMatrix[location][5] = (long)Math.ceil(Math.pow(i, 2) * 100000);
         inputMatrix[location][6] = (long)Math.ceil(i * Math.log(i) * 100000);
         inputMatrix[location][7] = (long)Math.ceil(i) * 100000;
         location++;
      }
      
      String[] output = new String[19];
      
      for (int i = 0; i < 19; i++) {
         String line = "";
         
         for (int j = 0; j <= 6; j++) {
            line = line + inputMatrix[i][j] + ",";
         }
         
         line = line + inputMatrix[i][7];
         output[i] = line;
      }
   
      // Write all data to output file
      try {
         PrintWriter outputFile = new PrintWriter("gte0002_phw_output.txt");
         outputFile.println("algorithm-1,algorithm-2,algorithm-3,algorithm-4,T1(n),T2(n),T3(n), T4(n)");
         
         for (String temp : output) {
            outputFile.println(temp);
         }
         outputFile.close();
      }
      catch (IOException e) {
         System.out.println("Error with output file!");
      }
   }
   
   /************* Algorithms 1-4 **************/
   
   //Algorithm1, Cost: O(n^3)
   public int Algorithm1(int[] x) {
      int maxSoFar = 0;
      int p = 0;
      int q = x.length;
      
      for (int l = p; l <= q; l++) {
         for (int u = l; u <= q; u++) {
            int sum = 0;
         
            for (int i = l; i < u; i++) {
               sum = sum + x[i]; 
             // sum now contains the sum of X[L..U]
            }
         
            maxSoFar = Math.max(maxSoFar, sum);
         }
      }
      
   
      return maxSoFar;
   }
  
  // Algorithm2, Cost: O(n^2)
   public int Algorithm2(int[] x) {
      int maxSoFar = 0;
      int p = 0;
      int q = x.length;
   
      for (int l = p; l <= q; l++) {
         int sum = 0;
         for (int u = l; u < q; u++) {
            sum = sum + x[u];
          /* sum now contains the sum of X[L..U] */ 
          
            maxSoFar = Math.max(maxSoFar, sum);
         }
      }
      
      return maxSoFar;
   }
   
   //Algorithm3, Cost: nlogn
   public int MaxSum(int[] x, int l, int u) {
      if (l > u) {
         return 0;
      }
      
      if (l == u) {
         return Math.max(0, x[l]);
      }
      
      int m = (l + u) / 2;
      
     // Left side
      int sum = 0;
      int maxToLeft = 0;
      for (int i = m; i >= l; i--) {
         sum = sum + x[i];
         maxToLeft = Math.max(maxToLeft, sum);
      }
      
     // Right side
      sum = 0;
      int maxToRight = 0;
      
      for (int i = (m + 1); i <= u; i++) {
         sum = sum + x[i];
         maxToRight = Math.max(maxToRight, sum);
      }
      
      int maxCrossing = maxToLeft + maxToRight;
      int maxInA = MaxSum(x, l, m);
      int maxInB = MaxSum(x, m + 1, u);
      
      return max(maxCrossing, maxInA, maxInB);
   }
   
   //Algorithm4, Cost: O(n)
   public int Algorithm4(int[] x) {
      int p = 0;
      int q = x.length;
      int maxSoFar = 0;
      int maxEndingHere = 0;
      
      for (int i = p; i < q; i++) {
         maxEndingHere = Math.max(0, maxEndingHere + x[i]);
         maxSoFar = Math.max(maxSoFar, maxEndingHere);
      }
   
      return maxSoFar;
   }
   
   // Max function used in algorithm3, best cost: 6, worst cost: 12 
   public int max(int x, int y, int z) {
      if (x > y && x > z) 
         return x;
         
      else if (y > x && y > z) 
         return y; 
         
      else 
         return z;   
   } 
   
}