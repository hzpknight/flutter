// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Riverpod 示例';

  @override
  String get homeTitle => '首页';

  @override
  String get settingsTitle => '设置';

  @override
  String get counterLabel => '计数器';

  @override
  String get increment => '增加';

  @override
  String get decrement => '减少';

  @override
  String get goToSettings => '前往设置';

  @override
  String get themeMode => '主题模式';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get language => '语言';

  @override
  String get languageEn => '英语';

  @override
  String get languageZh => '中文';

  @override
  String get backToHome => '返回首页';

  @override
  String get welcomeMessage => '欢迎使用示例应用！';

  @override
  String counterValue(int count) {
    return '当前值：$count';
  }
}
