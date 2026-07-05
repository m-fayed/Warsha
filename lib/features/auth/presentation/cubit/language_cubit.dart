import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warsha_app/core/constants/app_constants.dart';

/// Base state for Language configuration
abstract class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState(this.locale);

  @override
  List<Object?> get props => [locale];
}

/// Initial state of the language setting
class LanguageInitial extends LanguageState {
  const LanguageInitial(super.locale);
}

/// State emitted when the language is changed
class LanguageChanged extends LanguageState {
  const LanguageChanged(super.locale);
}

/// Cubit responsible for managing and persisting the application locale
class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences _sharedPreferences;

  LanguageCubit(this._sharedPreferences)
      : super(LanguageInitial(_getInitialLocale(_sharedPreferences)));

  /// Helper to get the initial locale from persistent storage or default to English ('en')
  static Locale _getInitialLocale(SharedPreferences prefs) {
    final cachedLang = prefs.getString(AppConstants.languageKey);
    if (cachedLang != null && (cachedLang == 'ar' || cachedLang == 'fr' || cachedLang == 'en')) {
      return Locale(cachedLang);
    }
    return const Locale('en'); // Default locale
  }

  /// Change application language, persist the key, and emit the new state
  Future<void> changeLanguage(String langCode) async {
    // Only accept supported language codes
    if (langCode != 'ar' && langCode != 'en' && langCode != 'fr') return;
    
    await _sharedPreferences.setString(AppConstants.languageKey, langCode);
    emit(LanguageChanged(Locale(langCode)));
  }
}
