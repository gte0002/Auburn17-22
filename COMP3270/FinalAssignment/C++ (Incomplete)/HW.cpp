// Gabriel Emerson
// COMP3270 - Programming HW
// 4/13/21

#include<string>
#include<fstream>
#include<iostream>
#include<vector>
#include<sstream>
using namespace std;
// Algorithm declarations
int Algorithm1(int alg1Array[]);

int main() {
	//Read in the file and make array from the file.
	string in;
	std::vector<int> vec;
	std::stringstream ss(in);

  	ifstream File ("phw_input.txt");
 	if (File.is_open()) {
     	while (getline(File, in)) {
         
	cout << in << endl;
	for (int i; ss >> i;) {
        	vec.push_back(i);    
        	if (ss.peek() == ',')
            	ss.ignore();
    	}

    for (std::size_t i = 0; i < vec.size(); i++) {
        	std::cout << vec[i] << std::endl;
	}
	}
      	
	File.close();
   	
	}
   
   	else {
      		cout << "Unable to open file\n";
   	}
   	int* arr = &vec[10];
	// Running Algorithms 1-4
	int a;
	a = Algorithm1(arr);
	std::cout << "Algorithm-1: " << a << std::endl;

   	return 0;
}


int Algorithm1(int alg1Array[]) {
	int Q = 10;
	int maxSoFar=0;
	for (int L = 0; L < Q; L++) {
		for (int U = L; U < Q; U++) {
			int sum = 0;
			for (int I = L; I < U; I++) {
				sum = sum + alg1Array[I];
			}
		// Sum now contains the sum of alg1Array[0 to Q]
		maxSoFar = max(maxSoFar, sum);
		}
	}
	return maxSoFar;
}

int Algorithm2(int alg2Array[]) {
        // alg2 stuff
}

int Algorithm3(int alg3Array[]) {
        // alg3 stuff
}

int Algorithm4(int alg4Array[]) {
        // alg4 stuff
}
