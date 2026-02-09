# best_hello_world_kmp
The most comprehensive hello world that gives you all the functionality you could ever want across multiple platforms.

The most features from the get go. Professional. Easy to learn.

## Cross-Platform Features & Roadmap

This template is built with **Compose Multiplatform** to maximize shared UI and logic across **Android**, **iOS**, **Desktop** (JVM: Windows / macOS / Linux), and **Web (Wasm)**.  

The goal is to provide a clean, unified API surface for common mobile/desktop/web needs — using `expect/actual` declarations, community libraries, and Compose primitives wherever possible — while clearly documenting platform-specific limitations and graceful fallbacks.

### Currently Supported Features

These are already implemented with good cross-platform coverage and minimal platform-specific code:

- Shared **UI / Compose Multiplatform** screens and components


### Planned Features – Target Cross-Platform Coverage

We intend to support the following features with as much shared code as possible. Each entry includes the desired behavior across all four platforms and the planned approach.

- Basic navigation (using Compose Navigation or similar)
- Shared business logic, models, and data layer foundations
- Basic theming (light/dark mode detection where available)

#### Permissions

**Goal**: Unified runtime permission requests and status checks for camera, bluetooth, location, notifications, microphone, storage, etc.

- **Android**: Full runtime permission flow (including rationale + permanent deny handling)
- **iOS**: Descriptions in Info.plist + runtime requests (one-time / always / never)
- **Desktop**: OS-level prompts (file access, camera, microphone)
- **Web (Wasm)**: Browser permission prompts (camera, microphone, notifications, geolocation)
- **Planned approach**: Extend **moko-permissions** for mobile + custom `expect/actual` wrappers for desktop and web

#### Bluetooth (Low Energy)

**Goal**: Reliable scanning, connecting, reading/writing characteristics with graceful degradation on limited platforms

- **Android / iOS**: Full BLE scan / connect / GATT operations
- **Desktop**: Platform-native Bluetooth support (via external libraries or native wrappers)
- **Web (Wasm)**: Web Bluetooth API (Chrome/Edge support, user gesture required)
- **Planned approach**: **Kable** as primary shared library + Kaluga fallback or custom actual implementations

#### Alerts & Dialogs

**Goal**: Consistent alert, confirmation, and feedback UI across platforms

- **All platforms**: Shared simple alerts, confirmation dialogs, error messages
- **Mobile**: Native-looking sheets/toasts when needed
- **Desktop**: System-native or themed dialogs
- **Web**: Browser-native alerts + custom modals
- **Planned approach**: **Compose Material3** `AlertDialog` / `Snackbar` as primary shared solution + `expect/actual` for native fallbacks

#### Local Notifications

**Goal**: Schedule and display local notifications (with sound/vibration where supported)

- **Android**: Notification channels + display
- **iOS**: UNUserNotificationCenter
- **Desktop**: System tray / native notifications
- **Web**: Browser Notification API
- **Planned approach**: **KMPNotifier** or **Alarmee** + shared scheduling API

#### Alarms & Background Scheduling

**Goal**: Schedule timed tasks / wake-ups with best-effort reliability

- **Android**: AlarmManager (exact/inexact) + doze-aware fallbacks
- **iOS**: Limited — local notifications or BGTaskScheduler
- **Desktop**: JVM timers / ScheduledExecutorService
- **Web**: Service Worker timers (limited reliability)
- **Planned approach**: **Alarmee** for mobile scheduling + platform-specific fallback timers

#### Push Notifications (Remote)

**Goal**: Receive and handle remote push messages with deep linking

- **Android**: Firebase Cloud Messaging (FCM)
- **iOS**: Apple Push Notification service (APNs)
- **Desktop / Web**: Limited / experimental (Web Push API where possible)
- **Planned approach**: **KMPNotifier** with unified initialization + platform channels

#### Cross-Platform Style & UI Consistency (Theming & Layout)

**Goal**: Uniform look & feel with automatic adaptation to platform conventions

- Shared **Material 3** theming (colors, typography, shapes)
- Automatic light/dark mode following system preference
- Safe area / insets handling (notches, status/navigation bars, desktop window chrome)
- Platform-aware back navigation gestures/behavior
- Responsive layout adjustments (mobile portrait/landscape, desktop window resizing, web viewport)
- **Planned approach**: Compose `MaterialTheme` + custom `expect/actual` for platform insets, window size classes, and native back handling

### General Roadmap Notes

- Mobile platforms (Android + iOS) will receive the strongest native integration first.
- Desktop will leverage JVM-native capabilities and fallbacks.
- Web (Wasm) will clearly document browser limitations (e.g. no reliable background execution, user-gesture restrictions).
- All UI will prefer fully shared **Compose Multiplatform** components; native fallbacks only when Compose cannot deliver acceptable UX.
- We welcome contributions — especially for desktop/Web abstractions, testing, and documentation!

This section will be updated as features move from planned → supported.


