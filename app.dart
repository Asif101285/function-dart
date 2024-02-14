import 'dart:io';

class AttendanceApp {
  Map<String, bool> students = {};

  void addStudent(String name) {
    students[name] = false;
    print('Student $name added successfully.');
  }

  void markAttendance(String name) {
    if (students.containsKey(name)) {
      students[name] = true;
      print('Attendance marked for $name.');
    } else {
      print('Student $name not found.');
    }
  }

  void displayReport() {
    print('Attendance Report:');
    students.forEach((name, attended) {
      print('$name: ${attended ? 'Present' : 'Absent'}');
    });
  }

  void run() {
    print('Welcome to Attendance App!');
    while (true) {
      print('\n1. Add Student\n2. Mark Attendance\n3. Display Report\n4. Exit');
      stdout.write('Enter your choice: ');
      var choice = int.tryParse(stdin.readLineSync() ?? '');
      switch (choice) {
        case 1:
          stdout.write('Enter student name: ');
          var name = stdin.readLineSync();
          if (name != null && name.isNotEmpty) {
            addStudent(name);
          } else {
            print('Invalid name!');
          }
          break;
        case 2:
          stdout.write('Enter student name: ');
          var name = stdin.readLineSync();
          if (name != null && name.isNotEmpty) {
            markAttendance(name);
          } else {
            print('Invalid name!');
          }
          break;
        case 3:
          displayReport();
          break;
        case 4:
          print('Exiting...');
          return;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }
}

void main() {
  var app = AttendanceApp();
  app.run();
}
