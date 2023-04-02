// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'your_color.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YourColor _$YourColorFromJson(Map<String, dynamic> json) {
  return _YourColor.fromJson(json);
}

/// @nodoc
mixin _$YourColor {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  ColorBase get color => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YourColorCopyWith<YourColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YourColorCopyWith<$Res> {
  factory $YourColorCopyWith(YourColor value, $Res Function(YourColor) then) =
      _$YourColorCopyWithImpl<$Res, YourColor>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String comment,
      double latitude,
      double longitude,
      ColorBase color,
      DateTime createdAt,
      DateTime updatedAt});

  $ColorBaseCopyWith<$Res> get color;
}

/// @nodoc
class _$YourColorCopyWithImpl<$Res, $Val extends YourColor>
    implements $YourColorCopyWith<$Res> {
  _$YourColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? comment = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? color = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorBase,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorBaseCopyWith<$Res> get color {
    return $ColorBaseCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_YourColorCopyWith<$Res> implements $YourColorCopyWith<$Res> {
  factory _$$_YourColorCopyWith(
          _$_YourColor value, $Res Function(_$_YourColor) then) =
      __$$_YourColorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String comment,
      double latitude,
      double longitude,
      ColorBase color,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $ColorBaseCopyWith<$Res> get color;
}

/// @nodoc
class __$$_YourColorCopyWithImpl<$Res>
    extends _$YourColorCopyWithImpl<$Res, _$_YourColor>
    implements _$$_YourColorCopyWith<$Res> {
  __$$_YourColorCopyWithImpl(
      _$_YourColor _value, $Res Function(_$_YourColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? comment = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? color = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_YourColor(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ColorBase,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_YourColor implements _YourColor {
  const _$_YourColor(this.id, this.userId, this.comment, this.latitude,
      this.longitude, this.color, this.createdAt, this.updatedAt);

  factory _$_YourColor.fromJson(Map<String, dynamic> json) =>
      _$$_YourColorFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String comment;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final ColorBase color;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'YourColor(id: $id, userId: $userId, comment: $comment, latitude: $latitude, longitude: $longitude, color: $color, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_YourColor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, comment, latitude,
      longitude, color, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_YourColorCopyWith<_$_YourColor> get copyWith =>
      __$$_YourColorCopyWithImpl<_$_YourColor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_YourColorToJson(
      this,
    );
  }
}

abstract class _YourColor implements YourColor {
  const factory _YourColor(
      final String id,
      final String userId,
      final String comment,
      final double latitude,
      final double longitude,
      final ColorBase color,
      final DateTime createdAt,
      final DateTime updatedAt) = _$_YourColor;

  factory _YourColor.fromJson(Map<String, dynamic> json) =
      _$_YourColor.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get comment;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  ColorBase get color;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_YourColorCopyWith<_$_YourColor> get copyWith =>
      throw _privateConstructorUsedError;
}
