import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:warsha_app/core/config/service_locator.dart';
import 'package:warsha_app/core/theme/app_theme.dart';
import 'package:warsha_app/features/auth/presentation/cubit/language_cubit.dart';
import 'package:warsha_app/features/auth/presentation/screens/welcome_screen.dart';
import 'package:warsha_app/features/home/presentation/bloc/home_bloc.dart';

void main() async {
  // Ensure Flutter binding is initialized for async setup
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator (dependency injection)
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Register Blocs / Cubits
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<LanguageCubit>()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Warsha - حجز صيانة السيارات',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            locale: state.locale,
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
              Locale('fr', ''),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
