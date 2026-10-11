import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unischedule/main.dart';

void main() {
  testWidgets('shows the UniSchedule welcome screen', (tester) async {
    await tester.pumpWidget(const UniScheduleApp());
    expect(find.text('UniSchedule'), findsOneWidget);
    expect(find.text('Your academic life, organized.'), findsOneWidget);
    expect(find.text('Open my planner'), findsOneWidget);
  });

  testWidgets('opens the planner after entering student details', (tester) async {
    await tester.pumpWidget(const UniScheduleApp());
    await tester.enterText(find.byType(TextField).at(0), 'Alex Cruz');
    await tester.enterText(find.byType(TextField).at(1), '20260001');
    await tester.tap(find.text('Open my planner'));
    await tester.pumpAndSettle();
    expect(find.text('Hello, Alex 👋'), findsOneWidget);
    expect(find.text('Upcoming classes'), findsOneWidget);
  });
}
