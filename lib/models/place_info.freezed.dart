// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PlaceInfo {
  String get title => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  int get aqi => throw _privateConstructorUsedError;
  IconData get aqiIcon => throw _privateConstructorUsedError;
  IconData get weatherIcon => throw _privateConstructorUsedError;
  int get temp => throw _privateConstructorUsedError;

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceInfoCopyWith<PlaceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceInfoCopyWith<$Res> {
  factory $PlaceInfoCopyWith(PlaceInfo value, $Res Function(PlaceInfo) then) =
      _$PlaceInfoCopyWithImpl<$Res, PlaceInfo>;
  @useResult
  $Res call({
    String title,
    String address,
    int aqi,
    IconData aqiIcon,
    IconData weatherIcon,
    int temp,
  });
}

/// @nodoc
class _$PlaceInfoCopyWithImpl<$Res, $Val extends PlaceInfo>
    implements $PlaceInfoCopyWith<$Res> {
  _$PlaceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? address = null,
    Object? aqi = null,
    Object? aqiIcon = null,
    Object? weatherIcon = null,
    Object? temp = null,
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
            weatherIcon: null == weatherIcon
                ? _value.weatherIcon
                : weatherIcon // ignore: cast_nullable_to_non_nullable
                      as IconData,
            temp: null == temp
                ? _value.temp
                : temp // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaceInfoImplCopyWith<$Res>
    implements $PlaceInfoCopyWith<$Res> {
  factory _$$PlaceInfoImplCopyWith(
    _$PlaceInfoImpl value,
    $Res Function(_$PlaceInfoImpl) then,
  ) = __$$PlaceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String address,
    int aqi,
    IconData aqiIcon,
    IconData weatherIcon,
    int temp,
  });
}

/// @nodoc
class __$$PlaceInfoImplCopyWithImpl<$Res>
    extends _$PlaceInfoCopyWithImpl<$Res, _$PlaceInfoImpl>
    implements _$$PlaceInfoImplCopyWith<$Res> {
  __$$PlaceInfoImplCopyWithImpl(
    _$PlaceInfoImpl _value,
    $Res Function(_$PlaceInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? address = null,
    Object? aqi = null,
    Object? aqiIcon = null,
    Object? weatherIcon = null,
    Object? temp = null,
  }) {
    return _then(
      _$PlaceInfoImpl(
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
        weatherIcon: null == weatherIcon
            ? _value.weatherIcon
            : weatherIcon // ignore: cast_nullable_to_non_nullable
                  as IconData,
        temp: null == temp
            ? _value.temp
            : temp // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PlaceInfoImpl implements _PlaceInfo {
  const _$PlaceInfoImpl({
    required this.title,
    required this.address,
    required this.aqi,
    required this.aqiIcon,
    required this.weatherIcon,
    required this.temp,
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
  final IconData weatherIcon;
  @override
  final int temp;

  @override
  String toString() {
    return 'PlaceInfo(title: $title, address: $address, aqi: $aqi, aqiIcon: $aqiIcon, weatherIcon: $weatherIcon, temp: $temp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceInfoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.aqiIcon, aqiIcon) || other.aqiIcon == aqiIcon) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon) &&
            (identical(other.temp, temp) || other.temp == temp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, address, aqi, aqiIcon, weatherIcon, temp);

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceInfoImplCopyWith<_$PlaceInfoImpl> get copyWith =>
      __$$PlaceInfoImplCopyWithImpl<_$PlaceInfoImpl>(this, _$identity);
}

abstract class _PlaceInfo implements PlaceInfo {
  const factory _PlaceInfo({
    required final String title,
    required final String address,
    required final int aqi,
    required final IconData aqiIcon,
    required final IconData weatherIcon,
    required final int temp,
  }) = _$PlaceInfoImpl;

  @override
  String get title;
  @override
  String get address;
  @override
  int get aqi;
  @override
  IconData get aqiIcon;
  @override
  IconData get weatherIcon;
  @override
  int get temp;

  /// Create a copy of PlaceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceInfoImplCopyWith<_$PlaceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
