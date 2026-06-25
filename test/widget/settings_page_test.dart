import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/features/settings/presentation/settings_page.dart';

import '../helpers/test_app.dart';

void main() {
  group('SettingsPage', () {
    testWidgets('shows theme and language selectors', (tester) async {
      await tester.pumpWidget(
        const TestPageHarness(child: SettingsPage()),
      );
      await tester.pumpAndSettle();

      final l10n = TestL10n.en();

      expect(find.text(l10n.themeMode), findsOneWidget);
      expect(find.text(l10n.language), findsOneWidget);
      expect(find.text(l10n.themeLight), findsOneWidget);
      expect(find.text(l10n.themeDark), findsOneWidget);
      expect(find.text(l10n.languageEn), findsOneWidget);
      expect(find.text(l10n.languageZh), findsOneWidget);
    });
  });
}
