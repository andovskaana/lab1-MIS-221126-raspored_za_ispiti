import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../screens/details.dart';


class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final bool isPast = exam.dateTime.isBefore(DateTime.now());
    final Color baseColor = isPast
        ? Colors.grey.shade300
        : Colors.lightBlue.shade50;
    final Color borderColor = isPast ? Colors.grey : Colors.blue;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ExamDetailsPage.routeName,
          arguments: exam,
        );
      },
      child: Card(
        color: baseColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subject,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  Text(DateFormat('dd.MM.yyyy').format(exam.dateTime)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text(DateFormat('HH:mm').format(exam.dateTime)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.room, size: 16),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: const TextStyle(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}