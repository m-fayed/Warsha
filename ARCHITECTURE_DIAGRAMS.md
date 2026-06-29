# Warsha Project - Visual Architecture Diagrams

## 📊 Complete Architecture Overview

```
┌──────────────────────────────────────────────────────────────────────┐
│                         PRESENTATION LAYER                           │
│                      (User Interface & State)                        │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌─────────────────────┐  ┌──────────────────┐  ┌──────────────────┐│
│  │   HomePage (Page)   │  │  WorkshopCard    │  │   BookingCard    ││
│  │   - RefreshIndicator│  │   (Widget)       │  │   (Widget)       ││
│  │   - List Views      │  │   - Image        │  │   - Status Badge ││
│  │   - Error Handling  │  │   - Rating       │  │   - Details      ││
│  └─────────┬───────────┘  └──────────────────┘  └──────────────────┘│
│            │                                                         │
│  ┌─────────▼───────────────────────────────────────────────────────┐│
│  │                       HomeBloc                                  ││
│  │  ┌──────────────────────────────────────────────────────────┐  ││
│  │  │ Events:                                                  │  ││
│  │  │  • LoadFeaturedWorkshopsEvent                           │  ││
│  │  │  • LoadUpcomingBookingsEvent                            │  ││
│  │  │  • RefreshHomeDataEvent                                 │  ││
│  │  └──────────────────────────────────────────────────────────┘  ││
│  │  ┌──────────────────────────────────────────────────────────┐  ││
│  │  │ States:                                                  │  ││
│  │  │  • HomeInitialState                                     │  ││
│  │  │  • HomeLoadingState                                     │  ││
│  │  │  • HomeLoadedState (workshops, bookings)               │  ││
│  │  │  • HomeErrorState (error message)                      │  ││
│  │  └──────────────────────────────────────────────────────────┘  ││
│  └─────────────────┬───────────────────────────────────────────────┘│
│                    │                                                 │
└────────────────────┼─────────────────────────────────────────────────┘
                     │
                     │ calls Usecases
                     ▼
┌──────────────────────────────────────────────────────────────────────┐
│                       DOMAIN LAYER                                   │
│                  (Business Logic & Rules)                            │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌──────────────────────┐      ┌──────────────────────┐             │
│  │   GetFeaturedWorks   │      │  GetUpcomingBookings │             │
│  │   hopsUsecase        │      │  Usecase             │             │
│  │                      │      │                      │             │
│  │  • Call repository   │      │  • Call repository   │             │
│  │  • No side effects   │      │  • No side effects   │             │
│  └──────┬───────────────┘      └─────────┬────────────┘             │
│         │                                │                          │
│         └────────────┬────────────────────┘                          │
│                      │ implements                                   │
│         ┌────────────▼──────────────────────┐                       │
│         │   HomeRepository (Interface)      │                       │
│         │                                   │                       │
│         │  • getFeaturedWorkshops()         │                       │
│         │  • getUpcomingBookings()          │                       │
│         │  • getWorkshopDetails()           │                       │
│         │  • getAvailableTimeSlots()        │                       │
│         └────────────┬──────────────────────┘                       │
│                      │ returns ApiResult<Entity>                    │
│         ┌────────────▼──────────────────────┐                       │
│         │  Entities                         │                       │
│         │  • Workshop                       │                       │
│         │  • Booking                        │                       │
│         │  (Pure Dart, no dependencies)     │                       │
│         └───────────────────────────────────┘                       │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
                       ▲
                       │ implements
                       │
┌──────────────────────┴──────────────────────────────────────────────┐
│                       DATA LAYER                                    │
│                  (Data Access & Storage)                            │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │      HomeRepositoryImpl (Repository Implementation)         │   │
│  │                                                             │   │
│  │  • Calls datasource                                        │   │
│  │  • Transforms Models → Entities                           │   │
│  │  • Error handling                                          │   │
│  └────────────────┬────────────────────────────────────────────┘   │
│                   │                                                 │
│  ┌────────────────▼────────────────────────────────────────────┐   │
│  │      HomeLocalDataSource                                   │   │
│  │      (Mock/Local Data Access)                              │   │
│  │                                                             │   │
│  │  • getFeaturedWorkshops() → Mock data                      │   │
│  │  • getUpcomingBookings() → Mock data                       │   │
│  │  • getWorkshopDetails() → Mock data                        │   │
│  │  • getAvailableTimeSlots() → Mock data                     │   │
│  └────────────────┬────────────────────────────────────────────┘   │
│                   │                                                 │
│  ┌────────────────▼────────────────────────────────────────────┐   │
│  │  Models (JSON Serializable)                               │   │
│  │  • WorkshopModel                                           │   │
│  │  • BookingModel                                            │   │
│  │  (transforms to Entity via toEntity())                    │   │
│  └─────────────────────────────────────────────────────────────┘   │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

---

## 🎯 Feature Module Structure Pattern

```
features/
└── {feature_name}/
    │
    ├── presentation/              ← UI LAYER
    │   ├── bloc/
    │   │   ├── {feature}_bloc.dart
    │   │   ├── {feature}_event.dart
    │   │   └── {feature}_state.dart
    │   ├── pages/
    │   │   └── {feature}_page.dart
    │   └── widgets/
    │       ├── {widget_name}.dart
    │       └── {another_widget}.dart
    │
    ├── domain/                    ← BUSINESS LOGIC LAYER
    │   ├── entities/
    │   │   └── {entity}.dart
    │   ├── repositories/
    │   │   └── {feature}_repository.dart
    │   └── usecases/
    │       └── {usecase}_usecase.dart
    │
    └── data/                      ← DATA ACCESS LAYER
        ├── datasources/
        │   └── {feature}_data_source.dart
        ├── models/
        │   └── {model}_model.dart
        └── repositories/
            └── {feature}_repository_impl.dart
