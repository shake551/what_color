import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:what_color/domain/model/color_base.dart';

void main() {
  test('test fromJson', () {
    const jsonString = '{"r":120,"g":250,"b":175}';
    final fromJsonColor =
        ColorBase.fromJson(json.decode(jsonString) as Map<String, dynamic>);
    const color = ColorBase(120, 250, 175);

    expect(fromJsonColor, color);
  });

  test('test averageColor', () {
    const colorList = [
      ColorBase(120, 250, 100),
      ColorBase(250, 100, 120),
      ColorBase(100, 120, 250),
    ];

    final result = ColorBase.averageColor(colorList);
    const want = ColorBase(156, 156, 156);

    expect(result, want);
  });
}
