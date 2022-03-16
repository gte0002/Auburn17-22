// Gabriel Emerson
// gte0002
// project4_gte0002.cpp
// complile using standard g++


#include <iostream>
#include <cstdlib>
#include <string>
#include <cassert>
using namespace std;

/***********UnComment UNIT_TESTING in order to put program into debugger mode************/
#define UNIT_TESTING

//Keep track of points
int totalPoints = 0;

//Structure for trivia node
struct TriviaNode {
   string question;
   string answer;
   int points;
};

//Trivia node pointer
typedef TriviaNode* TriviaNodePtr;

//Linked list class for trivia nodes
class TriviaList {
	public:
   TriviaList(){}
   TriviaList(string theQuestion, string theAnswer, int thePoints, TriviaList* theLink)
   {node.question = theQuestion; node.answer = theAnswer; node.points = thePoints; link = theLink;}
   TriviaList* getLink() {
      return link;}
   string getQuestion() {
      return node.question;}
   string getAnswer() {
      return node.answer;}
   int getPoints() {
      return node.points;}
   void setQuestion(string theQuestion) 	{node.question = theQuestion;}
   void setAnswer(string theAnswer)	{node.answer = theAnswer;}
   void setPoints(int thePoints)	{node.points = thePoints;}
   void setLink (TriviaList* pointer)	{link = pointer;}
	private:
   TriviaNode node;
   TriviaList* link;
};
typedef TriviaList* TriviaListPtr;

/****************************prototypes********************************/
//initList prototype
TriviaListPtr initList();

//addNode prototype
TriviaListPtr addNode(string theQuestion, string theAnswer, int thePoints, TriviaListPtr theLink);

//quizPlayer prototype
int quizPlayer(TriviaListPtr list, int numOfQuestions);

//getTrivia
TriviaListPtr getTrivia(TriviaListPtr head);

/**********************Testing***************************/
void test_initList();

void test_addNode();

void test_quizPlayer();

void test_getTrivia();

/***************************MAIN****************************/
int main() {
	#ifdef UNIT_TESTING
   test_quizPlayer();
   cout << "\n\nWould you like to perform more testing? (Yes/No): ";
   string response;
   getline(cin, response);
   while (response != "Yes" && response != "No") {
      cout << "Please enter valid input (Yes/No): ";
      getline(cin, response);
   }
   if (response == "Yes") {
      cout << "\nMore Testing:\n\n";
      test_initList();
      test_addNode();
      test_getTrivia();
      cout << "\nEnd of extra testing\n";
   }
	#else
   TriviaListPtr head = NULL;
   cout << "*** Welcome to Gabe's trivia quiz game ***\n";
   cout << "Would you like to enter your own trivia? (Yes/No): ";
   string ans;
   getline(cin, ans);
   while (ans != "Yes" && ans != "No") {
      cout << "Please enter valid input (Yes/No): ";
      getline(cin, ans);
   }
	//Get questions if the user wants to input their own
   if (ans == "Yes") {
      string cont;
      do {
      	//Get input
         head = getTrivia(head);
      	//Prompt for more
         cout << "Continue? (Yes/No): ";
         getline(cin, cont);
      	//Get valid yes/no
         while (cont != "Yes" && cont != "No") {
            cout << "Please enter valid input (Yes/No): ";
            getline(cin, cont);
         }
      }
      while (cont == "Yes");
   }
   //Initialize list
   else {
      head = initList();
   }
   cout << endl;
   cout << "How many questions would you like to answer? ";
   int questions;
   cin >> questions;
   int test;
   test = quizPlayer(head, questions);
	//Check if number is valid
   while (test == 1) {
      cout << "Enter a valid number: ";
      cin >> questions;
      test = quizPlayer(head, questions);
   }
	//Game is over
   cout << "\n*** Thank you for playing the trivia quiz game. Goodbye! ***\n";
	#endif
}

