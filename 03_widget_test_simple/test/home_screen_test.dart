import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_simple/home_screen.dart';

void main() {
  testWidgets('title과 message가 정상적으로 표시되어야 한다.', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(title: 'T', message: 'M'),
      ),
    );

    expect(find.text('T'), findsOneWidget);
    expect(find.text('M'), findsOne);
  });
}
