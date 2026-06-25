import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/app.dart';
import 'package:riverpod_demo/core/theme/app_theme.dart';
import 'package:riverpod_demo/features/settings/providers/settings_provider.dart';
import 'package:riverpod_demo/l10n/app_localizations.dart';

/// Shared pump helpers for widget and golden tests.
class TestApp {
  TestApp({
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('en'),
    this.settingsOverrides = const [],
    this.counterOverrides = const [],
  });

  final ThemeMode themeMode;
  final Locale locale;
  final List<Override> settingsOverrides;
  final List<Override> counterOverrides;

  Widget build() {
    return ProviderScope(
      overrides: [
        settingsProvider.overrideWith(
          () => _TestSettingsNotifier(
            SettingsState(themeMode: themeMode, locale: locale),
          ),
        ),
        ...settingsOverrides,
        ...counterOverrides,
      ],
      child: const RiverpodDemoApp(),
    );
  }

  static Future<void> pump(
    WidgetTester tester, {
    ThemeMode themeMode = ThemeMode.light,
    Locale locale = const Locale('en'),
    List<Override> overrides = const [],
  }) async {
    await tester.pumpWidget(
      TestApp(
        themeMode: themeMode,
        locale: locale,
        settingsOverrides: overrides,
      ).build(),
    );
    await tester.pumpAndSettle();
  }
}

class _TestSettingsNotifier extends SettingsNotifier {
  _TestSettingsNotifier(SettingsState initial) : _initial = initial;

  final SettingsState _initial;

  @override
  SettingsState build() => _initial;
}

/// Minimal Material app for testing a single page without GoRouter.
class TestPageHarness extends StatelessWidget {
  const TestPageHarness({
    required this.child,
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('en'),
    super.key,
  });

  final Widget child;
  final ThemeMode themeMode;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: child,
      ),
    );
  }
}

/// Localized strings for tests — uses gen-l10n lookup, not locale subclasses.
abstract final class TestL10n {
  static AppLocalizations en() =>
      lookupAppLocalizations(const Locale('en'));

  static AppLocalizations zh() =>
      lookupAppLocalizations(const Locale('zh'));
}

/// Keys used across widget, golden, and integration tests.
abstract final class TestKeys {
  static const counterValue = Key('counter_value');
  static const incrementButton = Key('increment_button');
  static const decrementButton = Key('decrement_button');
  static const goToSettingsButton = Key('go_to_settings_button');
  static const backToHomeButton = Key('back_to_home_button');
}