/********************************DEFINITIONS**************************************/
TriviaListPtr initList() {
   TriviaListPtr head;
	//Question 3
   string q = "What is the best-selling video game of all time? (Call of Duty or Wii Sports)";
   string a = "Wii Sports";
   int p = 20;
   head = new TriviaList(q, a, p, NULL);
	//Question 2
   q = "What was Bank of America's original name? (Hint Bank of Italy or Bank of Germany)";
   a = "Bank of Italy";
   p = 50;
   head = new TriviaList(q, a, p, head);
	//Question 1
   q = "How long was the shortest war on record? (Hint: how many minutes)";
   a = "38";
   p = 100;
   head = new TriviaList(q, a, p, head);
   return head;
}

//DEF addNode
TriviaListPtr addNode(string theQuestion, string theAnswer, int thePoints, TriviaListPtr theLink) {
   TriviaListPtr head = new TriviaList(theQuestion, theAnswer, thePoints, theLink);
   return head;
}

//DEF quizPlayer
int quizPlayer(TriviaListPtr list, int numOfQuestions) {
	//Valid number of questions
   if (numOfQuestions <= 0) {
      cout << "Warning - The number of trivia to be asked must be equal to or larger than 1\n";
      return 1; //failed
   }
   //Make sure valid trivia list
   else if (list == NULL) {
      cout << "Warning - an empty list is not a valid trivia list\n";
      return 1; //failed
   }
   else {
      TriviaListPtr head = list;
      TriviaListPtr next = head->getLink();
      int size = 1;
   	//Make sure there are enough questions
      while (next != NULL) {
         next = next->getLink();
         size++;
      }
      if (size < numOfQuestions) {
         cout << "Warning - there are only " << size << " trivia questions\n";
         return 1; //failed
      }
      else {
      	//put next at start of list, now ask the questions
         next = head;
         string answer;
         int index = 0;
         do {
            cout << "Question: " << next->getQuestion() << endl;
            cout << "Answer: ";
            getline(cin, answer);
         	//issues in driver
            if (answer == "") {
               getline(cin, answer);
            }
         	//Answer correct
            if (answer == next->getAnswer()) {
               cout << "Your answer is correct. You receive " << next->getPoints() << " points.\n";
               totalPoints += next->getPoints();
            }
            //Answer is wrong
            else {
               cout << "Your answer is wrong. The correct answer is: " << next->getAnswer() << endl;
            }
            cout << "Your total points : " << totalPoints << "\n\n";
            next = next->getLink();
            index++;
         }
         //Ask questions until there is no more
         while (next != NULL && index < numOfQuestions);
         return 0; //Success
      }
   }
}

//DEF getTrivia
TriviaListPtr getTrivia(TriviaListPtr list) {
   TriviaListPtr head = list;
   string question;
   string answer;
   int p;
	//Get input
   cout << "Enter a question: ";
   getline(cin, question);
   cout << "Enter an answer: ";
   getline(cin, answer);
   cout << "Enter award points: ";
	//Check points
   while (!(cin >> p) || p <= 0) {
      cout << "Points must be a number greater than 0. Try again: ";
      cin.clear(); //Clears cin for error
      cin.ignore(1000, '\n'); //Makes sure next cin is next line.
   }
	//Add to head of list
   head = addNode(question, answer, p, head);
   cin.clear();
   cin.ignore(1000, '\n'); //Moves to next line for next cin input
   return head;
}

/*****************TESTING DEFINITIONS*********************/
//NOT REQUIRED IN PROJECT OUTLINE
void test_initList() {
   TriviaListPtr head = initList();
   cout << "Test for initList():\n";
   assert("How long was the shortest war on record? (Hint: how many minutes)" == head->getQuestion());
   assert("38" == head->getAnswer());
   assert(100 == head->getPoints());
   cout << "\tTrivia 1 matches\n";
   TriviaListPtr next = head->getLink();
   assert("What was Bank of America's original name? (Hint: Bank of Italy or Bank of Germany)" == next->getQuestion());
   assert("Bank of Italy" == next->getAnswer());
   assert(50 == next->getPoints());
   cout << "\tTrivia 2 matches\n";
   next = next->getLink();
   assert("What is the best-selling video game of all time? (Hint: Call of Duty or Wii Sports)" == next->getQuestion());
   assert("Wii Sports" == next->getAnswer());
   assert(20 == next->getPoints());
   assert(NULL == next->getLink());
   cout << "\tTrivia 3 matches\n";
}

