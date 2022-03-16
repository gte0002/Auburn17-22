import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.SortedSet;
import java.util.TreeSet;

/**
* This program is for the word game Boggle.
* COMP 2210 - Assignment 4.
* @author Gabriel Emerson
* @version 3/24/2018
*/
public class Boggle implements WordSearchGame {
   private TreeSet<String> lexicon; 
   private List<Integer> path;
   private List<Integer> actualPath;
   private int length;
   private String[][] board;
   private Boolean[][]visited;
   private SortedSet<String> vaildWords;
   private int minLength;
   private boolean lexiconLoaded;

/**
* Constructor.
*/
   public Boggle() {
      path = new ArrayList<Integer>();
      actualPath = new ArrayList<Integer>();
      lexicon = new TreeSet<String>();
      vaildWords = new TreeSet<String>();
   }

/**
* Loads the lexicon. 
* @param fileName file loaded.
* @throws IllegalArgumentException if fileName is null.
*/
   public void loadLexicon(String fileName) {
      if (fileName == null) {
         throw new IllegalArgumentException("Incorrect entry");
      }
      Scanner fileScan;
      Scanner lineScanner;
      String line;
      try {
         fileScan = new Scanner(new FileReader(fileName));
         while (fileScan.hasNext()) {
            line = fileScan.nextLine();
            lineScanner = new Scanner(line);
            lineScanner.useDelimiter(" ");
            while (lineScanner.hasNext()) {
               lexicon.add(lineScanner.next());
            }
         
         }
      } 
      catch (IOException e) {
         throw new IllegalArgumentException("Incorrect entry");
      }
   
      lexiconLoaded = true;
   }

/**
* Sets the Boggle board.
* @param letterArray is the letters of the board.
* @throws IllegalArgumentException letterArray null, not square. 
*/
   public void setBoard(String[] letterArray) {
   
      if (letterArray == null) {
         throw new IllegalArgumentException("Incorrect Entry");
      }
      
      double dimension = Math.sqrt(letterArray.length);
   
      if (dimension % 1 > 0) {
         throw new IllegalArgumentException("Incorrect Entry");
      }
      
      else {
         length = (int) dimension;
         board = new String[length][length];
         visited = new Boolean[length][length];
         int count = 0;
         for (int i = 0; i < length; i++) {
            for (int j = 0; j < length; j++) {
               board[i][j] = letterArray[count].toLowerCase();
               visited[i][j] = false;
               count++;
            }
         }
      }
   }

/**
* FInds words on the board that are in the lexicon.
* @param minimumWordLength is the min length of the words.
* @return vaildWords is the list of the words on the board.
* @throws IllegalArgumentException min < 1, lexiconLoaded false.
*/
   public SortedSet<String> getAllValidWords(int minimumWordLength) {
      minLength = minimumWordLength;
      vaildWords.clear();
      
      if (!lexiconLoaded) {
         throw new IllegalStateException("Load Lexicon");
      }
      if (minimumWordLength < 1) {
         throw new IllegalArgumentException("Invalid Number");
      }
      
      for (int i = 0; i < length; i++) {
         for (int j = 0; j < length; j++) {
            findWord(board[i][j], i, j);
         }
      }
      return vaildWords;
   }

/**
* Finds if the word is in the lexicon.
* @param wordToCheck The word to check.
* @return true if wordToCheck is in lexicon, false if not.
* @throws IllegalArgumentException wordToCheck null, lexiconLoaded false.
*/
   public boolean isValidWord(String wordToCheck) {
   
      if (!lexiconLoaded) {
         throw new IllegalStateException("Load lexicon");
      }
      
      if (wordToCheck == null) {
         throw new IllegalArgumentException("Invalid word");
      }
   
      return lexicon.contains(wordToCheck);
   }

/**
* Finds if a word in the lexicon has the prefix.
* @param prefixToCheck The prefix to check
* @return true if prefixToCheck is in lexicon, false if not.
* @throws IllegalArgumentException, prefix null, lexiconLoaded false.
*/
   public boolean isValidPrefix(String prefixToCheck) {
   
      if (!lexiconLoaded) {
         throw new IllegalStateException("Load lexicon");
      }
      
      if (prefixToCheck == null) {
         throw new IllegalArgumentException("Invalid word");
      }
      
      return lexicon.ceiling(prefixToCheck).startsWith(prefixToCheck);
   }

/**
* Sees if the word is on the board.
* @param wordToCheck The word to check
* @return path is the path of the word on the board.
* @throws IllegalArgumentException wordToCheck null, lexiconLoaded false.
*/
   public List<Integer> isOnBoard(String wordToCheck) {
   
      if (!lexiconLoaded) {
         throw new IllegalStateException("Load lexicon");
      }
   
      if (wordToCheck == null) {
         throw new IllegalArgumentException("Invalid word");
      }
      
      path.clear();
      actualPath.clear();
   
      for (int i = 0; i < (int) length; i++) {
         for (int j = 0; j < length; j++) {
            if (Character.toUpperCase(board[i][j].charAt(0))
               == Character.toUpperCase(wordToCheck.charAt(0))) {
               path.add(i * length + j);
               recursionMethod(wordToCheck, board[i][j], i, j);
               if (!actualPath.isEmpty()) {
                  return actualPath;
               }
               path.clear();
               actualPath.clear();
            }
         }
      }
      return path;
   }

/**
* This finds the word in the getAllValidWords method.
* @param word is the word.
* @param x is the x value of the word.
* @param y is the y value of the word.
*/
   public void findWord(String word, int x, int y) {
   
      if (!isValidPrefix(word)) {
         return;
      }
   
      visited[x][y] = true;
   
      if (isValidWord(word) && word.length() >= minLength) {
         vaildWords.add(word.toUpperCase());
      }
   
      for (int i = -1; i <= 1; i++) {
         for (int j = -1; j <= 1; j++) {
            if ((x + i) <= ((int) length - 1)
               && (y + j) <= ((int) length - 1)
               && (x + i) >= 0 && (y + j) >= 0 && !visited[x + i][y + j]) {
               visited[x + i][y + j] = true;
               findWord(word + board[x + i][y + j], x + i, y + j);
               visited[x + i][y + j] = false;
            }
         }
      }
      visited[x][y] = false;
   }

/**
* This method is the recursion for isOnBoard.
* @param wordToCheck is the word to check.
* @param word is the current word your're using.
* @param x is the current x value.
* @param y is the current y value.
*/
   public void recursionMethod(String wordToCheck, String word, int x, int y) {
   
      visited[x][y] = true;
      if (!(isValidPrefix(word))) {
         return;
      }
      if (word.toUpperCase().equals(wordToCheck.toUpperCase())) {
         actualPath = new ArrayList(path);
         return;
      }
      for (int i = -1; i <= 1; i++) {
         for (int j = -1; j <= 1; j++) {
            if (word.equals(wordToCheck)) {
               return;
            }
            if ((x + i) <= (length - 1)
               && (y + j) <= (length - 1)
               && (x + i) >= 0 && (y + j) >= 0 && !visited[x + i][y + j]) {
               visited[x + i][y + j] = true;
               path.add((x + i) * length + y + j);
               recursionMethod(wordToCheck, word
                  + board[x + i][y + j], x + i, y + j);
               visited[x + i][y + j] = false;
               path.remove(path.size() - 1);
            }
         }
      }
      visited[x][y] = false;
      return;
   }

/**
* Gets the total score for all the words on the board.
* @param words is the set of words to be scored.
* @param minimumWordLength is the min word length.
* @return score is the score for the words.
*/
   public int getScoreForWords(SortedSet<String> words, int minimumWordLength) {
   
      if (!lexiconLoaded) {
         throw new IllegalStateException("Load lexicon");
      }
   
      if (minimumWordLength < 1) {
         throw new IllegalArgumentException("length must be > 0");
      }
   
      int score = 0;
   
      for (String word: words) {
         int size = word.length();
         score += 1 + (size - minimumWordLength);
      }
   
      return score;
   }

/**
* Prints the board into a single string.
* @return result is the string of the board.
*/
   public String getBoard() {
   
      String result = "";
      for (String[] s: board) {
         for (String string: s) {
         
            result = result + string;
         }
      }
   
      return result;
   }
}