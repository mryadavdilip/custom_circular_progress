import 'package:custom_circular_progress/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test values', () {
    IndicatorDetails details =
        const IndicatorDetails(value: 0.321, itemCount: 20);
    return details.getValues();
  });
}
