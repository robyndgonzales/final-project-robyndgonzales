
class Assignment {
  final String id;
  final String title;
  final String subject;
  final String dueDate;
  bool isCompleted;

  Assignment({
    required this.id,
    required this.title,
    required this.subject,
    required this.dueDate,
    this.isCompleted = false,
  });
}
