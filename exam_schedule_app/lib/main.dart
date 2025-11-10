import 'package:flutter/material.dart';
import 'package:exam_schedule_app/screens/home.dart';
import 'package:exam_schedule_app/screens/details.dart';

void main() {
  runApp(const ExamScheduleApp());
}


class ExamScheduleApp extends StatelessWidget {
  const ExamScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Schedule',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExamListPage(index: '221126'),
      routes: {
        ExamDetailsPage.routeName: (context) => const ExamDetailsPage(),
      },
    );
  }
}