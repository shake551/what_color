// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'your_color_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YourColorCalendar _$$_YourColorCalendarFromJson(Map<String, dynamic> json) =>
    _$_YourColorCalendar(
      DateTime.parse(json['createdAt'] as String),
      YourColor.fromJson(json['yourColor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_YourColorCalendarToJson(
        _$_YourColorCalendar instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'yourColor': instance.yourColor,
    };
