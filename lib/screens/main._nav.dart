// screens/main._nav.dart
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _currentTab = 0;

  void _handleTabChange(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // This is the IndexedStack John wrote about in his journal!
    // It keeps screens alive in the background instead of destroying them.
    final screens = [
      const DashboardScreen(),
      _buildPlaceholderView('Class Schedule', Icons.calendar_month),
      _buildPlaceholderView('Assignments', Icons.check_box),
      _buildPlaceholderView('Exams', Icons.assignment),
      _buildPlaceholderView('Student Profile', Icons.person),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UniSchedule',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
        ],
      ),
      // Using IndexedStack here fixes the state-loss bug!
      body: IndexedStack(
        index: _currentTab,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTab,
        onDestinationSelected: _handleTabChange,
        backgroundColor: Colors.white,
        indicatorColor: theme.colorScheme.primary.withOpacity(0.12),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home, color: Color(0xFF003E7E)), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.calendar_month_outlined), selectedIcon: Icon(Icons.calendar_month, color: Color(0xFF003E7E)), label: 'Schedule'),
          NavigationDestination(icon: Icon(Icons.check_box_outlined), selectedIcon: Icon(Icons.check_box, color: Color(0xFF003E7E)), label: 'Tasks'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), selectedIcon: Icon(Icons.assignment, color: Color(0xFF003E7E)), label: 'Exams'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person, color: Color(0xFF003E7E)), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildPlaceholderView(String title, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: const Color(0xFF5F6B7A)),
          const SizedBox(height: 12),
          Text('$title Screen', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Under Development for Week 2', style: TextStyle(color: Color(0xFF5F6B7A), fontSize: 13)),
        ],
      ),
    );
  }
}