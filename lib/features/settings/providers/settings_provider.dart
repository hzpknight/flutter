import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User preferences: theme mode and locale.
class SettingsNotifier extends Notifier<SettingsState> {
  @override
  SettingsState build() => const SettingsState();

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }
}

@immutable
class SettingsState {
  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
  });

  final ThemeMode themeMode;
  final Locale locale;

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}

final settingsProvider =
    NotifierProvider<SettingsNotifier, SettingsState>(SettingsNotifier.new);
