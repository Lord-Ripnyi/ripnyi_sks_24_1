import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripnyi_sks_24_1/providers/student_provider.dart';
import 'package:ripnyi_sks_24_1/screens/departments.dart';
import 'package:ripnyi_sks_24_1/screens/students.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(studentsProvider.notifier).fetchStudents();
      //ProviderScope.containerOf(context, listen: false)
          //.read(studentsProvider.notifier)
         // .fetchStudents();
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(studentsProvider.notifier).isLoading;
    Widget activePage = const DepartmentsScreen();
    var activePageTitle = 'Departments';
    if (_selectedPageIndex == 1) {
      activePage = const Students();
      activePageTitle = 'Students';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Departments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Students',
          )
        ],
      ),
    );
  }
}
