# AI usage

This project was built with AI assistance. This file is the record of it. It is
graded as the finals badge, and it is worth 100 points.

Start it in week 1 and keep it up as you go. The commit history of this file is
part of the evidence: a file written all at once the night before the deadline
looks exactly like what it is.

## 1. How we used AI

At least six entries. One per real use. Every entry needs a commit link.

### 2026-09-22 - Folder structure setup

- **Tool:** ChatGPT (GPT-4)
- **What we asked for:** "We are building a student schedule app in Flutter. What is a clean, simple folder layout inside lib for screens, components, and data?"
- **What it gave back:** It suggested creating folders for `screens/`, `widgets/`, `models/`, `services/`, and `utils/`, along with a basic explanation of what goes where.
- **What we kept, what we changed, and why:** We kept the folders for `screens/`, `widgets/`, and `models/` because they keep our files organized. We dropped `services/` and `utils/` for now because our app is an early prototype and we wanted to avoid unnecessary empty folders.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)
### 2026-09-23 - Converting hex colors for ThemeData

- **Tool:** GitHub Copilot
- **What we asked for:** "How do we take hex colors like #003E7E and #F2B300 from Figma and use them properly in Flutter's ThemeData?"
- **What it gave back:** It showed how Flutter uses the `0xFF` prefix for hexadecimal alpha values (`Color(0xFF003E7E)`) and provided starter `ColorScheme.fromSeed` code.
- **What we kept, what we changed, and why:** We kept the color values and used them inside our theme setup. We made sure our navy blue remained the primary color and gold was used for highlights so the app matched our original mockups.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)
### 2026-09-24 - Basic assignment model class

- **Tool:** Claude 3.5 Sonnet
- **What we asked for:** "Write a simple Dart class for a student homework task that tracks an id, title, subject, due date, and whether it is completed."
- **What it gave back:** A Dart class with required constructor parameters, plus extra helper methods like `copyWith` and `toJson`.
- **What we kept, what we changed, and why:** We kept the class properties and the basic constructor. We deleted the `copyWith` and `toJson` methods because we are only using in-memory mock data right now and wanted to keep the file short and readable.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)

### 2026-09-25 - Rendering lists with ListView.builder

- **Tool:** ChatGPT (GPT-4)
- **What we asked for:** "How do we display a list of custom Dart objects as scrollable items on a screen in Flutter?"
- **What it gave back:** An example of `ListView.builder` using `itemCount` and returning standard `ListTile` widgets.
- **What we kept, what we changed, and why:** We kept the `ListView.builder` structure because it efficiently handles lists. We replaced the basic `ListTile` with our custom `AssignmentCard` widget so our tasks look like cards with borders and tags instead of plain rows.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)

### 2026-09-26 - Interactive checkbox toggle

- **Tool:** ChatGPT (GPT-4)
- **What we asked for:** "How do we get a checkbox inside a card to update its visual state when the user taps it?"
- **What it gave back:** Code showing how to convert the widget into a `StatefulWidget` and wrap the boolean update inside a `setState()` call.
- **What we kept, what we changed, and why:** We kept the `setState` pattern for changing the boolean. We also added a ternary operator to the text widget so that when a task is checked, it adds a strikethrough line to show it is finished.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)

### 2026-09-27 - Preserving bottom navigation state

- **Tool:** Claude 3.5 Sonnet
- **What we asked for:** "Why do our checkboxes reset to unchecked whenever we switch to another tab and come back? How do we keep the state alive?"
- **What it gave back:** It explained that standard tab switching rebuilds the widget tree from scratch, and recommended using an `IndexedStack` in the Scaffold body.
- **What we kept, what we changed, and why:** We used the `IndexedStack` approach directly. It solved our bug immediately by keeping the tab screens mounted in the background instead of destroying them on every tap.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)

## 2. Where the AI got it wrong

Three cases. Be specific. If you write that the AI was never wrong, this section
scores zero.

### Case 1 - Unbounded height layout crash

