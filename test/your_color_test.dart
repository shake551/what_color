import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';

void main() {
  test('test fromJson', () {
    const jsonString =
        '{"id":"hoge","userId":"shake","comment":"come","latitude":100,"longitude":120,"color":{"r":120,"g":250,"b":175},"createdAt": "2023-03-20T12:55:34Z","updatedAt": "2023-03-20T12:55:34Z"}';
    final fromJsonYourColor =
        YourColor.fromJson(json.decode(jsonString) as Map<String, dynamic>);
    final color = YourColor(
      'hoge',
      'shake',
      'come',
      100,
      120,
      const ColorBase(120, 250, 175),
      DateTime.parse('2023-03-20T12:55:34Z'),
      DateTime.parse('2023-03-20T12:55:34Z'),
    );

    expect(fromJsonYourColor, color);
  });

  test('test fromJsonList', () {
    const jsonList = '''
    [
    {"id":"hoge","userId":"shake","comment":"come","latitude":100,"longitude":120,"color":{"r":120,"g":250,"b":175},"createdAt": "2023-03-20T12:55:34Z","updatedAt":"2023-03-20T12:55:34Z"},
    {"id":"fuga","userId":"sanma","comment":"come","latitude":100,"longitude":120,"color":{"r":120,"g":250,"b":175},"createdAt": "2023-03-20T12:55:34Z","updatedAt":"2023-03-20T12:55:34Z"}
    ]
    ''';
    final fromJsonYourColor =
        YourColor.fromJsonList(json.decode(jsonList) as List<dynamic>);
    final colorList = [
      YourColor(
        'hoge',
        'shake',
        'come',
        100,
        120,
        const ColorBase(120, 250, 175),
        DateTime.parse('2023-03-20T12:55:34Z'),
        DateTime.parse('2023-03-20T12:55:34Z'),
      ),
      YourColor(
        'fuga',
        'sanma',
        'come',
        100,
        120,
        const ColorBase(120, 250, 175),
        DateTime.parse('2023-03-20T12:55:34Z'),
        DateTime.parse('2023-03-20T12:55:34Z'),
      ),
    ];

    expect(fromJsonYourColor, colorList);
  });
}
