// This is your app. It runs as it is: press run and you get the screen below.
//
// Nothing here is precious. Change the title, change the colors, delete the
// counter, add your own screens. It exists so that the repository is a working
// Flutter app from minute one instead of an empty folder.
//
// Everything in this file is Module 4 and 5 material: StatelessWidget,
// StatefulWidget, setState, Scaffold, AppBar, Column, Card, FilledButton.

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    // DevicePreview draws a phone frame around your app, so it is judged at the
    // size it was designed for instead of stretched across a laptop window.
    //
    // It is left ON in the deployed build on purpose: your live link is opened
    // on a desktop browser, and a phone layout at full desktop width looks
    // broken when it is not. The toolbar also lets a visitor switch device and
    // orientation.
    //
    // Want the clean app with no frame instead (for a portfolio, or because
    // you made the layout properly responsive)? Add
    //   import 'package:flutter/foundation.dart' show kReleaseMode;
    // and set `enabled: !kReleaseMode`, which drops the frame in release builds.
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniSchedule',
      debugShowCheckedModeBanner: false,

      // These two lines are what make the DevicePreview toolbar actually
      // change the app. Keep them.
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      // Your design system starts here. One seed color generates a full
      // Material palette; swap in your own and every screen follows.
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003E7E),
          primary: const Color(0xFF003E7E),
          secondary: const Color(0xFFF2B300),
          surface: Colors.white,
        ),
      ),

      home: const HomeScreen(),
    );
  }
}

/// The first screen. Replace it with yours.
///
/// It is a StatefulWidget because it remembers something that changes: the
/// counter. A screen that never changes can be a StatelessWidget instead.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State: a plain field. Changing it does nothing on its own; the screen only
  // redraws when you change it inside setState.
  int _currentTab = 0;

  void _handleTabChange(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Reading colors and text styles from the theme, instead of hardcoding
    // them, is what keeps every screen looking like the same app.
    final theme = Theme.of(context);

    // List of screens for the bottom navigation bar
    final screens = [
      _buildDashboardView(theme),
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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: screens[_currentTab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTab,
        onDestinationSelected: _handleTabChange,
        backgroundColor: Colors.white,
        indicatorColor: theme.colorScheme.primary.withOpacity(0.12),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF003E7E)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month, color: Color(0xFF003E7E)),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box_outlined),
            selectedIcon: Icon(Icons.check_box, color: Color(0xFF003E7E)),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment, color: Color(0xFF003E7E)),
            label: 'Exams',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color(0xFF003E7E)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Dashboard layout matching M7A1 and M7A3
  Widget _buildDashboardView(ThemeData theme) {
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning,',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF5F6B7A),
                    ),
                  ),
                  Text(
                    'John! 👋',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
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
              Text(
                'Next Class',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(fontSize: 12, color: Color(0xFF003E7E)),
              ),
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
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Ongoing',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
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
              Text(
                'Upcoming Tasks',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(fontSize: 12, color: Color(0xFF003E7E)),
              ),
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
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: textColor.withOpacity(0.9)),
            ),
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
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                dueText,
                style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFFC62828)),
              ),
            ),
          ],
        ),
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
          Text(
            '$title Screen',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Under Development for Week 2',
            style: TextStyle(color: Color(0xFF5F6B7A), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
