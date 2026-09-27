// screens/dashboard_screen.dart
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting Row
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFF003E7E),
                child: Text(
                  'J',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good morning,', style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF5F6B7A))),
                  Text('John! 👋', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Date Card
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Color(0xFF003E7E)),
                  SizedBox(width: 8),
                  Text('Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Spacer(),
                  Text('Mon, Sep 22, 2026', style: TextStyle(color: Color(0xFF5F6B7A), fontSize: 12)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 3 Metric Summary Boxes
          Row(
            children: [
              _buildCountBox('3', 'Classes', const Color(0xFF003E7E), Colors.white),
              const SizedBox(width: 8),
              _buildCountBox('2', 'Assignments', const Color(0xFFF2B300), const Color(0xFF222222)),
              const SizedBox(width: 8),
              _buildCountBox('1', 'Exam', const Color(0xFF1E293B), Colors.white),
            ],
          ),
          const SizedBox(height: 20),

          // Next Class Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Next Class', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('See All', style: TextStyle(fontSize: 12, color: Color(0xFF003E7E))),
            ],
          ),
          const SizedBox(height: 8),

          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text('Mobile Application Development', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('Ongoing', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('10:00 AM - 11:30 AM', style: TextStyle(fontSize: 12, color: Color(0xFF5F6B7A))),
                  const SizedBox(height: 4),
                  const Text('Room 204 • Mr. Santos', style: TextStyle(fontSize: 12, color: Color(0xFF5F6B7A))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Upcoming Tasks Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upcoming Tasks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('See All', style: TextStyle(fontSize: 12, color: Color(0xFF003E7E))),
            ],
          ),
          const SizedBox(height: 8),

          _buildTaskCard('Flutter Activity 5', 'Mobile App Dev', 'Due Tomorrow'),
          const SizedBox(height: 8),
          _buildTaskCard('Database Systems Midterm', 'Oct 2, 2026', 'In 10 days'),
        ],
      ),
    );
  }

  Widget _buildCountBox(String count, String label, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 11, color: textColor.withOpacity(0.9))),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(String title, String subtitle, String dueText) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.circle_outlined, size: 16, color: Color(0xFF5F6B7A)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF5F6B7A), fontSize: 11)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(4)),
              child: Text(dueText, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFFC62828))),
            ),
          ],
        ),
      ),
    );
  }
}