import 'package:flutter/material.dart';
import 'package:ripnyi_sks_24_1/models/department.dart';

const availableDepartments = [
  Department(
    id: 'd1',
    name: 'Finance',
    color: Color.fromARGB(255, 141, 255, 137),
    icon: Icons.payments_outlined,
  ),
  Department(
    id: 'd2',
    name: 'Law',
    color: Color.fromARGB(255, 129, 240, 255),
    icon: Icons.shield,
  ),
  Department(
    id: 'd3',
    name: 'IT',
    color: Color.fromARGB(255, 255, 240, 37),
    icon: Icons.lan,
  ),
  Department(
    id: 'd4',
    name: 'Medical',
    color: Color.fromARGB(255, 255, 255, 255),
    icon: Icons.medical_information,
  ),
];