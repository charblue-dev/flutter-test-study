import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_simple/counter.dart';

void main() {
  group('Counter', () {
    test('0으로 시작해야 한다.', () {
      expect(Counter().value, 0);
    });

    test('1씩 증가해야 한다.', () {
      final counter = Counter();

      counter.countUp();

      expect(counter.value, 1);
    });

    test('1씩 감소해야 한다.', () {
      final counter = Counter();

      counter.countDown();

      expect(counter.value, -1);
    });

    test('0으로 초기화해야 한다.', () {
      final counter = Counter();

      counter.countUp();
      counter.clear();

      expect(counter.value, 0);
    });
  });
}
