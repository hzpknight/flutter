// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Riverpod Demo';

  @override
  String get homeTitle => 'Home';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get counterLabel => 'Counter';

  @override
  String get increment => 'Increment';

  @override
  String get decrement => 'Decrement';

  @override
  String get goToSettings => 'Go to Settings';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get language => 'Language';

  @override
  String get languageEn => 'English';

  @override
  String get languageZh => 'Chinese';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get welcomeMessage => 'Welcome to the demo app!';

  @override
  String counterValue(int count) {
    return 'Current value: $count';
  }
}