- **What it gave us:** When we asked how to place a title above our tasks list, the AI suggested placing a `Text` widget and a `ListView.builder` directly inside a regular `Column`.
- **What was wrong with it:** Running the code caused a red error screen with `RenderBox was not laid out`. Because both `Column` and `ListView` try to expand vertically without bounds, Flutter could not calculate the layout height.
- **What we did instead:** We wrapped the `ListView.builder` inside an `Expanded` widget, which told Flutter to give the list only the remaining vertical space on the screen.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)

### Case 2 - Deprecated button widget

- **What it gave us:** While helping draft an action button for adding tasks, the AI wrote code using `RaisedButton`.
- **What was wrong with it:** `RaisedButton` was deprecated and removed in recent Flutter versions. Trying to run the code produced a build error.
- **What we did instead:** We updated the code to use `ElevatedButton` and styled it using the modern `ElevatedButton.styleFrom()` syntax.
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)


### Case 3 - State loss on tab navigation

- **What it gave us:** During early prototyping, the AI suggested switching screens in the bottom bar using `body: screens[_currentTab]`.
- **What was wrong with it:** While this compiled without errors, the AI failed to mention that this method discards the screen state. When users completed a task and switched to the Dashboard and back, their progress was wiped out.
- **What we did instead:** We replaced the body swap with an `IndexedStack`, which keeps all screen states active in memory and solved our data-reset issue.
- **Commit:** [github.com/robyndgonzales/final-project-robyndgonzales.git](https://github.com/robyndgonzales/final-project-robyndgonzales/tree/main/lib.git)

## 3. Who wrote what

At least a fifth of this project is code you wrote yourself. Name it, and explain
it in your own words.

> Group projects: give each member their own heading below, and use your GitHub
> handle as the heading. You are graded on your own section.


#### Written by John Matthew Robles

- **File:** `lib/main.dart`
- **Commit:** [github.com/robyndgonzales/final-project-robyndgonzales.git](https://github.com/robyndgonzales/final-project-robyndgonzales/blob/main/lib/models/assignment.dart)
- **What it does and why it is built this way:**
I maintained our main entry file. I kept all the starter template comments intact as required by the course guidelines, wired up `DevicePreview` for web evaluation, and built the `_HomeScreenState` navigation logic. I implemented the `IndexedStack` for the body so that switching tabs preserves the state of Robyn's task list. Building it this way keeps the root file clean while preventing unnecessary rebuilds of our tab screens.

#### The AI-written part I understand best

- **File:** `lib/models/assignment.dart`
- **Commit:** [github.com/robyndgonzales/final-project-robyndgonzales.git](https://github.com/robyndgonzales/final-project-robyndgonzales/blob/main/lib/models/assignment.dart)
- **What it does and why we kept it:**
This file holds the data model for homework items. It defines required fields like `id`, `title`, `subject`, and `dueDate`, along with a default `isCompleted = false` flag. We kept the AI's version because it is straightforward Dart class boilerplate. I fully understand how constructor initialization works, and having this typed structure makes passing data into our lists reliable.


#### Written by Robyn Desiree Gonzales

- **File:** `lib/widgets/assignment_card.dart`
- **Commit:** [github.com/robyndgonzales/final-project-robyndgonzales.git](https://github.com/robyndgonzales/final-project-robyndgonzales/blob/main/lib/widgets/assignment_card.dart)
- **What it does and why it is built this way:**
I built the reusable card component for homework items from scratch. It is a `StatefulWidget` that takes an `Assignment` object and displays it inside a styled `Card` with rounded borders, a category tag, and a `Checkbox`. I wrote the `setState` logic so that tapping the box toggles `widget.assignment.isCompleted` and strikes through the title text. I built it this way so we could reuse the same component across different list views without repeating UI code.

#### The AI-written part I understand best

- **File:** `lib/screens/dashboard_screen.dart`
- **Commit:** [https://github.com/robyndgonzales/final-project-robyndgonzales/blob/main/lib/screens/dashboard_screen.dart](https://github.com/robyndgonzales/final-project-robyndgonzales/blob/main/lib/screens/dashboard_screen.dart)
- **What it does and why we kept it:**
This file contains the UI for the home tab, including the greeting header, date card, metric count boxes, and next-class preview. We kept this layout code from our Week 1 prototype because the visual structure was already solid. I understand how the nested `Row`, `Column`, and `Card` widgets work together to build the layout, and moving it to its own file kept our codebase clean.
