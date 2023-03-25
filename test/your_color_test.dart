import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';

void main() {
  test('test fromJson', () {
    const jsonString =
        '{"id":"hoge","comment":"come","latitude":100,"longitude":120,"color":{"r":120,"g":250,"b":175}}';
    final fromJsonYourColor =
        YourColor.fromJson(json.decode(jsonString) as Map<String, dynamic>);
    const color = YourColor('hoge', 'come', 100, 120, ColorBase(120, 250, 175));

    expect(fromJsonYourColor, color);
  });

  test('test fromJsonList', () {
    const jsonList = '''
    [
    {"id":"hoge","comment":"come","latitude":100,"longitude":120,"color":{"r":120,"g":250,"b":175}},
    {"id":"fuga","comment":"come","latitude":100,"longitude":120,"color":{"r":120,"g":250,"b":175}}
    ]
    ''';
    final fromJsonYourColor =
        YourColor.fromJsonList(json.decode(jsonList) as List<dynamic>);
    const colorList = [
      YourColor('hoge', 'come', 100, 120, ColorBase(120, 250, 175)),
      YourColor('fuga', 'come', 100, 120, ColorBase(120, 250, 175)),
    ];

    expect(fromJsonYourColor, colorList);
  });
}
