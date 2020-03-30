import 'package:flutter_test/flutter_test.dart';

import 'package:global_network/global_network.dart';
import 'package:global_network/utils/export.dart';

void main() {
  test('adds one to input values', () {
    final test = GlobalNetwork(
      child: Text("Testing"),
    );
    // final calculator = GlobalNetwork();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
    // expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
