import 'package:flutter/material.dart';
import 'package:ripnyi_sks_24_1/models/student.dart';
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
        grade: 95,
        gender: Gender.male),
    Student(
        firstName: 'Anna',
        lastName: 'Wintour',
        department: Department.it,
        grade: 99,
        gender: Gender.female),
    Student(
        firstName: 'Beth',
        lastName: 'Harmon',
        department: Department.medical,
        grade: 70,
        gender: Gender.female)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Column(
        children: [
          Expanded(
            child: 
              StudentsList(students: studentsList),
          ),
        ]
      ),
    );
  }
}

class StudentsList extends StatelessWidget {
  const StudentsList({super.key, required this.students});
  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (contest, index) =>
          StudentsItem(student: students[index]),
    );
  }
}
