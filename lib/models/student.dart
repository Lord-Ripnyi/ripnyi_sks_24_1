import 'package:flutter/material.dart';

class Student {
  Student(
      {required this.firstName,
      required this.lastName,
      required this.department,
      required this.grade,
      required this.gender});
  final String firstName;
  final String lastName;
  final Department department;
  final int grade;
  final Gender gender;
}

const departmentIcons = {
  Department.finance: Icons.payments_outlined,
  Department.law: Icons.shield,
  Department.it: Icons.lan,
  Department.medical: Icons.medical_information,
};

const Map<Gender, Color> genderColors = {
  Gender.female: Color.fromARGB(255, 255, 134, 174),
  Gender.male: Color.fromARGB(255, 109, 189, 255)
};

enum Department { finance, law, it, medical }

enum Gender { male, female }
