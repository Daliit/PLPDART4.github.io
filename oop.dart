import 'dart:io';

// Define an interface for Printable
abstract class Printable {
  void printInfo();
}

// Define a class for Person implementing Printable interface
class Person implements Printable {
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Method to print person's info
  @override
  void printInfo() {
    print('Name: $name');
    print('Age: $age');
  }
}

// Define a subclass Student inheriting from Person
class Student extends Person {
  String major;

  // Constructor
  Student(String name, int age, this.major) : super(name, age);

  // Override the printInfo method
  @override
  void printInfo() {
    super.printInfo(); // Call superclass's printInfo method
    print('Major: $major');
  }
}

// Function to read data from a file and initialize a Student object
Student readStudentFromFile(String filename) {
  File file = File(filename);
  List<String> lines = file.readAsLinesSync();
  if (lines.length >= 3) {
    String name = lines[0];
    int age = int.tryParse(lines[1]) ?? 0;
    String major = lines[2];
    return Student(name, age, major);
  } else {
    throw FormatException('Invalid file format');
  }
}

void main() {
  // Create a Student object initialized from file
  try {
    var student = readStudentFromFile('student_data.txt');
    print('Student Details:');
    student.printInfo();
  } catch (e) {
    print('Error: $e');
  }

  // Method demonstrating the use of a loop
  print('\nCounting from 1 to 5:');
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}
