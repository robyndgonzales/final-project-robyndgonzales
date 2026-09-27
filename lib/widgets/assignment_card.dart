// widgets/assignment_card.dart
import 'package:flutter/material.dart';
import '../models/assignment.dart';

class AssignmentCard extends StatefulWidget {
  final Assignment assignment;

  const AssignmentCard({super.key, required this.assignment});

  @override
  State<AssignmentCard> createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  @override
  Widget build(BuildContext context) {
    final isDone = widget.assignment.isCompleted;

    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Checkbox(
              activeColor: const Color(0xFF003E7E),
              value: isDone,
              onChanged: (bool? value) {
                setState(() {
                  widget.assignment.isCompleted = value ?? false;
                });
              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.assignment.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
                      color: isDone ? const Color(0xFF5F6B7A) : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.assignment.subject,
                    style: const TextStyle(color: Color(0xFF5F6B7A), fontSize: 11),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: isDone ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isDone ? 'Done' : widget.assignment.dueDate,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isDone ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}