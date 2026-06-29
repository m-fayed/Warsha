# Warsha - Car Maintenance Booking App

<div align="center">

![Warsha Logo](https://img.shields.io/badge/Warsha-Car%20Maintenance%20Booking-FF6B00)
![Flutter](https://img.shields.io/badge/Flutter-3.10.7%2B-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-In%20Development-orange)

**A professional car maintenance booking application built with Flutter & Clean Architecture**

[Features](#-features) • [Architecture](#-architecture) • [Getting Started](#-getting-started) • [Documentation](#-documentation)

</div>

---

## 🚗 Project Overview

**Warsha** is a Flutter mobile application that revolutionizes the way car owners book maintenance services. Users can browse local workshops, check ratings and services, and schedule appointments with ease.

Built with professional architecture standards, the codebase is designed to be scalable, testable, and maintainable.

## ✨ Key Features

- 🏭 **Browse Workshops** - Discover nearby car maintenance workshops
- 🔍 **Advanced Search** - Filter by location, rating, and services offered
- 📅 **Easy Booking** - Schedule appointments in just a few taps
- ⏰ **Booking Management** - Track upcoming and completed appointments
- ⭐ **Ratings & Reviews** - Read customer reviews and workshop ratings
- 🌓 **Dark/Light Mode** - Beautiful UI with theme support
- 🌍 **Arabic Support** - Full RTL support for Arabic language

## 🏗️ Architecture

This project implements **Feature-First Clean Architecture** with three distinct layers per feature:

### Architecture Layers

```
┌─────────────────────────────────────────┐
│      PRESENTATION LAYER (UI)            │
│  Pages, Widgets, BLoC (State Mgmt)     │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│      DOMAIN LAYER (Business Logic)      │
│  Entities, Repositories, Usecases      │
└──────────────┬──────────────────────────┘
               │
┌──────────────▼──────────────────────────┐
│      DATA LAYER (Data Access)           │
│  Models, Datasources, Repositories     │
└─────────────────────────────────────────┘
```

### Project Structure

```
lib/
├── core/                                 # Shared resources
│   ├── config/service_locator.dart      # Dependency injection
│   ├── constants/app_constants.dart     # App-wide constants
│   ├── extensions/app_extensions.dart   # Dart extensions
│   ├── network/
│   │   ├── api_result.dart             # API response wrapper
│   │   └── dio_client.dart             # HTTP client
│   └── theme/
│       ├── app_colors.dart             # Color palette
│       ├── app_text_styles.dart        # Typography
│       └── app_theme.dart              # Theme configuration
├── features/                            # Feature modules
│   ├── home/
│   │   ├── presentation/
│   │   │   ├── bloc/                   # BLoC pattern (events, states, bloc)
│   │   │   ├── pages/                  # Full-screen pages
│   │   │   └── widgets/                # Reusable widgets
│   │   ├── domain/
│   │   │   ├── entities/               # Business entities
│   │   │   ├── repositories/           # Repository interfaces
│   │   │   └── usecases/               # Business logic
│   │   └── data/
│   │       ├── datasources/            # Local/Remote data access
│   │       ├── models/                 # JSON-serializable models
│   │       └── repositories/           # Repository implementations
│   └── booking/                         # Similar structure
└── main.dart                            # App entry point
```

## 🎨 Branding & Theme

### Color Scheme

| Element | Color | Usage |
|---------|-------|-------|
| **Primary Orange** | #FF6B00 | Buttons, highlights, primary actions |
| **Dark Charcoal** | #1A1A1A | Dark theme background |
| **Dark Secondary** | #2D2D2D | Secondary dark surfaces |
| **Light Background** | #FAFAFA | Light theme background |
| **Success Green** | #4CAF50 | Success states, confirmations |
| **Error Red** | #F44336 | Error states, warnings |
| **Warning Yellow** | #FFC107 | Warning notifications |
| **Info Blue** | #2196F3 | Information messages |

### Typography

- **Display Styles**: Large headings (32px, Bold)
- **Headlines**: Section headers (20-22px, Semi-Bold)
- **Titles**: Card titles and labels (14-16px, Semi-Bold)
- **Body**: Regular text (12-16px, Regular)
- **Labels**: Badges and small text (11-14px, Medium)

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: 3.10.7 or higher
- **Dart SDK**: 3.10.7 or higher (included with Flutter)
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA
- **Git**: For version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/warsha_app.git
   cd warsha_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate JSON serialization code**
   ```bash
   dart run build_runner build
   ```
   > Note: Run this after any changes to `@JsonSerializable()` classes

4. **Run the application**
   ```bash
   flutter run
   ```

## 📦 Dependencies

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| **flutter_bloc** | ^8.1.3 | State management with BLoC pattern |
| **bloc** | ^8.1.1 | Core BLoC library |
| **dio** | ^5.3.1 | HTTP client with interceptors |
| **get_it** | ^7.5.0 | Service locator (Dependency Injection) |
| **equatable** | ^2.0.5 | Value equality helper |
| **json_annotation** | ^4.8.1 | JSON serialization annotations |
| **intl** | ^0.19.0 | Internationalization support |
| **shared_preferences** | ^2.2.2 | Local data storage |

### Dev Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| **build_runner** | ^2.4.8 | Code generation |
| **json_serializable** | ^6.8.0 | JSON serialization generator |
| **bloc_test** | ^9.1.0 | BLoC testing utilities |

## 📚 Development Workflow

### Useful Commands

```bash
# Install dependencies
flutter pub get

# Generate JSON serialization code
dart run build_runner build

# Watch for changes (rebuild on save)
dart run build_runner watch

# Analyze code for issues
flutter analyze

# Format code
dart format lib/

# Run tests
flutter test

# Run specific test file
flutter test test/features/home/domain/usecases/get_featured_workshops_usecase_test.dart

# Build release APK (Android)
flutter build apk --release

# Build release iOS app
flutter build ios --release

# Build web app
flutter build web --release
```

### Code Style Guidelines

1. **File naming**: `snake_case.dart`
2. **Class naming**: `PascalCase`
3. **Variable naming**: `camelCase`
4. **Constants**: `SCREAMING_SNAKE_CASE`
5. **One class per file** (except for related small classes)
6. **Imports**: Organized by source (dart, flutter, packages, relative)

```dart
// Correct import organization
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import '../domain/repositories/home_repository.dart';
```

## 🔄 Data Flow Example

### Home Feature Flow

```
User opens app
    ↓
HomePage initializes
    ↓
HomeBloc receives LoadFeaturedWorkshopsEvent
    ↓
GetFeaturedWorkshopsUsecase is called
    ↓
HomeRepository is called
    ↓
HomeLocalDataSource fetches mock data
    ↓
Data is transformed to Entity
    ↓
HomeBloc emits HomeLoadedState
    ↓
UI rebuilds with new state
    ↓
Workshop cards are displayed
```

## 🏭 Adding a New Feature

### Step-by-Step Guide

For a complete guide on adding a new feature, see [ARCHITECTURE.md](ARCHITECTURE.md).

#### Quick Summary:

1. **Create directories**
   ```bash
   mkdir -p lib/features/{feature_name}/{presentation,domain,data}
   ```

2. **Domain Layer** (business logic)
   - Create entity: `domain/entities/{entity}.dart`
   - Create repository interface: `domain/repositories/{feature}_repository.dart`
   - Create usecases: `domain/usecases/{usecase}_usecase.dart`

3. **Data Layer** (data access)
   - Create models: `data/models/{model}_model.dart`
   - Create datasource: `data/datasources/{feature}_data_source.dart`
   - Create repository impl: `data/repositories/{feature}_repository_impl.dart`

4. **Presentation Layer** (UI)
   - Create bloc: `presentation/bloc/{feature}_bloc.dart`
   - Create events: `presentation/bloc/{feature}_event.dart`
   - Create states: `presentation/bloc/{feature}_state.dart`
   - Create pages: `presentation/pages/{feature}_page.dart`
   - Create widgets: `presentation/widgets/{widget}.dart`

5. **Register in service locator**
   - Update `lib/core/config/service_locator.dart`

6. **Add to main.dart**
   - Add BLoC to `MultiBlocProvider`

## 🧪 Testing

The project supports unit, widget, and integration testing.

### Testing Examples

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/features/home/presentation/bloc/home_bloc_test.dart
```

## 🐛 Troubleshooting

### Common Issues

**Issue**: JSON models not generating `.g.dart` files
```bash
Solution: dart run build_runner clean && dart run build_runner build
```

**Issue**: Flutter build fails
```bash
Solution: flutter clean && flutter pub get && dart run build_runner build
```

**Issue**: Port already in use
```bash
Solution: flutter run -d chrome  # Use web instead
```

**Issue**: Package version conflicts
```bash
Solution: flutter pub upgrade
```

## 📖 Documentation

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Detailed architecture explanation and feature creation guide
- **[PROJECT_STRUCTURE.sh](PROJECT_STRUCTURE.sh)** - Visual project structure reference
- **[Flutter Docs](https://flutter.dev/docs)** - Official Flutter documentation
- **[BLoC Docs](https://bloclibrary.dev)** - BLoC state management documentation
- **[Clean Architecture](https://resocoder.com/flutter-clean-architecture)** - Clean Architecture principles

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Create a new branch: `git checkout -b feature/your-feature`
2. Follow the architecture patterns established in the project
3. Write clear, descriptive commit messages
4. Test your changes thoroughly
5. Submit a pull request with a detailed description

### Contribution Guidelines

- Follow the existing code style
- Maintain the clean architecture pattern
- Add tests for new features
- Update documentation as needed
- Keep commits atomic and focused

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Team

- **Project Lead**: Your Name
- **Flutter Developer**: You
- **UI/UX Designer**: You

## 🙏 Acknowledgments

- Built with [Flutter](https://flutter.dev)
- State management with [BLoC](https://bloclibrary.dev)
- HTTP client using [Dio](https://pub.dev/packages/dio)
- Dependency injection with [GetIt](https://pub.dev/packages/get_it)

---

<div align="center">

**Made with ❤️ for car maintenance booking**

[⬆ back to top](#warsha---car-maintenance-booking-app)

</div>
