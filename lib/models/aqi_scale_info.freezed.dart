// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aqi_scale_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AQIScaleInfo {
  String get level => throw _privateConstructorUsedError;
  String get range => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;

  /// Create a copy of AQIScaleInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AQIScaleInfoCopyWith<AQIScaleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AQIScaleInfoCopyWith<$Res> {
  factory $AQIScaleInfoCopyWith(
    AQIScaleInfo value,
    $Res Function(AQIScaleInfo) then,
  ) = _$AQIScaleInfoCopyWithImpl<$Res, AQIScaleInfo>;
  @useResult
  $Res call({
    String level,
    String range,
    String description,
    Color color,
    IconData icon,
  });
}

/// @nodoc
class _$AQIScaleInfoCopyWithImpl<$Res, $Val extends AQIScaleInfo>
    implements $AQIScaleInfoCopyWith<$Res> {
  _$AQIScaleInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AQIScaleInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? range = null,
    Object? description = null,
    Object? color = null,
    Object? icon = null,
  }) {
    return _then(
      _value.copyWith(
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            range: null == range
                ? _value.range
                : range // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AQIScaleInfoImplCopyWith<$Res>
    implements $AQIScaleInfoCopyWith<$Res> {
  factory _$$AQIScaleInfoImplCopyWith(
    _$AQIScaleInfoImpl value,
    $Res Function(_$AQIScaleInfoImpl) then,
  ) = __$$AQIScaleInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String level,
    String range,
    String description,
    Color color,
    IconData icon,
  });
}

/// @nodoc
class __$$AQIScaleInfoImplCopyWithImpl<$Res>
    extends _$AQIScaleInfoCopyWithImpl<$Res, _$AQIScaleInfoImpl>
    implements _$$AQIScaleInfoImplCopyWith<$Res> {
  __$$AQIScaleInfoImplCopyWithImpl(
    _$AQIScaleInfoImpl _value,
    $Res Function(_$AQIScaleInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AQIScaleInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? range = null,
    Object? description = null,
    Object? color = null,
    Object? icon = null,
  }) {
    return _then(
      _$AQIScaleInfoImpl(
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        range: null == range
            ? _value.range
            : range // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData,
      ),
    );
  }
}

/// @nodoc

class _$AQIScaleInfoImpl extends _AQIScaleInfo {
  const _$AQIScaleInfoImpl({
    required this.level,
    required this.range,
    required this.description,
    required this.color,
    required this.icon,
  }) : super._();

  @override
  final String level;
  @override
  final String range;
  @override
  final String description;
  @override
  final Color color;
  @override
  final IconData icon;

  @override
  String toString() {
    return 'AQIScaleInfo(level: $level, range: $range, description: $description, color: $color, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AQIScaleInfoImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.range, range) || other.range == range) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, level, range, description, color, icon);

  /// Create a copy of AQIScaleInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AQIScaleInfoImplCopyWith<_$AQIScaleInfoImpl> get copyWith =>
      __$$AQIScaleInfoImplCopyWithImpl<_$AQIScaleInfoImpl>(this, _$identity);
}

abstract class _AQIScaleInfo extends AQIScaleInfo {
  const factory _AQIScaleInfo({
    required final String level,
    required final String range,
    required final String description,
    required final Color color,
    required final IconData icon,
  }) = _$AQIScaleInfoImpl;
  const _AQIScaleInfo._() : super._();

  @override
  String get level;
  @override
  String get range;
  @override
  String get description;
  @override
  Color get color;
  @override
  IconData get icon;

  /// Create a copy of AQIScaleInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AQIScaleInfoImplCopyWith<_$AQIScaleInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
