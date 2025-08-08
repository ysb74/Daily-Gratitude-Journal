# Daily-Gratitude-Journal
App Concept: A simple, elegant app where users can record daily entries of things they are grateful for. It encourages positive reflection and can be a quick, mindful practice.  Why this is suitable for an assignment:  Simple Core Functionality Clear UI/UX Learning Opportunities  Deployable
Daily Gratitude Journal 🌟
A simple, elegant iOS mobile application for recording and reflecting on daily gratitude entries. This project was built to demonstrate fundamental iOS development concepts using SwiftUI and Core Data.

<!-- Add a screenshot of your app here for better visual appeal -->

<!-- Example:  -->

✨ Features
Daily Entries: Easily add new gratitude entries with a simple text editor.

Automatic Timestamping: Each entry is automatically saved with the current date and time.

List View: View all your past entries in a clean, scrollable list, ordered by date.

Entry Details: Tap on an entry to view its full content.

Edit & Delete: Modify or remove entries to keep your journal up-to-date.

Data Persistence: All entries are saved locally on the device using Core Data, ensuring your journal is always available.

Simple & Intuitive UI: Built with SwiftUI for a modern, responsive user experience.

🛠️ Technologies Used
Swift: The primary programming language for iOS development.

SwiftUI: Apple's declarative UI framework for building user interfaces.

Core Data: Apple's persistence framework for saving and managing the app's structured data.

Xcode: The Integrated Development Environment (IDE) used to build the app.

🚀 Getting Started
To run this project on your local machine, follow these steps.

Prerequisites

Xcode: Ensure you have Xcode installed on your Mac. You can download it from the Mac App Store.

Installation

Clone the repository:

git clone https://github.com/YourGitHubUsername/GratitudeJournal.git

(Remember to replace YourGitHubUsername with your actual GitHub username.)

Navigate to the project directory:

cd GratitudeJournal

Open the project in Xcode:

open GratitudeJournal.xcodeproj

Build and Run:

Select a simulator (e.g., "iPhone 15 Pro") or a connected physical iOS device from the scheme dropdown in Xcode.

Press the Run button (the play icon ▶️) in Xcode, or use the keyboard shortcut Cmd + R, to build and launch the app.

🏗️ Project Structure
The project is organized into logical components to enhance clarity and maintainability:

GratitudeJournalApp.swift: The main entry point of the SwiftUI application, responsible for setting up the app's environment, including Core Data.

ContentView.swift: Defines the main user interface for the home screen, displaying the list of all gratitude entries and providing navigation.

AddEntryView.swift: A dedicated view presented as a sheet, allowing users to compose and save new gratitude entries.

EntryDetailView.swift: Displays the full content of a selected gratitude entry and offers options to edit or delete it.

GratitudeJournal.xcdatamodeld: The visual Core Data model file where the GratitudeEntry entity and its attributes (timestamp, text) are defined.

Persistence.swift: Contains the PersistenceController struct, which manages the Core Data stack, including the NSPersistentContainer and provides a singleton instance for easy access.

📝 License
This project is open-source and licensed under the MIT License. For more details, see the LICENSE file in the repository.