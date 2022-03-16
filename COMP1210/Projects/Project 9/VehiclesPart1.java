/** Main driver for Vehicle.
 * Gabriel Emerson
 * Comp 1210 - 007
 * Nov 14, 2017
 */
public class VehiclesPart1 {
      /** Main Method.
   *@param args -
   */
   public static void main(String[] args) {
      Car car = new Car("Jones, Sam", "2017 Honda Accord", 22000, false);
      
      Truck truck = new Truck("Williams, Jo", "2012 Chevy Silverado", 
                                 30000, false, 1.5);
   
      SemiTractorTrailer semi = new SemiTractorTrailer("Williams, Pat", 
         "2012 International Big Boy", 45000, false, 5.0, 4);         
      
      Motorcycle moto = new Motorcycle("Brando, Marlon", 
         "1964 Harley-Davidson Sportster", 14000, false, 750);         
      
      System.out.println(car + "\n\n" + truck + "\n\n" + semi
         + "\n\n" + moto);
   }
}