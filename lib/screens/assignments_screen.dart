// screens/assignments_screen.dart
import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../widgets/assignment_card.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: sampleAssignments.length,
      itemBuilder: (context, index) {
        return AssignmentCard(assignment: sampleAssignments[index]);
      },
    );
  }
}