// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'your_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YourColor _$$_YourColorFromJson(Map<String, dynamic> json) => _$_YourColor(
      json['id'] as String,
      json['userId'] as String,
      json['comment'] as String,
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
      ColorBase.fromJson(json['color'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_YourColorToJson(_$_YourColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'comment': instance.comment,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'color': instance.color,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
