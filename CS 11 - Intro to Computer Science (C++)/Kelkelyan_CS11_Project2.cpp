/* Author's Name: Aramis Kelkelyan
// Kelkelyan_CS11_Project2.cpp:
// CS 11: Intro to C++
// January 6th, 2023
 Long Beach City College */


 //This program accepts the Student's ID, First & Last Name, and students score.
 // It calculates and outputs the student’s total, letter grade, and the class average scores

#include <iostream> //include header file for Standard I/O
#include <string>
using namespace std;

int main()
{
	//Define Variables
	int ID = int(); cout << "Please enter Student ID: "; cin >> ID;
	string First = string(); cout << "Please enter Student's First Name: "; cin >> First;
	string Last = string(); cout << "Please enter Student's Last Name: "; cin >> Last;
	double ScoreCS11 = double(); cout << "Please enter Student's CS11 Score: "; cin >> ScoreCS11;
	double ScoreCS12 = double(); cout << "Please enter Student's CS12 Score: "; cin >> ScoreCS12;
	double ScoreCS22 = double(); cout << "Please enter Student's CS22 Score: "; cin >> ScoreCS22;
	double average = double();
	char grade = char();

	average = (ScoreCS11 + ScoreCS12 + ScoreCS22) / 3;

	// Classify Grade
	if (average >= 90)
		grade = 'A';
	else if (average >= 80)
		grade = 'B';
	else if (average >= 70)
		grade = 'C';
	else if (average >= 60)
		grade = 'D';
	else
		grade = 'F';

	// Print Program Header
	cout << "\n\n===============================================================\n\n";
	cout << "Student Grading System (SGS)\n";
	cout << "College, Course: Long Beach City College, CS 11 : Intro to C++ \n";
	cout << "Author: Aramis Kelkelyan\n";
	cout << "Date: January 6th, 2023\n";
	cout << "\n===============================================================\n\n";

	// Print Requested Output
	cout << "ID: " << ID << endl;
	cout << "First Name: " << First << endl;
	cout << "Last Name: " << Last << endl;
	cout << "Total: " << ScoreCS11 + ScoreCS12 + ScoreCS22 << endl;
	cout << "Average: " << average << "%" << endl;
	cout << "Grade: " << grade << endl;

	// Display Congradulations or Warning Message
	if (grade == 'A') // (average >= 90)
		cout << "Comments: Congratulations on your achievements!" << endl;
	else if (grade == 'F') // (average < 60) 
		cout << "Comments: Warning! Your marks are not passing. Must retake failed courses!" << endl;

	cout << "\n===============================================================\n\n";


return 0;
}
