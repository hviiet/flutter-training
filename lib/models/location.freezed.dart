// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Location {
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get aqi => throw _privateConstructorUsedError;
  IconData get aqiIcon => throw _privateConstructorUsedError;
  int get temp => throw _privateConstructorUsedError;
  IconData? get weatherIcon => throw _privateConstructorUsedError;
  IconData? get trailingIcon => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({
    String title,
    String address,
    int aqi,
    IconData aqiIcon,
    int temp,
    IconData? weatherIcon,
    IconData? trailingIcon,
  });
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? address = null,
    Object? aqi = null,
    Object? aqiIcon = null,
    Object? temp = null,
    Object? weatherIcon = freezed,
    Object? trailingIcon = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            aqi: null == aqi
                ? _value.aqi
                : aqi // ignore: cast_nullable_to_non_nullable
                      as int,
            aqiIcon: null == aqiIcon
                ? _value.aqiIcon
                : aqiIcon // ignore: cast_nullable_to_non_nullable
                      as IconData,
            temp: null == temp
                ? _value.temp
                : temp // ignore: cast_nullable_to_non_nullable
                      as int,
            weatherIcon: freezed == weatherIcon
                ? _value.weatherIcon
                : weatherIcon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            trailingIcon: freezed == trailingIcon
                ? _value.trailingIcon
                : trailingIcon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
    _$LocationImpl value,
    $Res Function(_$LocationImpl) then,
  ) = __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String address,
    int aqi,
    IconData aqiIcon,
    int temp,
    IconData? weatherIcon,
    IconData? trailingIcon,
  });
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
    _$LocationImpl _value,
    $Res Function(_$LocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? address = null,
    Object? aqi = null,
    Object? aqiIcon = null,
    Object? temp = null,
    Object? weatherIcon = freezed,
    Object? trailingIcon = freezed,
  }) {
    return _then(
      _$LocationImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        aqi: null == aqi
            ? _value.aqi
            : aqi // ignore: cast_nullable_to_non_nullable
                  as int,
        aqiIcon: null == aqiIcon
            ? _value.aqiIcon
            : aqiIcon // ignore: cast_nullable_to_non_nullable
                  as IconData,
        temp: null == temp
            ? _value.temp
            : temp // ignore: cast_nullable_to_non_nullable
                  as int,
        weatherIcon: freezed == weatherIcon
            ? _value.weatherIcon
            : weatherIcon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        trailingIcon: freezed == trailingIcon
            ? _value.trailingIcon
            : trailingIcon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
      ),
    );
  }
}

/// @nodoc

class _$LocationImpl implements _Location {
  const _$LocationImpl({
    required this.title,
    required this.address,
    required this.aqi,
    required this.aqiIcon,
    required this.temp,
    this.weatherIcon,
    this.trailingIcon,
  });

  @override
  final String title;
  @override
  final String address;
  @override
  final int aqi;
  @override
  final IconData aqiIcon;
  @override
  final int temp;
  @override
  final IconData? weatherIcon;
  @override
  final IconData? trailingIcon;

  @override
  String toString() {
    return 'Location(title: $title, address: $address, aqi: $aqi, aqiIcon: $aqiIcon, temp: $temp, weatherIcon: $weatherIcon, trailingIcon: $trailingIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.aqiIcon, aqiIcon) || other.aqiIcon == aqiIcon) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon) &&
            (identical(other.trailingIcon, trailingIcon) ||
                other.trailingIcon == trailingIcon));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    address,
    aqi,
    aqiIcon,
    temp,
    weatherIcon,
    trailingIcon,
  );

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);
}

abstract class _Location implements Location {
  const factory _Location({
    required final String title,
    required final String address,
    required final int aqi,
    required final IconData aqiIcon,
    required final int temp,
    final IconData? weatherIcon,
    final IconData? trailingIcon,
  }) = _$LocationImpl;

  @override
  String get title;
  @override
  String get address;
  @override
  int get aqi;
  @override
  IconData get aqiIcon;
  @override
  int get temp;
  @override
  IconData? get weatherIcon;
  @override
  IconData? get trailingIcon;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
