import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/counter/presentation/home_page.dart';
import 'package:riverpod_demo/features/counter/providers/counter_provider.dart';

import '../helpers/test_app.dart';

void main() {
  group('HomePage', () {
    testWidgets('shows welcome message and initial counter value', (tester) async {
      await tester.pumpWidget(
        const TestPageHarness(child: HomePage()),
      );
      await tester.pumpAndSettle();

      final l10n = TestL10n.en();

      expect(find.text(l10n.welcomeMessage), findsOneWidget);
      expect(find.text(l10n.counterLabel), findsOneWidget);
      expect(find.byKey(TestKeys.counterValue), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('increment and decrement update the counter', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: const TestPageHarness(child: HomePage()),
        ),
      );
      await tester.pumpAndSettle();

      final l10n = TestL10n.en();

      await tester.tap(find.byKey(TestKeys.incrementButton));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
      expect(find.text(l10n.counterValue(1)), findsOneWidget);

      await tester.tap(find.byKey(TestKeys.decrementButton));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('displays Chinese strings when locale is zh', (tester) async {
      await tester.pumpWidget(
        const TestPageHarness(
          locale: Locale('zh'),
          child: HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      final l10n = TestL10n.zh();

      expect(find.text(l10n.welcomeMessage), findsOneWidget);
      expect(find.text(l10n.increment), findsOneWidget);
    });
  });

  group('CounterNotifier', () {
    test('increment and decrement change state', () {
      final container = ProviderContainer();
      final notifier = container.read(counterProvider.notifier);

      notifier.increment();
      expect(container.read(counterProvider), 1);

      notifier.decrement();
      expect(container.read(counterProvider), 0);

      container.dispose();
    });
  });
}
