# best_hello_world_kmp

[![Kotlin](https://img.shields.io/badge/Kotlin-1.9.22-blue.svg?logo=kotlin)](https://kotlinlang.org)
[![Compose Multiplatform](https://img.shields.io/badge/Compose%20Multiplatform-1.6.0-purple.svg?logo=jetpackcompose)](https://www.jetbrains.com/lp/compose-multiplatform/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/badge/Build-Passing-green.svg)](https://github.com/MightyJoe/best_hello_world_kmp/actions)  <!-- Update once CI is set up -->

**The most comprehensive "Hello World" starter for Kotlin Multiplatform + Compose Multiplatform.**  
Professional structure. Maximum shared code. Easy to learn and extend.  
Targets: **Android**, **iOS**, **Desktop** (Windows/macOS/Linux), **Web (Wasm)**.  
Packed with foundations for permissions, Bluetooth, notifications, alarms, theming, navigation, and more — so you can build real apps fast.

## Cross-Platform Features & Roadmap

This template maximizes shared UI and logic with **Compose Multiplatform** across **Android**, **iOS**, **Desktop** (JVM), and **Web (Wasm)**.  
We use `expect/actual` declarations, battle-tested community libraries, and Compose primitives to create clean, unified APIs — while documenting platform differences and providing graceful fallbacks.

### Currently Supported Features

These ship out-of-the-box with strong cross-platform coverage and minimal platform-specific tweaks:

- Shared **UI / Compose Multiplatform** screen

### Planned Features – Target Cross-Platform Coverage

Aiming to deliver these with maximum code sharing. Each includes the intended behavior and our planned implementation path.

## Architecture & Design Overview (Planned)

This project is a comprehensive **Kotlin Multiplatform (KMP)** "Hello World" template built with **Compose Multiplatform**.  
It aims to be the best starting point for ambitious cross-platform apps targeting **Android, iOS, Desktop (JVM), and Web (Wasm)** with maximum code sharing.

### Architecture vs Design

| Aspect                  | Architecture (Big Structure)                          | Design (Code Style & Quality)                          | Why This Choice |
|-------------------------|-------------------------------------------------------|--------------------------------------------------------|-----------------|
| **Overall Pattern**     | MVVM (Model-View-ViewModel) + Unidirectional Data Flow | Rich Domain Model (where it makes sense)              | Familiar to mobile devs + intuitive for complex features |
| **Code Sharing**        | Kotlin Multiplatform with Compose Multiplatform       | Maximum shared code in `commonMain`                   | Write once, run everywhere (UI + logic) |
| **Layer Organization**  | Clear separation: UI → ViewModel → Domain → Data     | Thin ViewModels + Rich Domain Models                  | Keeps UI simple and business logic testable |
| **Folder Structure**    | Feature-based + Layer-based                           | Domain objects represent real concepts                | Scalable as the "Hello World" grows into a real app |
| **Platform Specific**   | `expect/actual` + platform modules                    | Abstracted via interfaces                             | Clean platform differences without polluting shared code |

### Layer Responsibilities

| Layer              | Responsibility                                              | Location                              | Contains                                      | Should NOT Contain |
|--------------------|-------------------------------------------------------------|---------------------------------------|-----------------------------------------------|--------------------|
| **Views / UI**     | Rendering screens and handling user input                   | `composeApp/src/commonMain/kotlin/.../ui/` | Compose screens, components, navigation      | Business logic |
| **ViewModels**     | UI state management and user actions                        | `.../presentation/` or `viewmodels/`  | StateFlow, UI events, commands                | Domain rules, data access |
| **Domain**         | Core business logic and real-world concepts                 | `.../domain/`                         | Entities, Use Cases, Repositories (interfaces) | UI, platform APIs |
| **Data**           | Data sources and repositories                               | `.../data/`                           | Local storage, network, mappers               | UI state |
| **Services**       | Coordination and orchestration                              | `.../services/` or `core/`            | Feature services, platform abstractions       | Direct UI updates |
| **Platform**       | Platform-specific implementations                           | `androidMain`, `iosMain`, `jvmMain`, `wasmMain` | Permissions, Bluetooth, Notifications, etc. | Shared business logic |

### Project Folder Structure (Proposed)

```text
best_hello_world_kmp/
├── composeApp/
│   └── src/
│       ├── commonMain/kotlin/
│       │   ├── di/                  ← Dependency Injection
│       │   ├── domain/              ← Rich Domain Models + Use Cases
│       │   ├── data/                ← Repositories, DTOs, Mappers
│       │   ├── presentation/        ← ViewModels + UI State
│       │   ├── ui/                  ← Compose Screens & Components
│       │   ├── navigation/          ← Navigation setup
│       │   ├── theme/               ← Theming
│       │   └── core/                ← Utilities, extensions, constants
│       ├── androidMain/             ← Android-specific
│       ├── iosMain/                 ← iOS-specific
│       ├── jvmMain/                 ← Desktop
│       └── wasmMain/                ← Web
├── iosApp/                          ← Xcode project for iOS
├── androidApp/                      ← Optional Android app module (if needed)
├── build.gradle.kts
├── settings.gradle.kts
└── README.md

```

#### Basic Navigation
**Goal**: Unified navigation stack with back handling and deep linking support.  
**Planned approach**: Compose Navigation with platform-aware back-button behavior via `expect/actual`.

#### Shared Business Logic, Models, and Data Layer
**Goal**: MVVM-ish architecture with repositories, use cases, and shared state management — fully explained in code/comments.  
**Planned approach**: Uni-directional data flow, and clear separation of concerns.

#### Basic Theming & UI Consistency
**Goal**: Fully customizable and easy to learn UI theming.
**Planned approach**: Custom easy to learn and organized well. With colors,Elements, etc.

#### Permissions
**Goal**: Unified runtime permission API for camera, Bluetooth, location, notifications, microphone, storage, etc.  
- **Android**: Full runtime flow (rationale + permanent deny)  
- **iOS**: Info.plist descriptions + runtime requests (one-time/always/never)  
- **Desktop**: OS-level file/camera/mic prompts  
- **Web (Wasm)**: Browser permission prompts  
**Planned approach**: Extend **moko-permissions** for mobile perhaps, plus custom `expect/actual` wrappers for desktop/web.

#### Bluetooth (Low Energy)
**Goal**: Reliable BLE scanning, connecting, and GATT operations with graceful fallbacks.  
- **Android / iOS**: Full scan/connect/read/write  
- **Desktop**: Native support via wrappers  
- **Web (Wasm)**: Web Bluetooth API (Chrome/Edge, gesture-required)  
**Planned possible approaches**: **Kable** as core library + Kaluga fallback or custom actuals. Either that or a custom implementation.

#### Alerts & Dialogs
**Goal**: Consistent alerts, confirmations, toasts, and feedback across platforms.  
- **All**: Shared simple dialogs and error messages  
- **Mobile**: Native-feeling sheets/toasts when needed  
- **Desktop**: Themed or system dialogs  
- **Web**: Browser alerts + custom modals  
**Planned possible approach**: **Compose Material3** `AlertDialog` / `Snackbar` as primary if material will let me piecemeal just AlertDialog + `expect/actual` for native fallbacks.

#### Local Notifications
**Goal**: Schedule and show local notifications (sound/vibration where supported).  
- **Android**: Channels + display  
- **iOS**: UNUserNotificationCenter  
- **Desktop**: System tray notifications  
- **Web**: Notification API  
**Planned possible approaches**: **KMPNotifier** or **Alarmee** + unified scheduling.

#### Alarms & Background Scheduling
**Goal**: Best-effort timed wake-ups and tasks.  
- **Android**: AlarmManager (exact/inexact, doze-aware)  
- **iOS**: Limited (notifications / BGTaskScheduler)  
- **Desktop**: JVM timers  
- **Web**: Service Worker timers (limited)  
**Planned possible approach**: **Alarmee** for mobile + platform fallback timers.

#### Push Notifications (Remote)
**Goal**: Handle remote pushes with deep linking.  
- **Android**: FCM  
- **iOS**: APNs  
- **Desktop / Web**: Experimental (Web Push where possible)  
**Planned possible approach**: **KMPNotifier** with unified init + platform channels.

### General Roadmap Notes

- Mobile (Android + iOS) gets priority for native fidelity.  
- Desktop leverages JVM APIs and fallbacks.  
- Web (Wasm) documents browser constraints (no true background, gesture limits).
- UI stays fully shared via Compose wherever possible; native only for unavoidable UX gaps.  

This section will evolve as features graduate from planned → supported.

## Getting Started (Coming Soon)

1. Clone the repo  
2. Open in Android Studio / IntelliJ  
3. Run on Desktop (`./gradlew :composeApp:run`) or Web (`./gradlew :composeApp:wasmJsBrowserDevelopmentRun`) — easiest to test first!  
4. Explore `composeApp/src/commonMain` — that's your shared heart.

More setup details, dependency versions, and code walkthroughs coming...


---

**Acknowledgments**  
This "best hello world" KMP template is proudly brought to you by MightyJoe. I drove the project direction, feature choices, and hands-on coding — and Grok by xAI was an incredible co-pilot, helping refine ideas, draft sections, and plan for maximum shareability across platforms.

Huge thanks to Grok for the maximally truth-seeking support!

Created with Grok
