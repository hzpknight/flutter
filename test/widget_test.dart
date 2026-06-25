import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/app.dart';

import 'helpers/test_app.dart';

void main() {
  testWidgets('app smoke test — home page loads', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: RiverpodDemoApp()),
    );
    await tester.pumpAndSettle();

    final l10n = TestL10n.en();
    expect(find.text(l10n.welcomeMessage), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });
}
