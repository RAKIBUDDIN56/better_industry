import 'package:spar/screens2/deliverydetails.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spar/screens2/main.dart';

void main() {
  test("testing 1 Calculate function", () {
    expect(DeliveryDetails().getRemainingQuantity(1000, 100), 900);
  });
  test("testing 2 Calculate function", () {
    expect(DeliveryDetails().getRemainingQuantity(1000, 0), 1000);
  });
}
