import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_base.freezed.dart';

part 'color_base.g.dart';

@freezed
class ColorBase with _$ColorBase {
  const factory ColorBase(
    int r,
    int g,
    int b,
  ) = _ColorBase;

  factory ColorBase.fromJson(Map<String, dynamic> json) =>
      _$ColorBaseFromJson(json);

  static ColorBase averageColor(List<ColorBase>? colorList) {
    if (colorList == null || colorList.isEmpty) {
      return const ColorBase(255, 255, 255);
    }

    var r = 0, g = 0, b = 0;
    for (var i = 0; i < colorList.length; i++) {
      r += colorList[i].r;
      g += colorList[i].g;
      b += colorList[i].b;
    }

    return ColorBase(
      r ~/ colorList.length,
      g ~/ colorList.length,
      b ~/ colorList.length,
    );
  }
}
