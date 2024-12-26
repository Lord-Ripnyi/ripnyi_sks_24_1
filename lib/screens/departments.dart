import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripnyi_sks_24_1/providers/department_provider.dart';
import 'package:ripnyi_sks_24_1/widgets/department_grid_item.dart';

class DepartmentsScreen extends ConsumerWidget {
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableDepartment = ref.watch(departmentsProvider);
    return Scaffold(
        body: GridView(
          padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              for (final department in availableDepartment)
                DepartmentGridItem(department: department)
            ]));
  }
}
