import 'package:flutter/material.dart';

void main() {
  runApp(const UniScheduleApp());
}

const Color universityBlue = Color(0xFF003E7E);
const Color universityGold = Color(0xFFF2B300);
const Color pageBackground = Color(0xFFF5F7FA);
const Color mainText = Color(0xFF202938);
const Color mutedText = Color(0xFF687386);

class UniScheduleApp extends StatelessWidget {
  const UniScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniSchedule',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: universityBlue,
          primary: universityBlue,
          secondary: universityGold,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: mainText,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE8ECF2)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: pageBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class ClassItem {
  const ClassItem({
    required this.subject,
    required this.code,
    required this.instructor,
    required this.room,
    required this.day,
    required this.start,
    required this.end,
    required this.color,
  });

  final String subject;
  final String code;
  final String instructor;
  final String room;
  final String day;
  final String start;
  final String end;
  final Color color;
}

class AssignmentItem {
  AssignmentItem({
    required this.title,
    required this.subject,
    required this.due,
    this.done = false,
  });

  final String title;
  final String subject;
  final String due;
  bool done;
}

class ExamItem {
  const ExamItem({
    required this.subject,
    required this.date,
    required this.time,
    required this.room,
  });

  final String subject;
  final String date;
  final String time;
  final String room;
}

final List<ClassItem> sampleClasses = [
  const ClassItem(
    subject: 'Dynamic Web Applications',
    code: 'IT 304',
    instructor: 'Prof. Reyes',
    room: 'Laboratory 2',
    day: 'Monday',
    start: '8:00 AM',
    end: '10:00 AM',
    color: Color(0xFF4779C7),
  ),
  const ClassItem(
    subject: 'Ethics for Computing Professionals',
    code: 'IT 302',
    instructor: 'Prof. Santos',
    room: 'Room 304',
    day: 'Monday',
    start: '10:30 AM',
    end: '12:00 PM',
    color: Color(0xFFB78A18),
  ),
  const ClassItem(
    subject: 'Database Management',
    code: 'IT 305',
    instructor: 'Prof. Dela Cruz',
    room: 'Laboratory 1',
    day: 'Tuesday',
    start: '1:00 PM',
    end: '3:00 PM',
    color: Color(0xFF398A72),
  ),
  const ClassItem(
    subject: 'Network Fundamentals',
    code: 'IT 306',
    instructor: 'Engr. Garcia',
    room: 'Room 205',
    day: 'Wednesday',
    start: '9:00 AM',
    end: '11:00 AM',
    color: Color(0xFF9564B8),
  ),
  const ClassItem(
    subject: 'Human-Computer Interaction',
    code: 'IT 307',
    instructor: 'Prof. Lim',
    room: 'Room 401',
    day: 'Thursday',
    start: '2:00 PM',
    end: '4:00 PM',
    color: Color(0xFFD16E4B),
  ),
];

final List<AssignmentItem> sampleAssignments = [
  AssignmentItem(
    title: 'Build a responsive landing page',
    subject: 'Dynamic Web Applications',
    due: 'Due tomorrow',
  ),
  AssignmentItem(
    title: 'Database normalization activity',
    subject: 'Database Management',
    due: 'Due Oct 13',
  ),
  AssignmentItem(
    title: 'Network configuration worksheet',
    subject: 'Network Fundamentals',
    due: 'Due Oct 15',
  ),
  AssignmentItem(
    title: 'Ethics reflection paper',
    subject: 'Ethics for Computing Professionals',
    due: 'Due Oct 18',
    done: true,
  ),
];

