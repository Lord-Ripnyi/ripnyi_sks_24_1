import 'package:flutter/material.dart';
import 'package:ripnyi_sks_24_1/models/student.dart';
import 'package:ripnyi_sks_24_1/widgets/new_student.dart';
import 'package:ripnyi_sks_24_1/widgets/student_item.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StudentsState();
  }
}

class _StudentsState extends State<Students> {
  final List<Student> studentsList = [
    Student(
        firstName: 'Henry',
        lastName: 'Cavill',
        department: Department.law,
        grade: 99,
        gender: Gender.male),
    Student(
        firstName: 'Chris',
        lastName: 'Evans',
        department: Department.finance,
        grade: 89,
        gender: Gender.male),
    Student(
        firstName: 'Anna',
        lastName: 'Wintour',
        department: Department.it,
        grade: 20,
        gender: Gender.female),
    Student(
        firstName: 'Beth',
        lastName: 'Harmon',
        department: Department.medical,
        grade: 99,
        gender: Gender.female)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          IconButton(
              onPressed: openAddStudentOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: StudentsList(
              students: studentsList,
              onRemoveStudent: removeStudent,
              onEditStudent: editStudent),
        ),
      ]),
    );
  }

  void openAddStudentOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewStudent(onAddStudent: addStudent),
    );
  }

  void removeStudent(Student student) {
    final studentIndex = studentsList.indexOf(student);
    setState(
      () {
        studentsList.remove(student);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                studentsList.insert(studentIndex, student);
              },
            );
          },
        ),
      ),
    );
  }

  void editStudent(Student student) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewStudent(
        existingStudent: student,
        onAddStudent: (updatedStudent) {
          setState(
            () {
              final index = studentsList.indexOf(student);
              studentsList[index] = updatedStudent; // Update the student
            },
          );
        },
      ),
    );
  }

  void addStudent(Student student) {
    setState(
      () {
        studentsList.add(student);
      },
    );
  }
}

class StudentsList extends StatelessWidget {
  const StudentsList(
      {super.key,
      required this.students,
      required this.onRemoveStudent,
      required this.onEditStudent});

  final List<Student> students;
  final void Function(Student student) onRemoveStudent;
  final void Function(Student student) onEditStudent;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (contest, index) => Dismissible(
        key: ValueKey(students[index]),
        background: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
        ),
        child: StudentsItem(
            student: students[index], onEditStudent: onEditStudent),
        onDismissed: (direction) {
          onRemoveStudent(students[index]);
        },
      ),
    );
  }
}
