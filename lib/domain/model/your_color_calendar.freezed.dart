// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'your_color_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YourColorCalendar _$YourColorCalendarFromJson(Map<String, dynamic> json) {
  return _YourColorCalendar.fromJson(json);
}

/// @nodoc
mixin _$YourColorCalendar {
  DateTime get createdAt => throw _privateConstructorUsedError;
  YourColor get yourColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YourColorCalendarCopyWith<YourColorCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YourColorCalendarCopyWith<$Res> {
  factory $YourColorCalendarCopyWith(
          YourColorCalendar value, $Res Function(YourColorCalendar) then) =
      _$YourColorCalendarCopyWithImpl<$Res, YourColorCalendar>;
  @useResult
  $Res call({DateTime createdAt, YourColor yourColor});

  $YourColorCopyWith<$Res> get yourColor;
}

/// @nodoc
class _$YourColorCalendarCopyWithImpl<$Res, $Val extends YourColorCalendar>
    implements $YourColorCalendarCopyWith<$Res> {
  _$YourColorCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? yourColor = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yourColor: null == yourColor
          ? _value.yourColor
          : yourColor // ignore: cast_nullable_to_non_nullable
              as YourColor,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YourColorCopyWith<$Res> get yourColor {
    return $YourColorCopyWith<$Res>(_value.yourColor, (value) {
      return _then(_value.copyWith(yourColor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_YourColorCalendarCopyWith<$Res>
    implements $YourColorCalendarCopyWith<$Res> {
  factory _$$_YourColorCalendarCopyWith(_$_YourColorCalendar value,
          $Res Function(_$_YourColorCalendar) then) =
      __$$_YourColorCalendarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, YourColor yourColor});

  @override
  $YourColorCopyWith<$Res> get yourColor;
}

/// @nodoc
class __$$_YourColorCalendarCopyWithImpl<$Res>
    extends _$YourColorCalendarCopyWithImpl<$Res, _$_YourColorCalendar>
    implements _$$_YourColorCalendarCopyWith<$Res> {
  __$$_YourColorCalendarCopyWithImpl(
      _$_YourColorCalendar _value, $Res Function(_$_YourColorCalendar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? yourColor = null,
  }) {
    return _then(_$_YourColorCalendar(
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == yourColor
          ? _value.yourColor
          : yourColor // ignore: cast_nullable_to_non_nullable
              as YourColor,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_YourColorCalendar implements _YourColorCalendar {
  const _$_YourColorCalendar(this.createdAt, this.yourColor);

  factory _$_YourColorCalendar.fromJson(Map<String, dynamic> json) =>
      _$$_YourColorCalendarFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final YourColor yourColor;

  @override
  String toString() {
    return 'YourColorCalendar(createdAt: $createdAt, yourColor: $yourColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_YourColorCalendar &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.yourColor, yourColor) ||
                other.yourColor == yourColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, yourColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_YourColorCalendarCopyWith<_$_YourColorCalendar> get copyWith =>
      __$$_YourColorCalendarCopyWithImpl<_$_YourColorCalendar>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_YourColorCalendarToJson(
      this,
    );
  }
}

abstract class _YourColorCalendar implements YourColorCalendar {
  const factory _YourColorCalendar(
          final DateTime createdAt, final YourColor yourColor) =
      _$_YourColorCalendar;

  factory _YourColorCalendar.fromJson(Map<String, dynamic> json) =
      _$_YourColorCalendar.fromJson;

  @override
  DateTime get createdAt;
  @override
  YourColor get yourColor;
  @override
  @JsonKey(ignore: true)
  _$$_YourColorCalendarCopyWith<_$_YourColorCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}
