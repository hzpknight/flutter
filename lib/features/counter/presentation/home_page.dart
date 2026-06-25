import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_demo/core/router/app_routes.dart';
import 'package:riverpod_demo/core/theme/theme_extensions.dart';
import 'package:riverpod_demo/features/counter/providers/counter_provider.dart';
import 'package:riverpod_demo/l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final count = ref.watch(counterProvider);
    final spacing = context.spacing;
    final typography = context.typography;
    final colorScheme = context.colorScheme;
    final appColors = context.appColors;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.homeTitle)),
      body: Padding(
        padding: EdgeInsets.all(spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.welcomeMessage,
              style: typography.body,
            ),
            SizedBox(height: spacing.lg),
            Card(
              child: Padding(
                padding: EdgeInsets.all(spacing.md),
                child: Column(
                  children: [
                    Text(
                      l10n.counterLabel,
                      style: typography.label,
                    ),
                    SizedBox(height: spacing.sm),
                    Text(
                      '$count',
                      key: const Key('counter_value'),
                      style: typography.display.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: spacing.sm),
                    Text(
                      l10n.counterValue(count),
                      style: typography.caption,
                    ),
                    SizedBox(height: spacing.md),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          key: const Key('decrement_button'),
                          onPressed: ref.read(counterProvider.notifier).decrement,
                          child: Text(l10n.decrement),
                        ),
                        SizedBox(width: spacing.sm),
                        FilledButton(
                          key: const Key('increment_button'),
                          onPressed: ref.read(counterProvider.notifier).increment,
                          style: FilledButton.styleFrom(
                            backgroundColor: appColors.success,
                            foregroundColor: appColors.onSuccess,
                          ),
                          child: Text(l10n.increment),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: spacing.lg),
            FilledButton.tonal(
              key: const Key('go_to_settings_button'),
              onPressed: () => context.go(AppRoutes.settings),
              child: Text(l10n.goToSettings),
            ),
          ],
        ),
      ),
    );
  }
}
