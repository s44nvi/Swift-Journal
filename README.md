<div align="center">

# 🌿 Solace
### *A quiet space to check in with yourself.*

![Swift](https://img.shields.io/badge/Swift-5.0-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![UIKit](https://img.shields.io/badge/UIKit-Storyboard-2396F3?style=for-the-badge&logo=apple&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-15%2B-000000?style=for-the-badge&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-15-147EFB?style=for-the-badge&logo=xcode&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-4A7C5F?style=for-the-badge)

</div>

---

## 📖 About

**Solace** is a minimal iOS mood journaling app built with Swift and UIKit. It gives you a calm, distraction-free space to check in with how you're feeling — pick an emoji, write a note, save it, and look back whenever you need to.

No accounts. No feeds. No noise. Just you and your thoughts.

---

## ✨ Features

| | Feature | Description |
|---|---|---|
| 🙋 | **Named Welcome** | Enter your name on launch — the app greets you personally every session |
| 😊 | **Emoji Mood Picker** | Six emotion buttons covering the full spectrum: Happy, Sad, Anxious, Relaxed, Angry, Overwhelmed |
| 📝 | **Journal Entry** | Free-form text area to write whatever's on your mind |
| 💾 | **Save & Confirm** | One tap saves your entry with a satisfying *"Mood saved! 🎉"* confirmation |
| 📋 | **History View** | Scrollable log of every past entry with mood emoji, label, and your note |
| 🔒 | **Fully Offline** | All data lives on your device — no internet, no cloud, no tracking |

---

## 📱 Screenshots

<div align="center">

| Login | Journal | Saved | History |
|:---:|:---:|:---:|:---:|
| Enter your name to get started | Pick a mood & write a note | Confirmation on save | Review all past entries |

</div>

---

## 🏗️ Architecture

Solace is a lightweight, **MVC + UIKit** app — no third-party dependencies, no complex patterns. Just clean Swift.

```
Swift-Journal/
│
├── MoodJournal/
│   ├── AppDelegate.swift              # App lifecycle
│   ├── SceneDelegate.swift            # Scene lifecycle
│   │
│   ├── LoginViewController.swift      # Name entry → navigates to journal
│   ├── MoodViewController.swift       # Core screen: emoji picker + text entry + save
│   ├── HistoryViewController.swift    # Table view of all saved entries
│   │
│   ├── Main.storyboard                # All layouts + segues
│   ├── Assets.xcassets                # App icon + colour assets
│   └── Info.plist
│
├── MoodJournalTests/                  # Unit test target
└── MoodJournalUITests/                # UI test target
```

### Data Model

Solace uses **UserDefaults** for lightweight local persistence. No Core Data, no SQLite — just two parallel arrays:

```swift
// Saving an entry
var moods = UserDefaults.standard.stringArray(forKey: "moodEntries") ?? []
var notes = UserDefaults.standard.stringArray(forKey: "noteEntries") ?? []

moods.append(selectedMood)   // e.g. "😊 Happy"
notes.append(journalNote)    // e.g. "Had a great morning"

UserDefaults.standard.set(moods, forKey: "moodEntries")
UserDefaults.standard.set(notes, forKey: "noteEntries")
```

Entries at the same index form one record. Simple, fast, and survives app restarts.

### Navigation Flow

```
[Login Screen]
      │  "Lets go ->" (push segue)
      ▼
[Mood Journal Screen] ◄────────────────────┐
      │  "View History" (push segue)        │
      ▼                                     │
[History Screen] ──── "Back" button ───────┘
```

---

## 🚀 Getting Started

### Prerequisites

- macOS 13+ (Ventura or later)
- Xcode 15+
- iOS Simulator or a physical iPhone running iOS 15+

### Installation

```bash
# 1. Clone the repo
git clone https://github.com/s44nvi/Swift-Journal.git

# 2. Open in Xcode
cd Swift-Journal
open MoodJournal.xcodeproj
```

```
# 3. In Xcode:
#    → Select your target device / simulator from the toolbar
#    → Press ⌘ + R to build and run
```

No package manager. No `pod install`. No `.env` file. It just runs.

---

## 🎨 Design

Solace uses a nature-inspired colour palette designed to feel calm and grounded the moment you open it.

| Role | Colour | Hex |
|---|---|---|
| Background | Sage Green | `#8FAE8B` |
| Primary Button | Forest Green | `#3E5E43` |
| Primary Text | Near Black | `#1C2B1E` |
| UI Accents | White | `#FFFFFF` |

All screens share the same background colour. No jarring transitions — opening a new screen feels like turning a page, not switching apps.

---

## 🔧 Implementation Highlights

**Emoji selection** — Each of the six emoji buttons carries a `tag` (0–5). A single `@IBAction` reads the tag and maps it to both an emoji string and a label string using a simple switch.

**Persistence on every open** — `HistoryViewController` fetches from `UserDefaults` inside `viewWillAppear`, not `viewDidLoad`. This ensures the list always reflects the very latest save, even if the user bounced between screens.

**Personalised greeting** — The name entered on the login screen is passed to `MoodViewController` via `prepare(for:sender:)` before the segue fires, then interpolated directly into the heading label.

---

## 🛣️ Roadmap

- [ ] Timestamps on every entry
- [ ] Mood trend chart (Swift Charts, iOS 16+)  
- [ ] Daily check-in reminder notifications
- [ ] Dark Mode support
- [ ] iCloud sync across devices
- [ ] Search & filter in history
- [ ] Core Data migration for richer queries

---

## 👥 Authors

**Saanvi - @s44nvi**

## 📄 License

This project is licensed under the MIT License.

```
MIT License — do whatever you want with it, just don't hold us liable.
```

---

<div align="center">

Made with 🌿 and Swift

*If this helped you, leave a ⭐ — it means a lot.*

</div>