const List<ExamItem> sampleExams = [
  ExamItem(
    subject: 'Network Fundamentals',
    date: 'October 16, 2026',
    time: '9:00 AM – 10:30 AM',
    room: 'Room 205',
  ),
  ExamItem(
    subject: 'Database Management',
    date: 'October 20, 2026',
    time: '1:00 PM – 2:30 PM',
    room: 'Laboratory 1',
  ),
  ExamItem(
    subject: 'Dynamic Web Applications',
    date: 'October 23, 2026',
    time: '10:00 AM – 11:30 AM',
    room: 'Laboratory 2',
  ),
];

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }

  void _continue() {
    final name = _nameController.text.trim();
    final studentId = _studentIdController.text.trim();

    if (name.isEmpty || studentId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name and student ID.')),
      );
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => HomeScreen(
          studentName: name,
          studentId: studentId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: universityBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'UniSchedule',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: universityBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your academic life, organized.',
                    style: TextStyle(fontSize: 16, color: mutedText),
                  ),
                  const SizedBox(height: 36),
                  const Text(
                    'Let’s get started',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: mainText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Enter your details to open your student planner.',
                    style: TextStyle(color: mutedText),
                  ),
                  const SizedBox(height: 24),
                  const Text('Full name', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'e.g. Alex Cruz',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text('Student ID', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _studentIdController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _continue(),
                    decoration: const InputDecoration(
                      hintText: 'Enter your student ID',
                      prefixIcon: Icon(Icons.badge_outlined),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _continue,
                      style: FilledButton.styleFrom(
                        backgroundColor: universityBlue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text('Open my planner'),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Center(
                    child: Text(
                      'Demo mode · No account or internet required',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: mutedText),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.studentName,
    required this.studentId,
    super.key,
  });

  final String studentName;
  final String studentId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  String get _firstName {
    final trimmed = widget.studentName.trim();
    if (trimmed.isEmpty) return 'Student';
    return trimmed.split(RegExp(r'\s+')).first;
  }

  void _selectTab(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      DashboardScreen(
        firstName: _firstName,
        onNavigate: _selectTab,
      ),
      const ScheduleScreen(),
      AssignmentsScreen(
        assignments: sampleAssignments,
        onChanged: () => setState(() {}),
      ),
      const ExamsScreen(),
      ProfileScreen(
        studentName: widget.studentName,
        studentId: widget.studentId,
      ),
    ];

    final titles = ['Dashboard', 'Class Schedule', 'Assignments', 'Exams', 'Profile'];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.calendar_month_rounded, color: universityBlue),
            const SizedBox(width: 10),
            Text(
              titles[_selectedIndex],
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _selectTab,
        backgroundColor: Colors.white,
        indicatorColor: universityBlue.withValues(alpha: 0.10),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today_rounded),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist_rounded),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_calendar_outlined),
            selectedIcon: Icon(Icons.edit_calendar_rounded),
            label: 'Exams',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.firstName,
    required this.onNavigate,
    super.key,
  });

  final String firstName;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final pending = sampleAssignments.where((item) => !item.done).length;

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: universityBlue,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'YOUR STUDENT PLANNER',
                style: TextStyle(
                  color: Color(0xFFD9E6F8),
                  fontSize: 11,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Hello, $firstName 👋',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Stay on top of your classes and deadlines.',
                style: TextStyle(color: Color(0xFFE5EDF8), height: 1.4),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _HeroStat(
                      value: '${sampleClasses.length}',
                      label: 'Sample classes',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _HeroStat(
                      value: '$pending',
                      label: 'Pending tasks',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        SectionHeader(
          title: 'Quick access',
          actionLabel: 'View schedule',
          onAction: () => onNavigate(1),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _QuickAction(
                icon: Icons.calendar_month_rounded,
                label: 'Schedule',
                onTap: () => onNavigate(1),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickAction(
                icon: Icons.check_circle_outline_rounded,
                label: 'Assignments',
                onTap: () => onNavigate(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickAction(
                icon: Icons.school_outlined,
                label: 'Exams',
                onTap: () => onNavigate(3),
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        SectionHeader(
          title: 'Upcoming classes',
          actionLabel: 'See all',
          onAction: () => onNavigate(1),
        ),
        const SizedBox(height: 12),
        ...sampleClasses.take(3).map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClassCard(item: item, showDay: true),
            )),
        const SizedBox(height: 16),
        SectionHeader(
          title: 'Tasks to finish',
          actionLabel: 'View tasks',
          onAction: () => onNavigate(2),
        ),
        const SizedBox(height: 12),
        ...sampleAssignments.where((item) => !item.done).take(2).map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AssignmentCard(
                  item: item,
                  onChanged: () {},
                  compact: true,
                ),
              ),
            ),
      ],
    );
  }
}

