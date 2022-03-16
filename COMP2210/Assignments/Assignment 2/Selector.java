import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.NoSuchElementException;

/**
* Defines a library of selection methods on Collections.
*
* @author  Gabriel Emerson (gte0002@auburn.edu)
* @author  Dean Hendrix (dh@auburn.edu)
* @version 2018-01-25
*
*/
public final class Selector {

/**
 * Can't instantiate this class.
 *
 * D O   N O T   C H A N G E   T H I S   C O N S T R U C T O R
 *
 */
   private Selector() { }


/**
 * Returns the minimum value in the Collection coll as defined by the
    * Comparator comp. If either coll or comp is null, this method throws an
    * IllegalArgumentException. If coll is empty, this method throws a
    * NoSuchElementException. This method will not change coll in any way.
    *
    * @param coll    the Collection from which the minimum is selected
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        the minimum value in coll
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
   public static <T> T min(Collection<T> coll, Comparator<T> comp) {
      // If the collection or the comparator is null.   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      // If the collection does not have any elements.
      if (coll.isEmpty()) {
         throw new NoSuchElementException();
      }
      // If the collection has one element.
      if (coll.size() == 1) {
         return coll.iterator().next();
      }
      T low = coll.iterator().next();
      for (T o : coll) {
      
         if (comp.compare(o, low) < 0) {
            low = o;
         }
      
      }
      return low;
   }

/**
    * Selects the maximum value in the Collection coll as defined by the
    * Comparator comp. If either coll or comp is null, this method throws an
    * IllegalArgumentException. If coll is empty, this method throws a
    * NoSuchElementException. This method will not change coll in any way.
    *
    * @param coll    the Collection from which the maximum is selected
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        the maximum value in coll
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
   public static <T> T max(Collection<T> coll, Comparator<T> comp) {   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      if (coll.isEmpty()) {
         throw new NoSuchElementException();
      }
      if (coll.size() == 1) {
         return coll.iterator().next();
      }
      T high = coll.iterator().next();
      for (T o : coll) {
      
         if (comp.compare(o, high) > 0) {
            high = o;
         }
      }
      return high;
   }
/**
    * Selects the kth minimum value from the Collection coll as defined by the
    * Comparator comp. If either coll or comp is null, this method throws an
    * IllegalArgumentException. If coll is empty or if there is no kth minimum
    * value, this method throws a NoSuchElementException. This method will not
    * change coll in any way.
    *
    * @param coll    the Collection from which the kth minimum is selected
    * @param k       the k-selection value
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        the kth minimum value in coll
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
    
   public static <T> T kmin(Collection<T> coll, int k, Comparator<T> comp) {
   
      // If the collection or the comparator is null.   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      // If the collection does not have any elements.
      if (coll.isEmpty() || k < 1 || k > coll.size()) {
         throw new NoSuchElementException();
      }
      // If the collection has one element.
      if (coll.size() == 1 && k == 1) {
         return coll.iterator().next();
      }
      ArrayList<T> copy = new ArrayList<T>(coll);
      java.util.Collections.sort(copy, comp);
      ArrayList<T> rankSort = new ArrayList<T>(0); 
      
      int rankCount = 1;
      int nextCount = 1;
     
      for (T present : copy) {
         if (comp.compare(present, copy.get(nextCount)) != 0) {
            
            if (k == rankCount) {
               return present;
            }
            else {
               rankSort.add(present);
               rankCount++;
            }    
         }
         nextCount++;
      }
   
        
      return rankSort.get(k - 1);
   }
/**
    * Selects the kth maximum value from the Collection coll as defined by the
    * Comparator comp. If either coll or comp is null, this method throws an
    * IllegalArgumentException. If coll is empty or if there is no kth maximum
    * value, this method throws a NoSuchElementException. This method will not
    * change coll in any way.
    *
    * @param coll    the Collection from which the kth maximum is selected
    * @param k       the k-selection value
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        the kth maximum value in coll
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
    
   public static <T> T kmax(Collection<T> coll, int k, Comparator<T> comp) {
   
      // If the collection or the comparator is null.   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      // If the collection does not have any elements.
      if (coll.isEmpty() || k < 1 || k > coll.size()) {
         throw new NoSuchElementException();
      }
      // If the collection has one element.
      if (coll.size() == 1 && k == 1) {
         return coll.iterator().next();
      }
      ArrayList<T> copy = new ArrayList<T>(coll);
      java.util.Collections.sort(
               copy, java.util.Collections.reverseOrder(comp));
      ArrayList<T> rankSort = new ArrayList<T>(0); 
      
      int rankCount = 1;
      int nextCount = 1;
   
      for (T present : copy) {                       
         if (comp.compare(present, copy.get(nextCount)) != 0) {
            
            if (k == rankCount) {
               return present;
            }
            else {
               rankSort.add(present);
               rankCount++;
            }
            
         }
         nextCount++;
      }
   
      return rankSort.get(k - 1);
   
   }
/**
    * Returns a new Collection containing all the values in the Collection coll
    * that are greater than or equal to low and less than or equal to high, as
    * defined by the Comparator comp. The returned collection must contain only
    * these values and no others. The values low and high themselves do not have
    * to be in coll. Any duplicate values that are in coll must also be in the
    * returned Collection. If no values in coll fall into the specified range or
    * if coll is empty, this method throws a NoSuchElementException. If either
    * coll or comp is null, this method throws an IllegalArgumentException. This
    * method will not change coll in any way.
    *
    * @param coll    the Collection from which the range values are selected
    * @param low     the lower bound of the range
    * @param high    the upper bound of the range
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        a Collection of values between low and high
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
    
   public static <T> Collection<T> range(Collection<T> coll, T low, T high, 
                                         Comparator<T> comp) {
                                         
      // If the collection or the comparator is null.   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      // If the collection does not have any elements.
      if (coll.isEmpty()) {
         throw new NoSuchElementException();
      }
      ArrayList<T> copy = new ArrayList<T>(coll);
      ArrayList<T> valArray = new ArrayList<T>(0);
      if (comp.compare(low, high) <= 0) {
      
         for (T e : copy) {
            if (comp.compare(e, low) >= 0 && comp.compare(e, high) <= 0) {
               valArray.add(e);
            }
         }
         
      }
      //If there are no qualifying values.
      if (valArray.size() == 0) {
         throw new NoSuchElementException();
      }
      return valArray;
   }
/**
    * Returns the smallest value in the Collection coll that is greater than
    * or equal to key, as defined by the Comparator comp. The value of key
    * does not have to be in coll. If coll or comp is null, this method throws
    * an IllegalArgumentException. If coll is empty or if there is no
    * qualifying value, this method throws a NoSuchElementException. This
    * method will not change coll in any way.
    *
    * @param coll    the Collection from which the ceiling value is selected
    * @param key     the reference value
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        the ceiling value of key in coll
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
    
   public static <T> T ceiling(Collection<T> coll, T key, Comparator<T> comp) {
   
      // If the collection or the comparator is null.   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      // If the collection does not have any elements.
      if (coll.isEmpty()) {
         throw new NoSuchElementException();
      }
      
      Collection<T> range = range(coll, key, (max(coll, comp)), comp);
     // If the collection does not have any elements.
      if (range.isEmpty()) {
         throw new NoSuchElementException();
      }
      T value = min(range, comp);
   
      return value;
   }
/**
    * Returns the largest value in the Collection coll that is less than
    * or equal to key, as defined by the Comparator comp. The value of key
    * does not have to be in coll. If coll or comp is null, this method throws
    * an IllegalArgumentException. If coll is empty or if there is no
    * qualifying value, this method throws a NoSuchElementException. This
    * method will not change coll in any way.
    *
    * @param coll    the Collection from which the floor value is selected
    * @param key     the reference value
    * @param comp    the Comparator that defines the total order on T
    * @param <T>     parameter for the object
    * @return        the floor value of key in coll
    * @throws        IllegalArgumentException as per above
    * @throws        NoSuchElementException as per above
    */
    
   public static <T> T floor(Collection<T> coll, T key, Comparator<T> comp) {
     
      // If the collection or the comparator is null.   
      if (coll == null || comp == null) {
         throw new IllegalArgumentException();
      }
      // If the collection does not have any elements.
      if (coll.isEmpty()) {
         throw new NoSuchElementException();
      }
     
      Collection<T> range = range(coll, (min(coll, comp)), key, comp);
      
      // If the collection does not have any elements.
      if (range.isEmpty()) {
         throw new NoSuchElementException();
      }
      T value = max(range, comp);
   
      return value;
   }
}
