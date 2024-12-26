import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Student {
  Student(
      {String? id,
      required this.fKey,
      required this.firstName,
      required this.lastName,
      required this.departmentId,
      required this.grade,
      required this.gender})
      : id = id ?? const Uuid().v4();

  final String id;
  final String fKey;
  final String firstName;
  final String lastName;
  final String departmentId;
  final int grade;
  final Gender gender;

  Student copyWith({
    String? fKey,
    String? firstName,
    String? lastName,
    String? departmentId,
    Gender? gender,
    int? grade,
  }) {
    return Student(
      id: id,
      fKey: fKey ?? this.fKey,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      departmentId: departmentId ?? this.departmentId,
      gender: gender ?? this.gender,
      grade: grade ?? this.grade,
    );
  }
}

const Map<Gender, Color> genderColors = {
  Gender.female: Color.fromARGB(255, 255, 134, 174),
  Gender.male: Color.fromARGB(255, 109, 189, 255)
};

enum Gender { male, female }
