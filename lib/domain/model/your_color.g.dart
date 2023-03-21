// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'your_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YourColor _$$_YourColorFromJson(Map<String, dynamic> json) => _$_YourColor(
      json['id'] as String,
      json['comment'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      json['r'] as int,
      json['g'] as int,
      json['b'] as int,
    );

Map<String, dynamic> _$$_YourColorToJson(_$_YourColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };
