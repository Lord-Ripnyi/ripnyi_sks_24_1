import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ripnyi_sks_24_1/screens/tabs.dart';

ThemeData createTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 0, 138, 46)
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: createTheme(),
        home: const TabsScreen(),
      ),
    ),
  );
}

