import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap_drag_and_enter_text/main.dart';

void main() {
  testWidgets('text 입력, 드래그', (tester) async {
    await tester.pumpWidget(const MyApp());

    final textFieldFinder = find.byType(TextField);
    await tester.enterText(textFieldFinder, 'Hi');

    final addButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(addButtonFinder);
    await tester.pump();

    expect(find.text('Hi'), findsOneWidget);

    final dragTargetFinder = find.byType(Dismissible);
    await tester.drag(dragTargetFinder, const Offset(500, 0));
    await tester.pumpAndSettle();

    expect(find.text('Hi'), findsNothing);
  });
}
