import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('find by key', (WidgetTester tester) async {
    const testKey = Key("K");

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          key: testKey,
          body: Text('hello'),
        ),
      ),
    );

    expect(find.byKey(testKey), findsOneWidget);
  });
}
