# UniSchedule — Revised Final Project

A minimalist student planner built with Flutter and Material 3.

## Features
- Demo student entry screen
- Dashboard with quick access and sample classes/tasks
- Weekly class schedule
- Assignment tracker with completion toggles and an add-task dialog
- Exam list
- Student profile
- Bottom navigation

## Design palette
- University blue: `#003E7E`
- Gold: `#F2B300`
- Background: `#F5F7FA`
- Main text: `#202938`

## Run locally (Windows PowerShell)
From the project folder run:

```powershell
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

For Android, start an emulator or connect a phone, check `flutter devices`, then run `flutter run`.

## Notes
- Class, assignment, and exam entries are demonstration data. Replace them with your real timetable.
- The demo student entry screen is not real authentication.
- Data is stored in memory only. Changes are not permanently saved after the app process closes.
- The course documentation in `docs/`, `AI-USAGE.md`, and related files have been retained. Review them so they accurately reflect your actual work and commit history before submission.
