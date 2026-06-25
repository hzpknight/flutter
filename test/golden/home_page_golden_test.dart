import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/features/counter/presentation/home_page.dart';

import '../helpers/test_app.dart';

/// Golden tests for visual regression.
///
/// Generate or update goldens:
///   flutter test test/golden --update-goldens
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomePage golden', () {
    testWidgets('light theme — English', (tester) async {
      await tester.pumpWidget(
        const TestPageHarness(
          themeMode: ThemeMode.light,
          locale: Locale('en'),
          child: HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(HomePage),
        matchesGoldenFile('goldens/home_page_light_en.png'),
      );
    });

    testWidgets('dark theme — English', (tester) async {
      await tester.pumpWidget(
        const TestPageHarness(
          themeMode: ThemeMode.dark,
          locale: Locale('en'),
          child: HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(HomePage),
        matchesGoldenFile('goldens/home_page_dark_en.png'),
      );
    });

    testWidgets('light theme — Chinese', (tester) async {
      await tester.pumpWidget(
        const TestPageHarness(
          themeMode: ThemeMode.light,
          locale: Locale('zh'),
          child: HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(HomePage),
        matchesGoldenFile('goldens/home_page_light_zh.png'),
      );
    });
  });
}