class _HeroStat extends StatelessWidget {
  const _HeroStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(color: Color(0xFFD9E6F8), fontSize: 12)),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE8ECF2)),
          ),
          child: Column(
            children: [
              Icon(icon, color: universityBlue, size: 25),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Your weekly timetable',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: mainText),
        ),
        const SizedBox(height: 6),
        const Text(
          'Example classes are provided for demonstration. Replace them with your actual timetable.',
          style: TextStyle(color: mutedText, height: 1.4),
        ),
        const SizedBox(height: 20),
        ...days.map((day) {
          final classes = sampleClasses.where((item) => item.day == day).toList();
          return Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: universityBlue,
                  ),
                ),
                const SizedBox(height: 10),
                if (classes.isEmpty)
                  const _EmptyDay()
                else
                  ...classes.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ClassCard(item: item),
                      )),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _EmptyDay extends StatelessWidget {
  const _EmptyDay();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8ECF2)),
      ),
      child: const Text(
        'No sample classes scheduled.',
        style: TextStyle(color: mutedText, fontSize: 13),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  const ClassCard({required this.item, this.showDay = false, super.key});

  final ClassItem item;
  final bool showDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: showDay ? 76 : 66,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showDay)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        item.day,
                        style: const TextStyle(
                          color: universityBlue,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  Text(
                    item.subject,
                    style: const TextStyle(fontWeight: FontWeight.w700, color: mainText),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${item.code} · ${item.instructor}',
                    style: const TextStyle(color: mutedText, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 12,
                    runSpacing: 5,
                    children: [
                      _SmallInfo(icon: Icons.access_time_rounded, text: '${item.start} – ${item.end}'),
                      _SmallInfo(icon: Icons.location_on_outlined, text: item.room),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({
    required this.assignments,
    required this.onChanged,
    super.key,
  });

  final List<AssignmentItem> assignments;
  final VoidCallback onChanged;

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  void _toggle(AssignmentItem item, bool? value) {
    setState(() => item.done = value ?? false);
    widget.onChanged();
  }

  void _addAssignment() {
    final titleController = TextEditingController();
    final subjectController = TextEditingController();
    final dueController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add assignment'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Assignment title'),
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: subjectController,
                decoration: const InputDecoration(labelText: 'Subject'),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: dueController,
                decoration: const InputDecoration(labelText: 'Due date (e.g. Oct 22)'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final title = titleController.text.trim();
              final subject = subjectController.text.trim();
              final due = dueController.text.trim();
              if (title.isEmpty || subject.isEmpty || due.isEmpty) return;

              setState(() {
                widget.assignments.add(
                  AssignmentItem(title: title, subject: subject, due: 'Due $due'),
                );
              });
              widget.onChanged();
              Navigator.pop(dialogContext);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    ).then((_) {
      titleController.dispose();
      subjectController.dispose();
      dueController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    final completed = widget.assignments.where((item) => item.done).length;
    final pending = widget.assignments.length - completed;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '$pending tasks left',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: mainText),
              ),
            ),
            FilledButton.icon(
              onPressed: _addAssignment,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add task'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('$completed of ${widget.assignments.length} completed', style: const TextStyle(color: mutedText)),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: widget.assignments.isEmpty ? 0 : completed / widget.assignments.length,
            minHeight: 7,
            backgroundColor: const Color(0xFFE4E9F0),
            color: universityBlue,
          ),
        ),
        const SizedBox(height: 22),
        if (widget.assignments.isEmpty)
          const _EmptyState(
            icon: Icons.checklist_rounded,
            title: 'No assignments yet',
            message: 'Add your first assignment to start tracking your work.',
          )
        else
          ...widget.assignments.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AssignmentCard(
                item: item,
                onChanged: () => _toggle(item, !item.done),
                onCheckboxChanged: (value) => _toggle(item, value),
              ),
            ),
          ),
      ],
    );
  }
}