```

---

## 🔄 Dependency Injection Flow

```
┌─────────────────────────────────────────────────────────────────┐
│               service_locator.dart (GetIt Setup)               │
└────────────────────┬────────────────────────────────────────────┘
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
    ┌────────┐  ┌────────┐  ┌────────┐
    │ DioClient│  │Datasource│  │Repository
    └────┬───┘  └────┬───┘  └────┬───┘
         │           │           │
         └───────────┼───────────┘
                     │ injected via Constructor
                     ▼
         ┌───────────────────────┐
         │  HomeRepositoryImpl    │
         └───────────┬───────────┘
                     │ injected via Constructor
                     ▼
         ┌───────────────────────┐
         │  Usecases             │
         │  • GetFeatured...     │
         │  • GetUpcoming...     │
         └───────────┬───────────┘
                     │ injected via Constructor
                     ▼
         ┌───────────────────────┐
         │  HomeBloc             │
         └───────────┬───────────┘
                     │ registered in MultiBlocProvider
                     ▼
         ┌───────────────────────┐
         │  MaterialApp           │
         └───────────────────────┘
```

---

## 🎨 Theme Architecture

```
┌────────────────────────────────────────────┐
│          AppTheme (app_theme.dart)         │
├────────────────────────────────────────────┤
│                                            │
│  ┌──────────────────────────────────────┐ │
│  │  Light Theme (lightTheme getter)     │ │
│  │  ┌────────────────────────────────┐  │ │
│  │  │ Colors from AppColors          │  │ │
│  │  │ • primaryOrange                │  │ │
│  │  │ • lightBg, lightCardBg         │  │ │
│  │  │ • textDark, textGrey           │  │ │
│  │  │ Styles from AppTextStyles      │  │ │
│  │  │ • appBarTitle, buttonText      │  │ │
│  │  │ • bodyLarge, bodyMedium        │  │ │
│  │  └────────────────────────────────┘  │ │
│  └──────────────────────────────────────┘ │
│                                            │
│  ┌──────────────────────────────────────┐ │
│  │  Dark Theme (darkTheme getter)       │ │
│  │  ┌────────────────────────────────┐  │ │
│  │  │ Colors from AppColors          │  │ │
│  │  │ • primaryOrange (same)         │  │ │
│  │  │ • darkBg, darkCardBg           │  │ │
│  │  │ • textLight, textGreyLight     │  │ │
│  │  │ • borderDark                   │  │ │
│  │  │ Same typography as light       │  │ │
│  │  └────────────────────────────────┘  │ │
│  └──────────────────────────────────────┘ │
│                                            │
└────────────────────────────────────────────┘
         │
         │ uses
         │
    ┌────▼─────────────────────────────┐
    │    AppColors (app_colors.dart)   │
    │    • 🟠 Brand Colors             │
    │    • ⬛ Dark/Light Backgrounds   │
    │    • ✅ Semantic Colors          │
    │    • 🔤 Text Colors              │
    └────────────────────────────────────┘
         │
         │ uses
         │
    ┌────▼──────────────────────────┐
    │  AppTextStyles (app_text_...) │
    │  • Display (32px)              │
    │  • Headline (20-22px)          │
    │  • Title (14-16px)             │
    │  • Body (12-16px)              │
    │  • Label (11-14px)             │
    └────────────────────────────────┘
