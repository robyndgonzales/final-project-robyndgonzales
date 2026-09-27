// main.dart
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

import 'screens/assignments_screen.dart';
import 'screens/dashboard_screen.dart';

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
      const DashboardScreen(),
      _buildPlaceholderView('Class Schedule', Icons.calendar_month),
      const AssignmentsScreen(), // Tab 2: The interactive Tasks screen!
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
      // Using IndexedStack preserves state across tabs (John's Week 2 fix!)
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