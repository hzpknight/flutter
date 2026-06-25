import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/app.dart';

import '../test/helpers/test_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App integration', () {
    testWidgets('counter flow and navigation between home and settings', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: RiverpodDemoApp()),
      );
      await tester.pumpAndSettle();

      final l10n = TestL10n.en();

      // Home screen
      expect(find.text(l10n.welcomeMessage), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      // Increment counter twice
      await tester.tap(find.byKey(TestKeys.incrementButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(TestKeys.incrementButton));
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);

      // Navigate to settings
      await tester.tap(find.byKey(TestKeys.goToSettingsButton));
      await tester.pumpAndSettle();
      expect(find.text(l10n.settingsTitle), findsOneWidget);

      // Switch to dark theme
      await tester.tap(find.text(l10n.themeDark));
      await tester.pumpAndSettle();

      // Switch language to Chinese
      await tester.tap(find.text(l10n.languageZh));
      await tester.pumpAndSettle();

      final l10nZh = TestL10n.zh();
      expect(find.text(l10nZh.settingsTitle), findsOneWidget);

      // Return home
      await tester.tap(find.byKey(TestKeys.backToHomeButton));
      await tester.pumpAndSettle();
      expect(find.text(l10nZh.welcomeMessage), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
    });
  });
}
