# Proposal

## The problem, in one sentence

College students have a hard time keeping up with their daily schedule because their classes, homework deadlines, and exam dates are scattered across different school portals, messy group chats, and paper notes.

---

## Who it is for

This app is for college students who just want a clean, no-nonsense way to check what class they have next and cross off their homework. We built it for a single student using their own device, so they can open it instantly without having to create an online account or wait for an internet connection.

---

## Core features

1. **Dashboard:** Gives you a quick morning overview, including today's date, three count boxes for classes, tasks, and exams, and a main card showing what class is next (`Scaffold`, `AppBar`, `Card`, `Row`, `Column`, `ListView`).
2. **Class Schedule:** A full timetable view showing your daily subjects, start and end times, room numbers, and teacher names like Mr. Santos in Room 204 (`ListView.builder`, `Card`, `ListTile`, `Container`).
3. **Homework Checklist:** A scrolling list of assignments with due dates and clickable checkboxes that cross out tasks when you finish them (`ListView.builder`, `Card`, `Checkbox`, `FloatingActionButton`).
4. **Exam Tracker:** Lists upcoming midterms and finals with room locations and helpful tags like "In 10 days" to help you plan your review time (`ListView.builder`, `Card`, `ListTile`).
5. **Student Profile:** A simple screen showing the student's name, profile icon, and basic settings (`CircleAvatar`, `ListTile`, `Column`, `Switch`).
6. **Smooth Bottom Navigation:** A bottom bar that lets you jump between screens without resetting your checked boxes (`NavigationBar` using `IndexedStack`).
7. **Local Storage:** Keeps your data saved on your device so your progress doesn't disappear when you close the tab or restart the app.

---

## Out of scope, and why

Just like we decided in our revised proposal (M7A1), we left these features out on purpose to make sure we could finish on time:

- **Online accounts and cloud sync:** We skipped Firebase and web servers. Setting up logins and internet databases would take way too long for a short project and could introduce security bugs.
- **Push notifications:** Setting up phone alerts across both web browsers and mobile devices is tricky and wasn't needed to make the core schedule useful.
- **Dark mode:** We treated this as a bonus idea. We wanted to make sure our cards, buttons, and layout worked properly in normal light mode before messing with theme toggles.
- **Search and filtering:** We kept this out of our first version so our code stayed clean, simple, and easy to grade.

---

## Data the app remembers, and where it is saved

- **What the app remembers:** 
  - Student profile details (name and avatar initial).
  - Class timetable info (like *Mobile Application Development with Mr. Santos in Room 204*).
  - Homework items, due dates, and whether you checked them off.
  - Exam dates and room numbers.
- **Where it is saved:** 
  - Right on the student's physical phone or browser storage (`shared_preferences` and our mock data file). Nothing is sent over the internet or shared with anyone else.

---

## Risks

1. **Losing progress when changing tabs:** In our early build, clicking from Tasks to Home and back would untick all the homework checkboxes. We fixed this by switching our navigation to use an `IndexedStack`, which keeps the pages running in the background.
2. **Layout crashes on narrow screens:** Putting a scrolling list directly inside a regular column caused Flutter to crash with a red screen (`RenderBox was not laid out`). We fixed this by wrapping our lists in `Expanded` widgets so Flutter knows how much space to give them.
3. **Trying to do too much at once:** If we tried to build all five tabs completely in one week, we would have ended up with broken code. We managed this by focusing on our dashboard and getting the task checkboxes 100% interactive first.

---

## Changes since the last version

- **2026-09-18 (First Idea):** We originally planned a bigger app that had online user accounts and cloud database syncing.
- **2026-09-21 (M7A1 Proposal Revision):** We cut out the cloud features to keep the project realistic for our deadline. We mapped out the exact Flutter widgets we needed from Modules 4 and 5, and planned to test the app in Chrome using DevicePreview.
- **2026-09-24 (Week 1 Build):** We created our first working prototype directly inside `main.dart` with our navy and gold colors, and verified that it opened cleanly in Google Chrome.
- **2026-09-27 (Week 2 Milestone):** We cleaned up our code by moving things out of `main.dart` into separate folders (`screens`, `widgets`, `models`). We built the interactive `AssignmentCard` with working checkboxes, and updated our navigation bar with `IndexedStack` to fix our tab reset bug.
- **2026-09-28 to 2026-10-08 (Final Polish & Completion):** We officially finished building the app! We designed and added the full **Class Schedule** and **Exams** pages (`schedule_screen.dart` and `exams_screen.dart`), along with reusable card widgets (`schedule_card.dart`). We connected all the class data with room numbers and teacher names, polished the UI padding across all screens, and completed our final testing in Google Chrome.
