# Warsha - Car Maintenance Booking App
## Feature-First Clean Architecture Documentation

## 📋 Project Overview

Warsha is a Flutter mobile application for booking car maintenance services. It follows a **Feature-First Clean Architecture** pattern with strict separation of concerns.

## 🏗️ Architecture Overview

### Folder Structure
```
lib/
├── core/                          # Shared resources
│   ├── config/
│   │   └── service_locator.dart   # Dependency injection setup
│   ├── constants/
│   │   └── app_constants.dart     # App-wide constants
│   ├── extensions/
│   │   └── app_extensions.dart    # Dart extensions (String, List, etc.)
│   ├── network/
│   │   ├── api_result.dart        # API response wrapper
│   │   └── dio_client.dart        # HTTP client configuration
│   └── theme/
│       ├── app_colors.dart        # Color palette
│       ├── app_text_styles.dart   # Typography
│       └── app_theme.dart         # Theme configuration
├── features/
│   ├── home/                      # Home feature
│   │   ├── presentation/
│   │   │   ├── bloc/              # BLoC pattern files
│   │   │   ├── pages/             # Screen pages
│   │   │   └── widgets/           # Reusable widgets
│   │   ├── domain/
│   │   │   ├── entities/          # Business entities
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/          # Business logic
│   │   └── data/
│   │       ├── datasources/       # Local/Remote data access
│   │       ├── models/            # Data models with JSON serialization
│   │       └── repositories/      # Repository implementations
│   └── booking/                   # Booking feature (similar structure)
└── main.dart                      # App entry point
```

## 🎯 Architecture Layers

### 1. **Presentation Layer** (`presentation/`)
- **Pages**: Full-screen widgets
- **Widgets**: Reusable UI components
- **BLoC**: State management and business logic

**Responsibilities**:
- Render UI
- Handle user interactions
- Manage local state with BLoC
- Display data from domain layer

### 2. **Domain Layer** (`domain/`)
- **Entities**: Pure Dart objects (no Flutter dependencies)
- **Repositories**: Abstract interfaces
- **Usecases**: Business logic operations

**Responsibilities**:
- Define business rules
- Provide repository contracts
- Contain all business logic
- Independent of framework

### 3. **Data Layer** (`data/`)
- **Models**: JSON serializable data objects
- **Datasources**: Local/Remote data access
- **Repositories**: Implement domain repositories

**Responsibilities**:
- Fetch data from APIs or local storage
- Transform models to entities
- Handle data caching and persistence

## 🔄 Data Flow

```
UI (BLoC) → Usecase → Repository (Domain) → Repository (Impl) → DataSource
   ↑                                              ↓
   └──────────────────── Entity ─────────────────┘
```

## 🎨 Branding & Theme

### Brand Colors
- **Primary Orange**: `#FF6B00`
- **Dark Theme**: `#1A1A1A` (Charcoal)
- **Light Theme**: `#FAFAFA` (Off-white)

### Typography
Uses Material 3 guidelines with custom styling for Display, Headline, Title, Body, and Label text styles.

## 📦 Dependencies

Key packages used:
- `flutter_bloc: ^8.1.3` - State management
- `dio: ^5.3.1` - HTTP client
- `get_it: ^7.5.0` - Service locator (DI)
- `equatable: ^2.0.5` - Value equality
- `json_annotation: ^4.8.1` - JSON serialization

## 🚀 Getting Started

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Generate JSON Serialization Code
```bash
dart run build_runner build
```

### 3. Run the App
```bash
flutter run
```

## 📝 Adding a New Feature

Follow these steps to add a new feature (e.g., `profile` feature):

### Step 1: Create Directory Structure
```bash
mkdir -p lib/features/profile/{presentation/{bloc,pages,widgets},domain/{entities,repositories,usecases},data/{datasources,models,repositories}}
```

### Step 2: Create Domain Layer

**1. Entity** (`domain/entities/user_entity.dart`):
```dart
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
```

**2. Repository Interface** (`domain/repositories/profile_repository.dart`):
```dart
import 'package:warsha_app/core/network/api_result.dart';
import '../entities/user_entity.dart';

abstract class ProfileRepository {
  Future<ApiResult<User>> getUserProfile();
  Future<ApiResult<void>> updateUserProfile(User user);
}
```

**3. Usecase** (`domain/usecases/get_user_profile_usecase.dart`):
```dart
import 'package:warsha_app/core/network/api_result.dart';
import '../repositories/profile_repository.dart';
import '../entities/user_entity.dart';

class GetUserProfileUsecase {
  final ProfileRepository repository;

  GetUserProfileUsecase({required this.repository});

  Future<ApiResult<User>> call() {
    return repository.getUserProfile();
  }
}
```

### Step 3: Create Data Layer

**1. Model** (`data/models/user_model.dart`):
```dart
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
    id: id,
    name: name,
    email: email,
  );
}
```

