import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_demo/core/router/app_routes.dart';
import 'package:riverpod_demo/core/theme/theme_extensions.dart';
import 'package:riverpod_demo/features/settings/providers/settings_provider.dart';
import 'package:riverpod_demo/l10n/app_localizations.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(settingsProvider);
    final spacing = context.spacing;
    final typography = context.typography;
    final appColors = context.appColors;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: EdgeInsets.all(spacing.lg),
        children: [
          Text(l10n.themeMode, style: typography.title),
          SizedBox(height: spacing.sm),
          _ThemeModeSelector(
            current: settings.themeMode,
            onChanged: ref.read(settingsProvider.notifier).setThemeMode,
          ),
          SizedBox(height: spacing.lg),
          Divider(color: appColors.border),
          SizedBox(height: spacing.lg),
          Text(l10n.language, style: typography.title),
          SizedBox(height: spacing.sm),
          _LocaleSelector(
            current: settings.locale,
            onChanged: ref.read(settingsProvider.notifier).setLocale,
          ),
          SizedBox(height: spacing.xl),
          FilledButton.tonal(
            key: const Key('back_to_home_button'),
            onPressed: () => context.go(AppRoutes.home),
            child: Text(l10n.backToHome),
          ),
        ],
      ),
    );
  }
}

class _ThemeModeSelector extends StatelessWidget {
  const _ThemeModeSelector({
    required this.current,
    required this.onChanged,
  });

  final ThemeMode current;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SegmentedButton<ThemeMode>(
      segments: [
        ButtonSegment(
          value: ThemeMode.light,
          label: Text(l10n.themeLight),
          icon: const Icon(Icons.light_mode_outlined),
        ),
        ButtonSegment(
          value: ThemeMode.dark,
          label: Text(l10n.themeDark),
          icon: const Icon(Icons.dark_mode_outlined),
        ),
        ButtonSegment(
          value: ThemeMode.system,
          label: Text(l10n.themeSystem),
          icon: const Icon(Icons.settings_brightness_outlined),
        ),
      ],
      selected: {current},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}

class _LocaleSelector extends StatelessWidget {
  const _LocaleSelector({
    required this.current,
    required this.onChanged,
  });

  final Locale current;
  final ValueChanged<Locale> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SegmentedButton<Locale>(
      segments: [
        ButtonSegment(
          value: const Locale('en'),
          label: Text(l10n.languageEn),
        ),
        ButtonSegment(
          value: const Locale('zh'),
          label: Text(l10n.languageZh),
        ),
      ],
      selected: {current},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
