import 'package:flutter/material.dart';
import 'package:ripnyi_sks_24_1/models/student.dart';

class StudentsItem extends StatelessWidget {
  const StudentsItem({
    super.key,
    required this.student,
    required this.onEditStudent,
  });

  final Student student;
  final void Function(Student student) onEditStudent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onEditStudent(student),
      child: Card(
        color: genderColors[student.gender],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Text(
                "${student.firstName} ${student.lastName}",
              ),
              const Spacer(),
              Icon(departmentIcons[student.department]),
              const SizedBox(width: 10),
              Text("${student.grade}"),
            ],
          ),
        ),
      ),
    );
  }
}