**2. Datasource** (`data/datasources/profile_local_data_source.dart`):
```dart
import 'package:warsha_app/core/network/api_result.dart';
import '../models/user_model.dart';

abstract class ProfileLocalDataSource {
  Future<ApiResult<UserModel>> getUserProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<ApiResult<UserModel>> getUserProfile() async {
    // Mock data or API call
    await Future.delayed(const Duration(seconds: 1));
    return ApiSuccess(UserModel(
      id: '1',
      name: 'محمد أحمد',
      email: 'user@example.com',
    ));
  }
}
```

**3. Repository Implementation** (`data/repositories/profile_repository_impl.dart`):
```dart
import 'package:warsha_app/core/network/api_result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl({required this.localDataSource});

  @override
  Future<ApiResult<User>> getUserProfile() async {
    final result = await localDataSource.getUserProfile();
    return result.when(
      success: (data) => ApiSuccess(data.toEntity()),
      failure: (message, statusCode) => ApiFailure(
        message: message,
        statusCode: statusCode,
      ),
    );
  }

  @override
  Future<ApiResult<void>> updateUserProfile(User user) async {
    // Implementation
    return const ApiSuccess(null);
  }
}
```

### Step 4: Create Presentation Layer

**1. BLoC Events** (`presentation/bloc/profile_event.dart`):
```dart
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class LoadUserProfileEvent extends ProfileEvent {
  const LoadUserProfileEvent();
  
  @override
  List<Object?> get props => [];
}
```

**2. BLoC States** (`presentation/bloc/profile_state.dart`):
```dart
import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState();
  
  @override
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState();
  
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final User user;

  const ProfileLoadedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
```

**3. BLoC** (`presentation/bloc/profile_bloc.dart`):
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_user_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUsecase getUserProfileUsecase;

  ProfileBloc({required this.getUserProfileUsecase})
      : super(const ProfileInitialState()) {
    on<LoadUserProfileEvent>(_onLoadUserProfile);
  }

  Future<void> _onLoadUserProfile(
    LoadUserProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoadingState());
    final result = await getUserProfileUsecase();

    result.when(
      success: (user) => emit(ProfileLoadedState(user: user)),
      failure: (message, _) => emit(ProfileErrorState(message: message)),
    );
  }
}
```

### Step 5: Register in Service Locator

Update `lib/core/config/service_locator.dart`:
```dart
// Profile Feature - Data Sources
getIt.registerSingleton<ProfileLocalDataSource>(
  ProfileLocalDataSourceImpl(),
);

// Profile Feature - Repositories
getIt.registerSingleton<ProfileRepository>(
  ProfileRepositoryImpl(
    localDataSource: getIt<ProfileLocalDataSource>(),
  ),
);

// Profile Feature - Usecases
getIt.registerSingleton<GetUserProfileUsecase>(
  GetUserProfileUsecase(
    repository: getIt<ProfileRepository>(),
  ),
);

// Profile Feature - Bloc
getIt.registerSingleton<ProfileBloc>(
  ProfileBloc(
    getUserProfileUsecase: getIt<GetUserProfileUsecase>(),
  ),
);
```

### Step 6: Create UI

**Profile Page** (`presentation/pages/profile_page.dart`):
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const LoadUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is ProfileLoadedState) {
            return Center(
              child: Text(state.user.name),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
```

### Step 7: Update main.dart

Add the new BLoC to `MultiBlocProvider`:
```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => getIt<HomeBloc>()),
    BlocProvider(create: (context) => getIt<ProfileBloc>()),
  ],
  child: // ...
)
```

## 📚 Best Practices

1. **Entities are immutable** - Use `const` constructors
2. **Use Equatable** - Simplifies value comparison
3. **Keep domain layer independent** - No Flutter or external dependencies
4. **Error handling** - Use `ApiResult` for all async operations
5. **Naming conventions** - Use clear, descriptive names
6. **Comments** - Add meaningful comments for complex logic
7. **Test features independently** - Each layer can be tested separately

## 🔧 Useful Commands

```bash
# Generate JSON serialization code
dart run build_runner build

# Watch for changes and rebuild
dart run build_runner watch

# Format code
dart format lib/

# Analyze code
dart analyze

# Run tests
flutter test
```

## 🐛 Troubleshooting

### JSON Serialization Not Generated
Run: `dart run build_runner clean && dart run build_runner build`

### Import Errors
Ensure all imports use the full package name: `package:warsha_app/...`

### BLoC Not Updating
- Verify BLoC is registered in service locator
- Check that events are properly emitted
- Ensure states are not nested (use immutable states)

## 📞 Support

For issues or questions about the architecture, refer to:
- [BLoC Documentation](https://bloclibrary.dev)
- [Clean Architecture Guide](https://resocoder.com/flutter-clean-architecture)
