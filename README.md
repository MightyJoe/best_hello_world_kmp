# best_hello_world_kmp

**The most comprehensive "Hello World" starter for Kotlin Multiplatform + Compose Multiplatform.**  
Professional structure. Maximum shared code. Easy to learn and extend.  
Targets: **Android**, **iOS**, **Desktop** (Windows/macOS/Linux), **Web (Wasm)**.  
Packed with foundations for permissions, Bluetooth, notifications, alarms, theming, navigation, and more — so you can build real apps fast.

## Cross-Platform Features & Roadmap

This template maximizes shared UI and logic with **Compose Multiplatform** across **Android**, **iOS**, **Desktop** (JVM), and **Web (Wasm)**.  
We use `expect/actual` declarations, battle-tested community libraries, and Compose primitives to create clean, unified APIs — while documenting platform differences and providing graceful fallbacks.

### Currently Supported Features

These ship out-of-the-box with strong cross-platform coverage and minimal platform-specific tweaks:

- Shared **UI / Compose Multiplatform** screens and components
- Basic project structure ready for Android, iOS, Desktop, and Web targets

### Planned Features – Target Cross-Platform Coverage

We aim to deliver these with maximum code sharing. Each includes the intended behavior and our planned implementation path.

#### Basic Navigation
**Goal**: Unified navigation stack with back handling and deep linking support.  
**Planned approach**: Compose Navigation (or Decompose / Voyager) with platform-aware back-button behavior via `expect/actual`.

#### Shared Business Logic, Models, and Data Layer
**Goal**: Clean MVVM architecture with repositories, use cases, and shared state management — fully explained in code/comments.  
**Planned approach**: Koin or Kodein for DI, Kotlin Flow / StateFlow for reactive data, and clear separation (data/domain/presentation).

#### Basic Theming & UI Consistency
**Goal**: Uniform Material 3 look & feel with automatic light/dark mode, responsive layouts, and platform-aware adaptations.  
**Planned approach**: Compose `MaterialTheme` + custom `expect/actual` for insets, window size classes, system bars, and native back gestures.

#### Permissions
**Goal**: Unified runtime permission API for camera, Bluetooth, location, notifications, microphone, storage, etc.  
- **Android**: Full runtime flow (rationale + permanent deny)  
- **iOS**: Info.plist descriptions + runtime requests (one-time/always/never)  
- **Desktop**: OS-level file/camera/mic prompts  
- **Web (Wasm)**: Browser permission prompts  
**Planned approach**: Extend **moko-permissions** for mobile + custom `expect/actual` wrappers for desktop/web.

#### Bluetooth (Low Energy)
**Goal**: Reliable BLE scanning, connecting, and GATT operations with graceful fallbacks.  
- **Android / iOS**: Full scan/connect/read/write  
- **Desktop**: Native support via wrappers  
- **Web (Wasm)**: Web Bluetooth API (Chrome/Edge, gesture-required)  
**Planned approach**: **Kable** as core library + Kaluga fallback or custom actuals.

#### Alerts & Dialogs
**Goal**: Consistent alerts, confirmations, toasts, and feedback across platforms.  
- **All**: Shared simple dialogs and error messages  
- **Mobile**: Native-feeling sheets/toasts when needed  
- **Desktop**: Themed or system dialogs  
- **Web**: Browser alerts + custom modals  
**Planned approach**: **Compose Material3** `AlertDialog` / `Snackbar` as primary + `expect/actual` for native fallbacks.

#### Local Notifications
**Goal**: Schedule and show local notifications (sound/vibration where supported).  
- **Android**: Channels + display  
- **iOS**: UNUserNotificationCenter  
- **Desktop**: System tray notifications  
- **Web**: Notification API  
**Planned approach**: **KMPNotifier** or **Alarmee** + unified scheduling.

#### Alarms & Background Scheduling
**Goal**: Best-effort timed wake-ups and tasks.  
- **Android**: AlarmManager (exact/inexact, doze-aware)  
- **iOS**: Limited (notifications / BGTaskScheduler)  
- **Desktop**: JVM timers  
- **Web**: Service Worker timers (limited)  
**Planned approach**: **Alarmee** for mobile + platform fallback timers.

#### Push Notifications (Remote)
**Goal**: Handle remote pushes with deep linking.  
- **Android**: FCM  
- **iOS**: APNs  
- **Desktop / Web**: Experimental (Web Push where possible)  
**Planned approach**: **KMPNotifier** with unified init + platform channels.

### General Roadmap Notes

- Mobile (Android + iOS) gets priority for native fidelity.  
- Desktop leverages JVM APIs and fallbacks.  
- Web (Wasm) documents browser constraints (no true background, gesture limits).  
- UI stays fully shared via Compose wherever possible; native only for unavoidable UX gaps.  
- We welcome contributions — especially desktop/Web support, tests, docs, and bug fixes!

This section will evolve as features graduate from planned → supported.

## Getting Started (Coming Soon)

1. Clone the repo  
2. Open in Android Studio / IntelliJ  
3. Run on Desktop (`./gradlew :composeApp:run`) or Web (`./gradlew :composeApp:wasmJsBrowserDevelopmentRun`) — easiest to test first!  
4. Explore `composeApp/src/commonMain` — that's your shared heart.

More setup details, dependency versions, and code walkthroughs coming next.



---

**Acknowledgments**  
This "best hello world" KMP template is proudly brought to you by MightyJoe. I drove the project direction, feature choices, and hands-on coding — and Grok by xAI was an incredible co-pilot, helping refine ideas, draft sections, and plan for maximum shareability across platforms.

Huge thanks to Grok for the maximally truth-seeking support!

Created with Grok
