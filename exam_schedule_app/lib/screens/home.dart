import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListPage extends StatelessWidget {
  final String index;

  const ExamListPage({super.key, required this.index});

  List<Exam> get _exams {
    final List<Exam> exams = [
      Exam(
        subject: 'Вештачка интелигенција',
        dateTime: DateTime(2024, 9, 17, 9, 0),
        rooms: ['Lab13', 'Lab2'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(2024, 6, 26, 11, 0),
        rooms: ['B1'],
      ),
      Exam(
        subject: 'Веб програмирање',
        dateTime: DateTime(2025, 6, 25, 13, 0),
        rooms: ['Lab138', 'Lab2'],
      ),
      Exam(
        subject: 'Алгоритми и податочни структури',
        dateTime: DateTime(2024, 2, 13, 8, 30),
        rooms: ['Lab13'],
      ),
      Exam(
        subject: 'Дискретна математика',
        dateTime: DateTime(2023, 7, 3, 10, 0),
        rooms: ['Lab205'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateTime: DateTime(2025, 1, 31, 9, 0),
        rooms: ['B2'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(2025, 6, 26, 12, 0),
        rooms: ['Lab215', 'B3.2'],
      ),
      Exam(
        subject: 'Дизајн на интеракцијата човек-компјутер',
        dateTime: DateTime(2026, 2, 1, 14, 30),
        rooms: ['Lab3'],
      ),
      Exam(
        subject: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 12, 15, 18, 0),
        rooms: ['Lab117', 'Lab13','Lab2'],
      ),
      Exam(
        subject: 'Рударење на масивни податоци',
        dateTime: DateTime(2026, 2, 5, 9, 45),
        rooms: ['Lab138'],
      ),
    ];
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return exams;
  }

  @override
  Widget build(BuildContext context) {
    final exams = _exams;
    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $index'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: exams.length,
        itemBuilder: (context, i) => ExamCard(exam: exams[i]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Badge(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(
                '${exams.length}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.list_alt, size: 26),
                  SizedBox(width: 8),
                  Text(
                    'Вкупно испити',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}