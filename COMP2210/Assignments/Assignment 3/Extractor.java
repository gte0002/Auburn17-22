import java.io.File;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Scanner;
import java.util.SortedSet;
import java.util.TreeSet;

/**
 * Extractor.java. Implements feature extraction for collinear points in
 * two dimensional data.
 *
 * @author  YOUR NAME (YOU@auburn.edu)
 * @author  Dean Hendrix (dh@auburn.edu)
 * @version 2018-02-27
 *
 */
public class Extractor {
   
   /** raw data: all (x,y) points from source data. */
   private Point[] points;
   
   /** lines identified from raw data. */
   private SortedSet<Line> lines;
  
   /**
    * Builds an extractor based on the points in the file named by filename. 
    */
   public Extractor(String filename) {
      try {
         Scanner scan = new Scanner(new File(filename));
      
         int length = scan.nextInt();
         points = new Point[length];
         int i = 0;
      
         while (scan.hasNext()) {
            int x = scan.nextInt();
            int y = scan.nextInt();
            Point element = new Point(x, y);
            points[i] = element;
            i++;
         }
      }
      catch (Exception e) {
         System.out.println("File could not be scanned");
      }  
   }
  
   /**
    * Builds an extractor based on the points in the Collection named by pcoll. 
    *
    * THIS METHOD IS PROVIDED FOR YOU AND MUST NOT BE CHANGED.
    */
   public Extractor(Collection<Point> pcoll) {
      points = pcoll.toArray(new Point[]{});
   }
  
   /**
    * Returns a sorted set of all line segments of exactly four collinear
    * points. Uses a brute-force combinatorial strategy. Returns an empty set
    * if there are no qualifying line segments.
    */
   public SortedSet<Line> getLinesBrute() {
      lines = new TreeSet<Line>();
      
      Point[] result = Arrays.copyOf(points, points.length);
      
      for (int i = 3; i < result.length; i++) {
      
         for (int j = 2; j < i; j++) {
            for (int k = 1; k < j; k++) {
               for (int l = 0; l < k; l++) {
                  double slope1 = result[i].slopeTo(result[j]);
                  double slope2 = result[i].slopeTo(result[k]);
                  double slope3 = result[i].slopeTo(result[l]);
               
                  if (slope1 == slope2 && slope2 == slope3) {
                     Line newLine = new Line();
                     newLine.add(result[i]);
                     newLine.add(result[j]);
                     newLine.add(result[k]);
                     newLine.add(result[l]);
                     
                     lines.add(newLine);
                  }
               }
            }
         }
      }
      
      return lines;
   }
  
   /**
    * Returns a sorted set of all line segments of at least four collinear
    * points. The line segments are maximal; that is, no sub-segments are
    * identified separately. A sort-and-scan strategy is used. Returns an empty
    * set if there are no qualifying line segments.
    */
   public SortedSet<Line> getLinesFast() {
      lines = new TreeSet<Line>();
         
      Iterator itr = lines.iterator();
      
      Point[] copy = Arrays.copyOf(points, points.length);
      
      for (int n = 0; n < points.length; n++) {
         
         
         Arrays.sort(copy, points[n].slopeOrder);
         
         int equalSlopes = 0;
         
         for (int j = 0; j < points.length - 1; j = j + equalSlopes) {
            equalSlopes = 0;
            int i = 0;
            while (j + i < points.length
               && points[n].slopeOrder.compare(copy[j], copy[j + i]) == 0) {
               i++;
               equalSlopes++;
            }
            
            if (equalSlopes > 2) {
               Line newLine = new Line();
               newLine.add(points[n]);
               for (int k = 0; k < equalSlopes; k++) {
                  newLine.add(copy[j + k]);
               }
               
               lines.add(newLine);
            }
         }
      }
      return lines;
   }   
   
   
}
