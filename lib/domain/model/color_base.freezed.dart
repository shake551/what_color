// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ColorBase _$ColorBaseFromJson(Map<String, dynamic> json) {
  return _ColorBase.fromJson(json);
}

/// @nodoc
mixin _$ColorBase {
  int get r => throw _privateConstructorUsedError;
  int get g => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorBaseCopyWith<ColorBase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorBaseCopyWith<$Res> {
  factory $ColorBaseCopyWith(ColorBase value, $Res Function(ColorBase) then) =
      _$ColorBaseCopyWithImpl<$Res, ColorBase>;
  @useResult
  $Res call({int r, int g, int b});
}

/// @nodoc
class _$ColorBaseCopyWithImpl<$Res, $Val extends ColorBase>
    implements $ColorBaseCopyWith<$Res> {
  _$ColorBaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_value.copyWith(
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColorBaseCopyWith<$Res> implements $ColorBaseCopyWith<$Res> {
  factory _$$_ColorBaseCopyWith(
          _$_ColorBase value, $Res Function(_$_ColorBase) then) =
      __$$_ColorBaseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int r, int g, int b});
}

/// @nodoc
class __$$_ColorBaseCopyWithImpl<$Res>
    extends _$ColorBaseCopyWithImpl<$Res, _$_ColorBase>
    implements _$$_ColorBaseCopyWith<$Res> {
  __$$_ColorBaseCopyWithImpl(
      _$_ColorBase _value, $Res Function(_$_ColorBase) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? r = null,
    Object? g = null,
    Object? b = null,
  }) {
    return _then(_$_ColorBase(
      null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ColorBase implements _ColorBase {
  const _$_ColorBase(this.r, this.g, this.b);

  factory _$_ColorBase.fromJson(Map<String, dynamic> json) =>
      _$$_ColorBaseFromJson(json);

  @override
  final int r;
  @override
  final int g;
  @override
  final int b;

  @override
  String toString() {
    return 'ColorBase(r: $r, g: $g, b: $b)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorBase &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.b, b) || other.b == b));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, r, g, b);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorBaseCopyWith<_$_ColorBase> get copyWith =>
      __$$_ColorBaseCopyWithImpl<_$_ColorBase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorBaseToJson(
      this,
    );
  }
}

abstract class _ColorBase implements ColorBase {
  const factory _ColorBase(final int r, final int g, final int b) =
      _$_ColorBase;

  factory _ColorBase.fromJson(Map<String, dynamic> json) =
      _$_ColorBase.fromJson;

  @override
  int get r;
  @override
  int get g;
  @override
  int get b;
  @override
  @JsonKey(ignore: true)
  _$$_ColorBaseCopyWith<_$_ColorBase> get copyWith =>
      throw _privateConstructorUsedError;
}
