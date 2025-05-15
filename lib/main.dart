import 'package:al_mehdi_online_school/screens/students/student_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al - Mehdi Online School',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      //home: const TeacherHomeScreen(),
      home: const StudentHomeScreen(),
    );
  }
}
