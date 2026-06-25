import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/router/app_router.dart';
import 'package:riverpod_demo/core/theme/app_theme.dart';
import 'package:riverpod_demo/features/settings/providers/settings_provider.dart';
import 'package:riverpod_demo/l10n/app_localizations.dart';

class RiverpodDemoApp extends ConsumerWidget {
  const RiverpodDemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: settings.themeMode,
      locale: settings.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
