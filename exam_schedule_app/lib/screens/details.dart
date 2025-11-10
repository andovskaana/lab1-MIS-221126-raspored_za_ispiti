import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';


class ExamDetailsPage extends StatelessWidget {
  static const String routeName = '/examDetails';

  const ExamDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final bool isPast = diff.isNegative;

    final int days = diff.inDays.abs();
    final int hours = diff.inHours.abs() - days * 24;
    final String remaining = isPast
        ? 'Испитот е поминат'
        : '$days дена, $hours часа';

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.book, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          exam.subject,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('dd.MM.yyyy').format(exam.dateTime),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 8),
                      Text(
                        DateFormat('HH:mm').format(exam.dateTime),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.room),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Простории: ${exam.rooms.join(', ')}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Преостанато време',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              remaining,
              style: TextStyle(
                fontSize: 18,
                color: isPast ? Colors.red : Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}