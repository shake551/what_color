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
      ColorBase.fromJson(json['color'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_YourColorToJson(_$_YourColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'color': instance.color,
    };
