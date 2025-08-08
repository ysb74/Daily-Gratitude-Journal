# Daily Gratitude Journal ðŸŒŸ

A simple, elegant iOS mobile application for recording and reflecting on daily gratitude entries. This project was built to demonstrate fundamental iOS development concepts using SwiftUI and Core Data.

<!-- Add a screenshot of your app here for better visual appeal -->
<!-- Example: -->
<!-- ![App Screenshot](screenshots/app-preview.png) -->

---

## Features

- **Daily Entries**: Easily add new gratitude entries with a simple text editor
- **Automatic Timestamping**: Each entry is automatically saved with the current date and time
- **List View**: View all your past entries in a clean, scrollable list, ordered by date
- **Entry Details**: Tap on an entry to view its full content
- **Edit & Delete**: Modify or remove entries to keep your journal up-to-date
- **Data Persistence**: All entries are saved locally on the device using Core Data, ensuring your journal is always available
- **Simple & Intuitive UI**: Built with SwiftUI for a modern, responsive user experience

---

## Technologies Used

- **Swift**: The primary programming language for iOS development
- **SwiftUI**: Apple's declarative UI framework for building user interfaces
- **Core Data**: Apple's persistence framework for saving and managing the app's structured data
- **Xcode**: The Integrated Development Environment (IDE) used to build the app

---

## Getting Started

To run this project on your local machine, follow these steps:

### Prerequisites

- **Xcode**: Ensure you have Xcode installed on your Mac. You can download it from the Mac App Store.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/YourGitHubUsername/GratitudeJournal.git
   ```
   *(Remember to replace `YourGitHubUsername` with your actual GitHub username.)*

2. **Navigate to the project directory:**
   ```bash
   cd GratitudeJournal
   ```

3. **Open the project in Xcode:**
   ```bash
   open GratitudeJournal.xcodeproj
   ```

4. **Build and Run:**
   - Select a simulator (e.g., "iPhone 15 Pro") or a connected physical iOS device from the scheme dropdown in Xcode
   - Press the **Run** button (the play icon â–¶ï¸) in Xcode, or use the keyboard shortcut `Cmd + R`, to build and launch the app

---


### File Descriptions

- **`GratitudeJournalApp.swift`**: The main entry point of the SwiftUI application, responsible for setting up the app's environment, including Core Data
- **`ContentView.swift`**: Defines the main user interface for the home screen, displaying the list of all gratitude entries and providing navigation
- **`AddEntryView.swift`**: A dedicated view presented as a sheet, allowing users to compose and save new gratitude entries
- **`EntryDetailView.swift`**: Displays the full content of a selected gratitude entry and offers options to edit or delete it
- **`GratitudeJournal.xcdatamodeld`**: The visual Core Data model file where the GratitudeEntry entity and its attributes (timestamp, text) are defined
- **`Persistence.swift`**: Contains the PersistenceController struct, which manages the Core Data stack, including the NSPersistentContainer and provides a singleton instance for easy access

---

## License

This project is open-source and licensed under the **MIT License**. For more details, see the `LICENSE` file in the repository.

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Contact

If you have any questions or suggestions, please feel free to reach out or open an issue in the repository.