//Defintion of test driver for test_addNode
void test_addNode() {
   cout <<"Test for addNode()\n";
	//Add to Empty list/new List
   TriviaListPtr head = NULL;
   head = addNode("test", "test", 5, head);
   assert("test" == head->getQuestion());
   assert("test" == head->getAnswer());
   assert(5 == head->getPoints());
   assert(NULL == head->getLink());
   cout << "\tTest 1: Empty/new list passed\n";
	//Add to list with stuff in it. Head already has test data in it, so use it
   head = addNode("test2", "test2", 20, head);
   assert("test2" == head->getQuestion());
   assert("test2" == head->getAnswer());
   assert(20 == head->getPoints());
   TriviaListPtr next = head->getLink();
   assert("test" == next->getQuestion());
   assert("test" == next->getAnswer());
   assert(5 == next->getPoints());
   assert(NULL == next->getLink());
   cout << "\tTest 2: Add to existing list passed\n";
}

//Definition of test driver for test_quizPlayer
void test_quizPlayer() {
	//Create a list of the 3 questions. initList has already been tested to show it works
   TriviaListPtr list = initList();
   int test;
   cout << "*** This is a debug version ***\n";

	//Case 1: No questions
   cout << "Unit Test Case 1: Ask no questions. The program should give a warning message.\n";
   test = quizPlayer(list, 0);
   cout << "Case 1 Passed\n";

	//Case 2.1: Ask 1 question, give incorrect answer
   cout << "\n Unit Test Case 2.1: Ask 1 question in the linked list. The tester enters an incorrect answer.\n";
   test = quizPlayer(list, 1);
   assert(0 == totalPoints);
   cout << "Case 2.1 Passed\n";

	//Case 2.2: Ask 1 question, give correct answer
   cout << "\n Unit Test Case 2.2: Ask 1 question in the linked list. The tester enters a correct answer.\n";
   test = quizPlayer(list, 1);
   assert(100 == totalPoints);
   cout << "Case 2.2 Passed\n";

	//Case 3.1 Ask 3 questions, give incorrect answers
   totalPoints = 0; //Reset points
   cout << "\n Unit Test Case 3.1: Ask 3 questions, give all incorrect answers.\n";
   test = quizPlayer(list, 3);
   assert(0 == totalPoints);
   cout << "Case 3.1 Passed\n";

	//Case 3.2 Ask 3 questions, give correct answers
   cout << "\n Unit Test Case 3.2: Ask 3 questions, give all correct answers.\n";
   test = quizPlayer(list, 3);
   assert(170 == totalPoints);
   cout << "Case 3.2 Passed \n";

	//Case 4: Ask too many questions
   cout << "\n Unit Test Case 4: Ask 5 questions in the linked list.\n";
   test = quizPlayer(list, 5);

	//Case 5: empty list
   cout <<"\nTest Case 5: Use an empty trivia list. The program should give a warning\n";
   test = quizPlayer(NULL, 3);
	
   cout<<"*** End of Debug Version ***";
}

//Test driver for getTrivia
void test_getTrivia() {
   cout << "Test for getTrivia. Please input the following when prompted\nQuestion: How old are you?\nAnswer: 20\nPoints: 100\n";
   TriviaListPtr head = NULL;
   head = getTrivia(head);
   assert("How old are you?" == head->getQuestion());
   assert("20" == head->getAnswer());
   assert(100 == head->getPoints());
   cout << "Test passed\n";
}
