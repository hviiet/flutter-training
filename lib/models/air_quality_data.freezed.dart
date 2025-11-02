// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AirQualityData {
  String get city => throw _privateConstructorUsedError;
  int get aqi => throw _privateConstructorUsedError;
  String get dominantPollutant => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  Map<String, Pollutant> get pollutants => throw _privateConstructorUsedError;

  /// Create a copy of AirQualityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirQualityDataCopyWith<AirQualityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirQualityDataCopyWith<$Res> {
  factory $AirQualityDataCopyWith(
    AirQualityData value,
    $Res Function(AirQualityData) then,
  ) = _$AirQualityDataCopyWithImpl<$Res, AirQualityData>;
  @useResult
  $Res call({
    String city,
    int aqi,
    String dominantPollutant,
    DateTime time,
    Map<String, Pollutant> pollutants,
  });
}

/// @nodoc
class _$AirQualityDataCopyWithImpl<$Res, $Val extends AirQualityData>
    implements $AirQualityDataCopyWith<$Res> {
  _$AirQualityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AirQualityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? aqi = null,
    Object? dominantPollutant = null,
    Object? time = null,
    Object? pollutants = null,
  }) {
    return _then(
      _value.copyWith(
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            aqi: null == aqi
                ? _value.aqi
                : aqi // ignore: cast_nullable_to_non_nullable
                      as int,
            dominantPollutant: null == dominantPollutant
                ? _value.dominantPollutant
                : dominantPollutant // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            pollutants: null == pollutants
                ? _value.pollutants
                : pollutants // ignore: cast_nullable_to_non_nullable
                      as Map<String, Pollutant>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AirQualityDataImplCopyWith<$Res>
    implements $AirQualityDataCopyWith<$Res> {
  factory _$$AirQualityDataImplCopyWith(
    _$AirQualityDataImpl value,
    $Res Function(_$AirQualityDataImpl) then,
  ) = __$$AirQualityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String city,
    int aqi,
    String dominantPollutant,
    DateTime time,
    Map<String, Pollutant> pollutants,
  });
}

/// @nodoc
class __$$AirQualityDataImplCopyWithImpl<$Res>
    extends _$AirQualityDataCopyWithImpl<$Res, _$AirQualityDataImpl>
    implements _$$AirQualityDataImplCopyWith<$Res> {
  __$$AirQualityDataImplCopyWithImpl(
    _$AirQualityDataImpl _value,
    $Res Function(_$AirQualityDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AirQualityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? aqi = null,
    Object? dominantPollutant = null,
    Object? time = null,
    Object? pollutants = null,
  }) {
    return _then(
      _$AirQualityDataImpl(
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        aqi: null == aqi
            ? _value.aqi
            : aqi // ignore: cast_nullable_to_non_nullable
                  as int,
        dominantPollutant: null == dominantPollutant
            ? _value.dominantPollutant
            : dominantPollutant // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        pollutants: null == pollutants
            ? _value._pollutants
            : pollutants // ignore: cast_nullable_to_non_nullable
                  as Map<String, Pollutant>,
      ),
    );
  }
}

/// @nodoc

class _$AirQualityDataImpl extends _AirQualityData {
  const _$AirQualityDataImpl({
    required this.city,
    required this.aqi,
    required this.dominantPollutant,
    required this.time,
    required final Map<String, Pollutant> pollutants,
  }) : _pollutants = pollutants,
       super._();

  @override
  final String city;
  @override
  final int aqi;
  @override
  final String dominantPollutant;
  @override
  final DateTime time;
  final Map<String, Pollutant> _pollutants;
  @override
  Map<String, Pollutant> get pollutants {
    if (_pollutants is EqualUnmodifiableMapView) return _pollutants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pollutants);
  }

  @override
  String toString() {
    return 'AirQualityData(city: $city, aqi: $aqi, dominantPollutant: $dominantPollutant, time: $time, pollutants: $pollutants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirQualityDataImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.dominantPollutant, dominantPollutant) ||
                other.dominantPollutant == dominantPollutant) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(
              other._pollutants,
              _pollutants,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    city,
    aqi,
    dominantPollutant,
    time,
    const DeepCollectionEquality().hash(_pollutants),
  );

  /// Create a copy of AirQualityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirQualityDataImplCopyWith<_$AirQualityDataImpl> get copyWith =>
      __$$AirQualityDataImplCopyWithImpl<_$AirQualityDataImpl>(
        this,
        _$identity,
      );
}

abstract class _AirQualityData extends AirQualityData {
  const factory _AirQualityData({
    required final String city,
    required final int aqi,
    required final String dominantPollutant,
    required final DateTime time,
    required final Map<String, Pollutant> pollutants,
  }) = _$AirQualityDataImpl;
  const _AirQualityData._() : super._();

  @override
  String get city;
  @override
  int get aqi;
  @override
  String get dominantPollutant;
  @override
  DateTime get time;
  @override
  Map<String, Pollutant> get pollutants;

  /// Create a copy of AirQualityData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirQualityDataImplCopyWith<_$AirQualityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pollutant _$PollutantFromJson(Map<String, dynamic> json) {
  return _Pollutant.fromJson(json);
}

/// @nodoc
mixin _$Pollutant {
  String get name => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Serializes this Pollutant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pollutant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollutantCopyWith<Pollutant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollutantCopyWith<$Res> {
  factory $PollutantCopyWith(Pollutant value, $Res Function(Pollutant) then) =
      _$PollutantCopyWithImpl<$Res, Pollutant>;
  @useResult
  $Res call({String name, double value});
}

/// @nodoc
class _$PollutantCopyWithImpl<$Res, $Val extends Pollutant>
    implements $PollutantCopyWith<$Res> {
  _$PollutantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pollutant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PollutantImplCopyWith<$Res>
    implements $PollutantCopyWith<$Res> {
  factory _$$PollutantImplCopyWith(
    _$PollutantImpl value,
    $Res Function(_$PollutantImpl) then,
  ) = __$$PollutantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double value});
}

/// @nodoc
class __$$PollutantImplCopyWithImpl<$Res>
    extends _$PollutantCopyWithImpl<$Res, _$PollutantImpl>
    implements _$$PollutantImplCopyWith<$Res> {
  __$$PollutantImplCopyWithImpl(
    _$PollutantImpl _value,
    $Res Function(_$PollutantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Pollutant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? value = null}) {
    return _then(
      _$PollutantImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PollutantImpl extends _Pollutant {
  const _$PollutantImpl({required this.name, required this.value}) : super._();

  factory _$PollutantImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollutantImplFromJson(json);

  @override
  final String name;
  @override
  final double value;

  @override
  String toString() {
    return 'Pollutant(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollutantImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  /// Create a copy of Pollutant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollutantImplCopyWith<_$PollutantImpl> get copyWith =>
      __$$PollutantImplCopyWithImpl<_$PollutantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollutantImplToJson(this);
  }
}

abstract class _Pollutant extends Pollutant {
  const factory _Pollutant({
    required final String name,
    required final double value,
  }) = _$PollutantImpl;
  const _Pollutant._() : super._();

  factory _Pollutant.fromJson(Map<String, dynamic> json) =
      _$PollutantImpl.fromJson;

  @override
  String get name;
  @override
  double get value;

  /// Create a copy of Pollutant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollutantImplCopyWith<_$PollutantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
