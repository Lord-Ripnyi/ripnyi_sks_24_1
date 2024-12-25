import 'package:flutter/material.dart';
import 'package:ripnyi_sks_24_1/models/student.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({
    super.key,
    required this.onAddStudent,
    this.existingStudent,
  });

  final void Function(Student student) onAddStudent;
  final Student? existingStudent;

  @override
  State<StatefulWidget> createState() {
    return _NewStudentState();
  }
}

class _NewStudentState extends State<NewStudent> {
  late final _firstnameController =
      TextEditingController(text: widget.existingStudent?.firstName ?? '');
  late final _lastnameController =
      TextEditingController(text: widget.existingStudent?.lastName ?? '');
  late final _gradeController = TextEditingController(
      text: widget.existingStudent != null
          ? widget.existingStudent!.grade.toString()
          : '');
  late Department _selectedDepartment =
      widget.existingStudent?.department ?? Department.finance;
  late Gender _selectedGender = widget.existingStudent?.gender ?? Gender.female;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _gradeController.dispose();
    super.dispose();
  }

  void _submitStudentData() {
    final enteredAmount = int.tryParse(_gradeController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    final firstnameIsInvalid = _firstnameController.text.trim().isEmpty;
    final lastnameIsInvalid = _lastnameController.text.trim().isEmpty;

    if (amountIsInvalid || firstnameIsInvalid || lastnameIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input.'),
          content: const Text(
              'Enter valid values.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

      return;
    }

    widget.onAddStudent(
      Student(
          firstName: _firstnameController.text,
          lastName: _lastnameController.text,
          department: _selectedDepartment,
          grade: enteredAmount,
          gender: _selectedGender),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 25),
      child: Column(
        children: [
          TextField(
            controller: _firstnameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('First name')),
          ),
          TextField(
            controller: _lastnameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Last name')),
          ),
          TextField(
            controller: _gradeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(label: Text('Grade')),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                DropdownButton(
                    value: _selectedDepartment,
                    items: Department.values
                        .map(
                          (department) => DropdownMenuItem(
                            value: department,
                            child: Text(
                              department.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedDepartment = value;
                      });
                    }),
                const Spacer(),
                DropdownButton(
                    value: _selectedGender,
                    items: Gender.values
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(
                              gender.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedGender = value;
                      });
                    })
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
              ),
              const SizedBox(
                width: 150,
              ),
              ElevatedButton(
                onPressed: _submitStudentData,
                child: const Text('Save Student'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
