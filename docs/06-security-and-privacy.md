# Security and privacy

This repository is public. Fill this in honestly and date it; it is checked as
part of grading.

**Last checked:** 2026-09-27

## What this app stores

| Data | Where it lives | Who can see it |
| --- | --- | --- |
| Homework checklist and whether a task is checked off | On the device (in the app memory, moving to `shared_preferences`) | Only that student on their own device |
| Daily class schedule, times, and room numbers | Inside our local code file (`sample_data.dart`) | Only that student |
| Upcoming exam dates and tags (like "In 10 days") | Inside our local code file (`sample_data.dart`) | Only that student |
| The greeting name shown on the dashboard ("John") | Hardcoded in the UI layout for demonstration | Only that student |

## Secrets

- **Values my app needs at run time:** None. Our app runs completely on local mock data, so it does not need any secret API keys or third-party web services to function.
- **Where they live locally:** We added `.env` to our `.gitignore` file so it can never be pushed by mistake. We kept `.env.example` in the project folder with empty placeholders to show how future variables would look.
- **Where the deploy workflow gets them:** It doesn't need any. Our GitHub Actions file (`deploy-web.yml`) only packages our web files and pushes them to GitHub Pages. There are no private backend keys used.
- **Anything my deployed web build carries that a visitor could read, and why that is acceptable:** Nothing dangerous. Anyone using Chrome Developer Tools can see the compiled Flutter code and our fake sample courses (like "Mobile Application Development" and "Mr. Santos"). There are no real passwords, personal student emails, or database keys hidden in the build.

## What protects the data on the service side

- **Firestore rules / Supabase RLS policies:** Nothing leaves the device. We are not using an online database or cloud server like Firebase or Supabase for this milestone. Because no data ever travels over the internet, there is no remote server to secure. Everything stays strictly inside the user's local browser session.

## Checklist

- [x] `.env` (or `env.json`) is in `.gitignore`, and `.env.example` is committed
- [x] `git log -p | grep -i "api_key\|secret\|password\|token"` finds nothing real
- [x] No service account file, keystore or `service_role` key anywhere in the repo
- [x] Security rules or RLS policies written and tested, not left open *(N/A: nothing leaves the device; there is no cloud database)*
- [x] No real personal data in sample data, screenshots or the video
- [x] No course or university credentials anywhere
- [x] Anyone whose data appears in a test was asked first *(N/A: all names and class schedules are completely made up for testing)*

**Notes:**  
We ran a search through our Git history before making this repo public. We confirmed that no real passwords, personal school IDs, or private API keys have ever been added to our project files.
