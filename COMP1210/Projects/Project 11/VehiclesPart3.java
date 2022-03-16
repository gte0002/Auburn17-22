import java.io.FileNotFoundException;
/** Main driver for Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Dec 8, 2017
 */
public class VehiclesPart3 {
     /** Main Method.
   *@param args -
   *@throws FileNotFoundException if file cannot open.
   */
   public static void main(String[] args) {
      try {
         UseTaxList taxList = new UseTaxList();
         if (args.length != 0) {
            String fileName = args[0];
            taxList.readVehicleFile(fileName);
         }
      
         System.out.println(taxList.summary() + taxList.listByOwner() 
            + taxList.listByUseTax() + taxList.excludedRecordsList());
      }
      catch (FileNotFoundException error) {
         System.out.println("*** File not found.\nProgram ending.");
      }
   }
   
}