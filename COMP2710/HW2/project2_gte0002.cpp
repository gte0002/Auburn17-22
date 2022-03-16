//Gabriel Emerson
//gte0002
//project2_gte0002.cpp
//compile using standard g++

#include <iostream>
#include <cstdlib>
#include <cassert>
#include <ctime>
#include <iomanip>
using namespace std;
//Track Wins
int a_wins = 0;
int b_wins = 0;
int c_wins = 0;

bool at_least_two_alive(bool A_alive, bool B_alive, bool C_alive);
//Return true if at least two are alive

void Aaron_shoots1(bool& B_alive, bool& C_alive);
//Return false for Bob is killed || Return false if Charlie is killed

void Bob_shoots(bool& A_alive, bool& C_alive);
//Return false for Aaron is killed || Return false if Charlie is killed

void Charlie_shoots(bool& A_alive, bool& B_alive);
//Return false for Aaron is killed || Return false if Bob is killed

void Aaron_shoots2(bool& B_alive, bool& C_alive);
//Return false for Bob is killed || Return false if Charlie is killed

void duel_strat1(void);
//Changes global variables based on who wins

void duel_strat2(void);
//Changes global variables based on who wins

//Testing
void test_atleast_two_alive(void);
//tests at_least_two_alive()

void test_Aaron_shoots1(void);

void test_Bob_shoots(void);

void test_Charlie_shoots(void);

void test_Aaron_shoots2(void);


//MAIN
int main() {
   cout.setf(ios::fixed | ios::showpoint);
   const int NUMBER_OF_DUELS = 10000;
   srand(time(0)); //Random
   cout << "*** Welcome to Gabe's Duel Simulator ***\n";

   test_atleast_two_alive();
   cout << "Press any key to continue...";
   cin.ignore().get();
   test_Aaron_shoots1();
   cout << "Press any key to continue...";
   cin.ignore().get();
   test_Bob_shoots();
   cout << "Press any key to continue...";
   cin.ignore().get();
   test_Charlie_shoots();
   cout << "Press any key to continue...";
   cin.ignore().get();
   test_Aaron_shoots2();
   cout << "Press any key to continue...";
   cin.ignore().get();

	//Simulate Strat1
   cout << "Ready to test strategy 1 (run 10000 times):\n";
   cout << "Press any key to continue...";
   cin.ignore().get();
   cout << "...\n...\n...\n";
   int duelCount = 0;
   while (duelCount < NUMBER_OF_DUELS) {
      duel_strat1();
      duelCount++;
   }
   double a_percentage = (double) a_wins / (double) NUMBER_OF_DUELS;
   double b_percentage = (double) b_wins / (double) NUMBER_OF_DUELS;
   double c_percentage = (double) c_wins/ (double) NUMBER_OF_DUELS;
   int a_wins_Strat1 = a_wins;
   cout << "Aaron won " << a_wins << "/" << NUMBER_OF_DUELS << " duels or "
      << setprecision(2) << a_percentage * 100 << "%\n";
   cout << "Bob won " << b_wins << "/" << NUMBER_OF_DUELS << " duels or "
      << setprecision(2) << b_percentage * 100 << "%\n";
   cout << "Charlie won " << c_wins << "/" << NUMBER_OF_DUELS << " duels or "
      << setprecision(2) << c_percentage * 100 << "%\n\n";

	//Simulate Strat2
   cout << "Ready to test strategy 2 (run 10000 times):\n";
   cout << "Press any key to continue...";
   cin.ignore().get();
   cout << "...\n...\n...\n";
	//Reset duelCount and wins
   duelCount = 0;
   a_wins = 0;
   b_wins = 0;
   c_wins = 0;
   while (duelCount < NUMBER_OF_DUELS) {
      duel_strat2();
      duelCount++;
   }
   a_percentage = (double) a_wins / (double) NUMBER_OF_DUELS;
   b_percentage = (double) b_wins / (double) NUMBER_OF_DUELS;
   c_percentage = (double) c_wins/ (double) NUMBER_OF_DUELS;
   cout << "Aaron won " << a_wins << "/" << NUMBER_OF_DUELS << " duels or "
      << setprecision(2) << a_percentage * 100 << "%\n";
   cout << "Bob won " << b_wins << "/" << NUMBER_OF_DUELS << " duels or "
      << setprecision(2) << b_percentage * 100 << "%\n";
   cout << "Charlie won " << c_wins << "/" << NUMBER_OF_DUELS << " duels or "
      << setprecision(2) << c_percentage * 100 << "%\n";
	
	//Compare Strat1 to Strat2
   if (a_wins > a_wins_Strat1) {
      cout << "\nStrategy 2 is better than strategy 1\n";
   }
   else if (a_wins < a_wins_Strat1) {
      cout << "\nStrategy 1 is better than strategy 2\n";
   }
   else {
      cout << "\nThe strategies have the same outcomes\n";
   }
}