```

---

## 📡 API Integration Future

```
Current: Mock Data Sources
┌────────────────────────────┐
│ HomeLocalDataSource        │
│ (Mock Data)                │
│ • Returns hardcoded data   │
│ • Simulates network delay  │
└────────────────────────────┘

Future: Real API Sources
┌────────────────────────────┐
│ HomeRemoteDataSource       │
│ (Real API)                 │
│ • Uses DioClient           │
│ • Makes HTTP requests      │
│ • Returns models from API  │
└────────────────────────────┘
       ▲
       │ calls
       │
┌──────┴────────────────────┐
│  DioClient                 │
│  • base_url setup          │
│  • Interceptors            │
│  • Error handling          │
│  • Request logging         │
└────────────────────────────┘
```

---

## 🧪 Testing Architecture

```
Unit Tests                 Widget Tests           Integration Tests
┌──────────────────────┐  ┌──────────────────┐  ┌────────────────────┐
│ Domain Layer Tests   │  │ Presentation     │  │ End-to-End Flow    │
│ • Entity tests       │  │ Tests            │  │ • Full app journey  │
│ • UseCase tests      │  │ • Page tests     │  │ • API integration   │
│ • Repository tests   │  │ • Widget tests   │  │ • User workflows    │
└──────────────────────┘  │ • BLoC tests     │  └────────────────────┘
                          └──────────────────┘
```

---

## 🌐 Supported Platforms

```
        Flutter Web
            ▲
            │
        ┌───┴───┐
        │       │
   Mobile    Desktop
   ┌──┴──┐    ┌──┴──┐
Android iOS  Linux macOS Windows
```

---

## 📊 Performance Considerations

```
Layer           Optimization
─────────────────────────────────────────────
Presentation    • BLoC rebuilds only affected widgets
                • Const constructors for immutability
                • Lazy loading of lists

Domain          • No I/O operations
                • Lightweight computations
                • Pure functions

Data            • Caching with shared_preferences
                • Dio connection pooling
                • Model transformation efficiency
```

---

## 🔐 Security Layers

```
┌─────────────────────────────────────┐
│    API Key Management               │
│    (Future: Environment variables)  │
└─────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────┐
│    DioClient with SSL Pinning       │
│    (Future: Certificate validation) │
└─────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────┐
│    Request/Response Encryption      │
│    (Future: AES encryption)         │
└─────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────┐
│    Local Data Encryption            │
│    (Future: Secure storage)         │
└─────────────────────────────────────┘
```

---

This project is structured for **scalability**, **maintainability**, and **professional development**. Each layer has clear responsibilities, making it easy to extend and test.
