/**
 * Exam question on singly-linked nodes.
 *
 * @author Dean Hendrix (dh@auburn.edu)
 * @version 2017-10-31
 */
public class SinglyLinked {

   /** Defines a node class. */
   static class Node {
      Object element;
      Node next;
   
      public Node(Object elmt, Node nxt) {
         element = elmt;
         next = nxt;
      }
   }

   //////////////////////////////////////////////////////
   // YOU MUST COMPLETE THE BODY OF THE LENGTH METHOD. //
   //////////////////////////////////////////////////////

   /** 
    * Returns the length of the pointer chain; that is, the number of
    * nodes accessible from n.
    */
   public static int length(Node n) {
      if (n == null) { //base case
         return 0;
      }
      int count = 0;
      Node current = n;
      while (current != null) {
         count++;
         current = current.next;
      }
      return count;
   }


   /** Provides an example call to length. */
   public static void main(String[] args) {
      Node n = new Node(2, new Node(4, new Node(6, null)));
      System.out.println(length(n)); // prints 3
   }

}