class AssignmentCard extends StatelessWidget {
  const AssignmentCard({
    required this.item,
    required this.onChanged,
    this.onCheckboxChanged,
    this.compact = false,
    super.key,
  });

  final AssignmentItem item;
  final VoidCallback onChanged;
  final ValueChanged<bool?>? onCheckboxChanged;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onChanged,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: EdgeInsets.all(compact ? 13 : 16),
          child: Row(
            children: [
              Checkbox(
                value: item.done,
                onChanged: onCheckboxChanged ?? (_) => onChanged(),
                activeColor: universityBlue,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: item.done ? mutedText : mainText,
                        decoration: item.done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(item.subject, style: const TextStyle(color: mutedText, fontSize: 12)),
                    if (!compact) ...[
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          const Icon(Icons.schedule_rounded, size: 14, color: universityBlue),
                          const SizedBox(width: 5),
                          Text(item.due, style: const TextStyle(fontSize: 12, color: universityBlue)),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (compact)
                const Icon(Icons.chevron_right_rounded, color: mutedText),
            ],
          ),
        ),
      ),
    );
  }
}

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Upcoming exams',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: mainText),
        ),
        const SizedBox(height: 6),
        const Text(
          'Keep these dates in view and prepare ahead of time.',
          style: TextStyle(color: mutedText),
        ),
        const SizedBox(height: 20),
        ...sampleExams.map(
          (exam) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(17),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: universityGold.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.school_outlined, color: universityBlue, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(exam.subject, style: const TextStyle(fontWeight: FontWeight.w700, color: mainText)),
                          const SizedBox(height: 9),
                          _SmallInfo(icon: Icons.calendar_today_outlined, text: exam.date),
                          const SizedBox(height: 6),
                          _SmallInfo(icon: Icons.access_time_rounded, text: exam.time),
                          const SizedBox(height: 6),
                          _SmallInfo(icon: Icons.location_on_outlined, text: exam.room),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Demo data: update these dates to match your actual exam schedule.',
          style: TextStyle(color: mutedText, fontSize: 12),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.studentName,
    required this.studentId,
    super.key,
  });

  final String studentName;
  final String studentId;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 12),
        Center(
          child: CircleAvatar(
            radius: 42,
            backgroundColor: universityBlue,
            child: Text(
              studentName.trim().isEmpty ? 'S' : studentName.trim()[0].toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Center(
          child: Text(
            studentName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: mainText),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text('Student ID: $studentId', style: const TextStyle(color: mutedText)),
        ),
        const SizedBox(height: 28),
        Card(
          child: Column(
            children: const [
              _ProfileRow(icon: Icons.school_outlined, title: 'Application', value: 'UniSchedule'),
              Divider(height: 1, indent: 56),
              _ProfileRow(icon: Icons.palette_outlined, title: 'Theme', value: 'Blue and gold'),
              Divider(height: 1, indent: 56),
              _ProfileRow(icon: Icons.storage_outlined, title: 'Data mode', value: 'Sample data'),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'This is a local demo. Your profile and sample entries are not synced to an account or cloud service.',
          textAlign: TextAlign.center,
          style: TextStyle(color: mutedText, height: 1.5, fontSize: 12),
        ),
      ],
    );
  }
}

class _ProfileRow extends StatelessWidget {
  const _ProfileRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: universityBlue),
          const SizedBox(width: 14),
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
          Text(value, style: const TextStyle(color: mutedText, fontSize: 12)),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: mainText),
          ),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel!, style: const TextStyle(fontSize: 12)),
          ),
      ],
    );
  }
}

class _SmallInfo extends StatelessWidget {
  const _SmallInfo({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: mutedText),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: mutedText, fontSize: 11),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE8ECF2)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: universityBlue),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: 6),
          Text(message, textAlign: TextAlign.center, style: const TextStyle(color: mutedText)),
        ],
      ),
    );
  }
}
