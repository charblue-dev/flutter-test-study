import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:performance_profiling/main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end', () {
    testWidgets('스크롤 성능 측정', (tester) async {
      await tester.pumpWidget(const MyApp());

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('item_50_text'));

      await binding.traceAction(() async {
        await tester.scrollUntilVisible(
          itemFinder,
          500.0,
          scrollable: listFinder,
        );
      }, reportKey: 'scrolling_timeline');

      expect(itemFinder, findsOneWidget);
    });
  });
}