//Define
bool at_least_two_alive(bool A_alive, bool B_alive, bool C_alive) {
	//If Aaron is alive, check Bob and Charlie	
   if (A_alive) {
      if (B_alive || C_alive) {
         return true;
      }
   }
   //Check if Bob is alive and if so, Charlie
   else if (B_alive) {
      if (C_alive) {
         return true;
      }
   }
   //If neither aaron or bob is alive, then two cannot be alive
   else {
      return false;
   }
}
//Implement Aaron_shoots1()
void Aaron_shoots1(bool& B_alive, bool& C_alive) {
   const int AARON_PROBABILITY = 33;
   int shoot_target_result;
   shoot_target_result = rand()%100;
   if (shoot_target_result <= 33) {
      if (C_alive) {
         C_alive = false;
      }
      else {
         B_alive = false;
      }
   }
}

//Implement Bob_shoots()
void Bob_shoots(bool& A_alive, bool& C_alive) {
   const int BOB_PROBABILITY = 50;
   int shoot_target_result;
   shoot_target_result = rand()%100;
   if (shoot_target_result <= 50) {
      if (C_alive) {
         C_alive = false;
      }
      else {
         A_alive = false;
      }
   }
}

//Implement Charlie_shoots()
void Charlie_shoots(bool& A_alive, bool& B_alive) {
	//Charlie always hits
   if (B_alive) {
      B_alive = false;
   }
   else {
      A_alive = false;
   }
}

//Implement Aaron_shoots2()
void Aaron_shoots2(bool& B_alive, bool& C_alive) {
   const int AARON_PROBABILITY = 33;
   int shoot_target_result;
   if (!B_alive || !C_alive) {
      shoot_target_result = rand()%100;
      if (shoot_target_result <= 33) {
         if (C_alive) {
            C_alive = false;
         }
         else {
            B_alive = false;
         }
      }
   }
}

//Implements duel_Strat1()
void duel_strat1(void) {
   bool a_alive = true;
   bool b_alive = true;
   bool c_alive = true;
   while (at_least_two_alive(a_alive, b_alive, c_alive)) {
      if (a_alive) {
         Aaron_shoots1(b_alive, c_alive);
      }
      if (b_alive) {
         Bob_shoots(a_alive, c_alive);
      }
      if (c_alive) {
         Charlie_shoots(a_alive, b_alive);
      }
   }
	//Only one alive after loop
   if (a_alive) {
      a_wins++;
   }
   else if (b_alive) {
      b_wins++;
   }
   else {
      c_wins++;
   }
}

//Implements duel_Strat2()
void duel_strat2(void) {
   bool a_alive = true;
   bool b_alive = true;
   bool c_alive = true;
   while (at_least_two_alive(a_alive, b_alive, c_alive)) {
      if (a_alive) {
         Aaron_shoots2(b_alive, c_alive);
      }
      if (b_alive) {
         Bob_shoots(a_alive, c_alive);
      }
      if (c_alive) {
         Charlie_shoots(a_alive, b_alive);
      }
   }
	//Only one alive after loop
   if (a_alive) {                                                                                                                                a_wins++;
   }
   else if (b_alive) {
      b_wins++;
   }
   else {
      c_wins++;
   }
}

//*******************TESTING************************
//at_least_two_alive()
void test_atleast_two_alive(void) {
   cout << "Unit Testing 1: Function - at_least_two_alive()\n";
	
   cout<< "\tCase 1: Aaron alive, Bob alive, Charlie alive\n";
   assert(true == at_least_two_alive(true, true, true));
   cout << "\tCase passed...\n";
	
   cout<< "\tCase 2: Aaron dead, Bob alive, Charlie alive\n";
   assert(true == at_least_two_alive(false, true, true));
   cout << "\tCase passed...\n";

   cout<< "\tCase 3: Aaron alive, Bob dead, Charlie alive\n";
   assert(true == at_least_two_alive(true, false, true));
   cout << "\tCase passed...\n";
	
   cout<< "\tCase 4: Aaron alive, Bob alive, Charlie dead\n";
   assert(true == at_least_two_alive(true, true, false));
   cout << "\tCase passed...\n";
	
   cout<< "\tCase 5: Aaron dead, Bob dead, Charlie alive\n";
   assert(false == at_least_two_alive(false, false, true));
   cout << "\tCase passed...\n";
	
   cout<< "\tCase 6: Aaron dead, Bob alive, Charlie dead\n";
   assert(false == at_least_two_alive(false, true, false));
   cout << "\tCase passed...\n";
	
   cout<< "\tCase 7: Aaron alive, Bob dead, Charlie dead\n";
   assert(false == at_least_two_alive(true, false, false));
   cout << "\tCase passed...\n";
	
   cout<< "\tCase 8: Aaron dead, Bob dead, Charlie dead\n";
   assert(false == at_least_two_alive(false, false, false));
   cout << "\tCase passed...\n";
}

