//
// Kelkelyan_CS11_Project1.cpp:
// CS 11: Intro to C++
// January 3rd, 2023
// Long Beach City College


//This program displays a title "Employee Salary Records" and outputs 
// the header above, employee ID, Hours worked, rate per hour, and gross salary

#include <iostream> //include header file for Standard I/O
using namespace std;

int main()
{
    //Define Variables
    int EmpID;
    double HrsWkd;
    double Rph;
    double GrossSalary;
    
    //Ask For User-Input
    cout << "Please enter Employee ID: "; cin >> EmpID;
    cout << "Please enter Number of Hours Worked: "; cin >> HrsWkd;
    cout << "Please enter Rate per Hour: "; cin >> Rph;

    GrossSalary = HrsWkd * Rph; //calculate Gross Salary

    //Print Program Header
    cout << "\n***********************************************************\n";
    cout << "Aramis Kelkelyan\n";
    cout << "Program Name: Kelkelyan_CS11_Project1.cpp\n";
    cout << "Date: January 3rd, 2023\n";
    cout << "College, Course: Long Beach City College, CS 11 : Intro to C++ \n\n";
    cout << "===============================================================\n";

    //Print Requested Output
    cout << "\nEmployee Salary Records\n\n";
    cout << "EmployeeID: " << EmpID << "\n";
    cout << "Hours Worked: " << HrsWkd << "\n";
    cout << "Rate per Hour: " << Rph << "\n";
    cout << "Gross Salary: $" << GrossSalary << " / week \n" << endl;
    cout << "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" << endl;

    return 0;
}
