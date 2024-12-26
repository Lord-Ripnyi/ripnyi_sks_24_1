import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripnyi_sks_24_1/models/student.dart';

import 'department_provider.dart';

class StudentsNotifier extends StateNotifier<List<Student>> {
  StudentsNotifier(super.state);

  void addStudent(Student student) {
    state = [...state, student];
  }

  void editStudent(Student student, int index) {
    final newState = [...state];
    newState[index] = newState[index].copyWith(
      firstName: student.firstName,
      lastName: student.lastName,
      departmentId: student.departmentId,
      gender: student.gender,
      grade: student.grade,
    );
    state = newState;
  }

  void insertStudent(Student student, int index) {
     state = [
      ...state.sublist(0, index),
      student,
      ...state.sublist(index),
    ];
  }

  void removeStudent(Student student) {
    state = state.where((m) => m.id != student.id).toList();
  }
}

final studentsProvider = StateNotifierProvider<StudentsNotifier, List<Student>>((ref) {
  final departments = ref.watch(departmentsProvider); 
  return StudentsNotifier([
    Student(firstName: 'John', lastName: 'Smith', departmentId: departments[0].id, gender: Gender.male, grade: 75),
    Student(firstName: 'Ana', lastName: 'De Armas', departmentId: departments[1].id, gender: Gender.female, grade: 80),
    Student(firstName: 'Will', lastName: 'Smith', departmentId: departments[3].id, gender: Gender.male, grade: 95),
    Student(firstName: 'Jack', lastName: 'Rassel', departmentId: departments[2].id, gender: Gender.male, grade: 60),
    Student(firstName: 'Megan', lastName: 'Fox', departmentId: departments[0].id, gender: Gender.female, grade: 80),
  ]);
});