//Implements test driver Aaron_shoots1()
void test_Aaron_shoots1(void) {
   cout << "Unit Testing 2: Function Aaron_shoots1(Bob_alive, Charlie_alive)\n";
   bool bob_alive;
   bool charlie_alive;
	
   cout << "\tCase 1: Bob alive, Charlie alive\n";
   cout << "\t\tAaron is shooting at Charlie\n";
   bob_alive = true; 
   charlie_alive = true;
   Aaron_shoots1(bob_alive, charlie_alive);
	//Bob cant die
   assert(true == bob_alive);
	
   cout << "\tCase 2: Bob dead, Charlie alive\n";
   cout << "\t\tAaron is shooting at Charlie\n";
   bob_alive = false; 
   charlie_alive = true;
   Aaron_shoots1(bob_alive, charlie_alive);
	//Bob is dead, Aaron shoots charlie
   assert(false == bob_alive);
	
   cout << "\tCase 3: Bob alive, Charlie dead\n";
   cout << "\t\tAaron is shooting at Bob\n";
   bob_alive = true; 
   charlie_alive = false;
   Aaron_shoots1(bob_alive, charlie_alive);
	//Charlie is dead, Aaron shoots Bob
   assert(false == charlie_alive);
}

//Implements test for Bob_shoots()
void test_Bob_shoots(void) {
   cout << "Unit Testing 3: Function Bob_shoots(Aaron_alive, Charlie_alive)\n";
   bool a_alive;
   bool c_alive;
	
   cout << "\tCase 1: Aaron alive, Charlie alive\n";
   cout << "\t\tBob is shooting at Charlie\n";
   a_alive = true;
   c_alive - true;
   Bob_shoots(a_alive, c_alive);
	//Shooting at Charlie, Aaron must live
   assert(true == a_alive);
	
   cout << "\tCase 2: Aaron dead, Charlie alive\n";
   cout << "\t\tBob is shooting at Charlie\n";
   a_alive = false;
   c_alive - true;
   Bob_shoots(a_alive, c_alive);
	//Bob is shooting at Charlie, Aaron is dead
   assert(false == a_alive);
	
   cout << "\tCase 3: Aaron alive, Charlie dead\n";
   cout << "\t\tBob is shooting at Aaron\n";
   a_alive = true;
   c_alive = false;
   Bob_shoots(a_alive, c_alive);
	//Bob is shooting Aaron, Charlie is dead
   assert(false == c_alive);
}

//Implements test for Charlie_shoots()
void test_Charlie_shoots(void) {
   cout << "Unit Testing 4: Function Charlie_shoots(Aaron_alive, Bob_alive)\n";
   bool a_alive;
   bool b_alive;
	
   cout << "\tCase 1: Aaron alive, Bob alive\n";
   cout << "\t\tCharlie is shooting at Bob\n";
   a_alive = true;
   b_alive = true;
   Charlie_shoots(a_alive, b_alive);
   assert(true == a_alive);
   assert(false == b_alive);
	
   cout << "\tCase 2: Aaron dead, Bob alive\n";
   cout << "\t\tCharlie is shooting at Bob\n";
   a_alive = false;
   b_alive = true;
   Charlie_shoots(a_alive, b_alive);
	//Charlie shooting at Bob, Aaron is dead
   assert(false == a_alive);
   assert(false == b_alive);
	
   cout << "\tCase 3: Aaron alive, Bob dead\n";
   cout << "\t\tCharlie is shooting at Aaron\n";
   a_alive = true;
   b_alive = false;
   Charlie_shoots(a_alive, b_alive);
	//Charlie is shooting Aaron, Bob is dead
   assert(false == b_alive);
   assert(false == a_alive);
}

//Implements test for Aaron_shoots2()
void test_Aaron_shoots2(void) {
   cout << "Unit Testing 5: Function Aaron_shoots2(Bob_alive, Charlie_alive)\n";
   bool b_alive;
   bool c_alive;
	
   cout << "\tCase 1: Bob alive, Charlie alive\n";
   cout << "\t\tAaron intentionally misses his first shot\n";
   b_alive = true;
   c_alive = true;
   Aaron_shoots2(b_alive, c_alive);
   assert(true == b_alive);
   assert(true == c_alive);
   cout << "\t\tBoth Bob and Charlie are alive\n";
	
   cout << "\tCase 2: Bob dead, Charlie alive\n";
   cout << "\t\tAaron is shooting at Charlie\n";
   b_alive = false;
   c_alive = true;
   Aaron_shoots2(b_alive, c_alive);
	//Aaron is shooting at Charlie, Bob is dead
   assert(false == b_alive);
	
   cout << "\tCase 3: Bob alive, Charlie dead\n";
   cout << "\t\tAaron is shooting at Bob\n";
   b_alive = true;
   c_alive = false;
   Aaron_shoots2(b_alive, c_alive);
	//Aaron is shooting at Bob and Charlie is already dead
   assert(false == c_alive);
}
