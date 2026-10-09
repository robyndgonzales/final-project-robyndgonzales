# Design system

Paste in the design system you submitted, and replace it with the final version
when the project is done. It is also the reference you open every time you build
a new screen, so keeping it current helps you more than it helps anyone reading.

**This document needs a visual, not just this text.** Export a PDF or an image
that *shows* your palette, type scale, spacing and components, put it in
`assets/`, and link it here:

```markdown
![Design system](assets/design-system.png)
[Design system (PDF)](assets/design-system.pdf)
```

Figma, Canva, Excalidraw, Google Slides or Docs exported to PDF all work. A
reader should be able to see your app's look in one glance, without reading a
table.

## Palette
Our palette uses a clean university navy and gold theme. We keep the page background slightly off-white so that white cards pop with a clear surface hierarchy.

| Role | Hex | Flutter Color | Use |
| --- | --- | --- | --- |
| **Primary** | `#003E7E` | `Color(0xFF003E7E)` | App bars, primary action buttons, active navigation icons, major titles |
| **Secondary / Accent** | `#F2B300` | `Color(0xFFF2B300)` | Metric counts, highlights, urgent task tags, floating action buttons |
| **Background** | `#F5F7FA` | `Color(0xFFF5F7FA)` | Main scaffold page background |
| **Surface** | `#FFFFFF` | `Colors.white` | Cards, pop-ups, modals, container surfaces |
| **On Surface (Text)** | `#222222` | `Color(0xFF222222)` | Main readable headings, titles, and body labels |
| **Muted Text** | `#5F6B7A` | `Color(0xFF5F6B7A)` | Subtitles, room details, dates, and secondary labels |
| **Divider / Border** | `#D9D9D9` | `Color(0xFFD9D9D9)` | Card outlines, dividers, subtle borders |

### Contrast and Color Rules
- Primary text uses `#222222` on light/white surfaces for clear readability.
- Buttons use `#003E7E` with crisp white text.
- Accent gold (`#F2B300`) is strictly reserved for highlights, numbers, and tags. We do not use gold for long paragraphs because it causes eye strain.
- The light gray-blue background (`#F5F7FA`) separates page content from white cards without needing heavy drop shadows.

---

## Type scale

Instead of hardcoding random font sizes on every screen, we mapped our typography directly to Flutter's Material 3 `TextTheme` slots:

| Named Flutter slot | Size | Weight | Use in UniSchedule |
| --- | --- | --- | --- |
| `displaySmall` | 28 px | Bold | Screen titles and top welcome greeting |
| `titleLarge` | 20 px | Bold | Main section headers (e.g., "Next Class", "Upcoming Tasks") |
| `titleMedium` | 16 px | Bold | Card titles and subject names |
| `bodyLarge` | 16 px | Regular | Main readable descriptions and task titles |
| `bodyMedium` | 14 px | Regular | Supporting descriptions, teacher names, and room details |
| `labelLarge` | 14 px | Bold | Buttons, navigation labels, and status badges |

---

## Spacing

We use an 8-point based spacing scale (with a 4px step for small gaps) to keep padding and margins uniform across every page:

| Constant | Value | Typical use in layout |
| --- | --- | --- |
| `spaceXs` | 4 px | Gaps between icons and text, subtitle gaps |
| `spaceSm` | 8 px | Padding inside small tags, gaps between cards |
| `spaceMd` | 16 px | Standard card interior padding, page screen margins |
| `spaceLg` | 24 px | Separation between major dashboard sections |
| `spaceXl` | 32 px | Large top/bottom screen spacing |

---

## Components

We extracted our repetitive UI elements into standalone widget files inside `lib/widgets/` so we can reuse them across multiple screens:

| Component | File path | Parameters | Screens using it |
| --- | --- | --- | --- |
| **AppCard** | `lib/widgets/app_card.dart` | `child`, `padding`, `margin`, `onTap`, `elevation` | Dashboard, Profile |
| **ScheduleCard** | `lib/widgets/schedule_card.dart` | `subject`, `instructor`, `room`, `startTime`, `endTime`, `accentColor` | Dashboard, Class Schedule |
| **AssignmentCard** | `lib/widgets/assignment_card.dart` | `title`, `subject`, `dueDate`, `completed`, `onChanged` | Dashboard, Assignments (Tasks) |
| **ExamCard** | `lib/widgets/exam_card.dart` | `subject`, `examType`, `date`, `time`, `room` | Dashboard, Exams |
| **SectionHeader** | `lib/widgets/section_header.dart` | `title`, `actionLabel`, `onAction` | Dashboard, Schedule, Assignments |
| **EmptyState** | `lib/widgets/empty_state.dart` | `icon`, `title`, `message` | Schedule, Assignments (when empty) |

### Screen-to-Component Reuse Plan
- **Dashboard:** Reuses `AppCard`, `ScheduleCard`, `AssignmentCard`, and `SectionHeader`.
- **Class Schedule:** Reuses `ScheduleCard` and `EmptyState`.
- **Assignments:** Reuses `AssignmentCard`, `SectionHeader`, and `EmptyState`.
- **Exams:** Reuses `ExamCard` and `SectionHeader`.

---

## Changes since the last version

- **Defined named color roles with real hex values:** Instead of guessing color shades as we coded, we locked down our exact `#003E7E` navy and `#F2B300` gold hex values so they plug directly into Flutter's `ColorScheme`.
- **Mapped type sizes to `TextTheme` slots:** Stopped using arbitrary inline font sizes (`fontSize: 15`, `fontSize: 17`) and standardized on Flutter's built-in `textTheme` properties.
- **Created a 4–32 px spacing scale:** Replaced random sized boxes with standard 8px and 16px constants to keep layout gaps predictable.
- **Extracted reusable card components:** Instead of copying and pasting huge blocks of `Card` code on every screen, we built reusable components with clear constructors (`AssignmentCard`, `ScheduleCard`).
- **Separated background from card surfaces:** Made the background `#F5F7FA` and cards `#FFFFFF` to create natural visual layers without needing ugly, heavy drop shadows.
- **Restricted gold strictly to accents:** Moved gold away from general text and saved it only for count boxes, highlight badges, and status pills to guarantee strong readability.
