// models/assignment.dart
class Assignment {
  final String id;
  final String title;
  final String subject;
  bool isCompleted;

  Assignment({
    required this.id,
    required this.title,
    required this.subject,
    this.isCompleted = false,
  });
}