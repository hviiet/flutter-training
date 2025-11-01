// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeatherDataFreezed _$WeatherDataFreezedFromJson(Map<String, dynamic> json) {
  return _WeatherDataFreezed.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataFreezed {
  String get location => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  CurrentWeather get current => throw _privateConstructorUsedError;
  List<ForecastDayFreezed> get forecast => throw _privateConstructorUsedError;

  /// Serializes this WeatherDataFreezed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherDataFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDataFreezedCopyWith<WeatherDataFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataFreezedCopyWith<$Res> {
  factory $WeatherDataFreezedCopyWith(
    WeatherDataFreezed value,
    $Res Function(WeatherDataFreezed) then,
  ) = _$WeatherDataFreezedCopyWithImpl<$Res, WeatherDataFreezed>;
  @useResult
  $Res call({
    String location,
    String region,
    CurrentWeather current,
    List<ForecastDayFreezed> forecast,
  });

  $CurrentWeatherCopyWith<$Res> get current;
}

/// @nodoc
class _$WeatherDataFreezedCopyWithImpl<$Res, $Val extends WeatherDataFreezed>
    implements $WeatherDataFreezedCopyWith<$Res> {
  _$WeatherDataFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherDataFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? region = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(
      _value.copyWith(
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            region: null == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String,
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as CurrentWeather,
            forecast: null == forecast
                ? _value.forecast
                : forecast // ignore: cast_nullable_to_non_nullable
                      as List<ForecastDayFreezed>,
          )
          as $Val,
    );
  }

  /// Create a copy of WeatherDataFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<$Res> get current {
    return $CurrentWeatherCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDataFreezedImplCopyWith<$Res>
    implements $WeatherDataFreezedCopyWith<$Res> {
  factory _$$WeatherDataFreezedImplCopyWith(
    _$WeatherDataFreezedImpl value,
    $Res Function(_$WeatherDataFreezedImpl) then,
  ) = __$$WeatherDataFreezedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String location,
    String region,
    CurrentWeather current,
    List<ForecastDayFreezed> forecast,
  });

  @override
  $CurrentWeatherCopyWith<$Res> get current;
}

/// @nodoc
class __$$WeatherDataFreezedImplCopyWithImpl<$Res>
    extends _$WeatherDataFreezedCopyWithImpl<$Res, _$WeatherDataFreezedImpl>
    implements _$$WeatherDataFreezedImplCopyWith<$Res> {
  __$$WeatherDataFreezedImplCopyWithImpl(
    _$WeatherDataFreezedImpl _value,
    $Res Function(_$WeatherDataFreezedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherDataFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? region = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(
      _$WeatherDataFreezedImpl(
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        region: null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String,
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as CurrentWeather,
        forecast: null == forecast
            ? _value._forecast
            : forecast // ignore: cast_nullable_to_non_nullable
                  as List<ForecastDayFreezed>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataFreezedImpl implements _WeatherDataFreezed {
  const _$WeatherDataFreezedImpl({
    required this.location,
    required this.region,
    required this.current,
    required final List<ForecastDayFreezed> forecast,
  }) : _forecast = forecast;

  factory _$WeatherDataFreezedImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataFreezedImplFromJson(json);

  @override
  final String location;
  @override
  final String region;
  @override
  final CurrentWeather current;
  final List<ForecastDayFreezed> _forecast;
  @override
  List<ForecastDayFreezed> get forecast {
    if (_forecast is EqualUnmodifiableListView) return _forecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecast);
  }

  @override
  String toString() {
    return 'WeatherDataFreezed(location: $location, region: $region, current: $current, forecast: $forecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataFreezedImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other._forecast, _forecast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    location,
    region,
    current,
    const DeepCollectionEquality().hash(_forecast),
  );

  /// Create a copy of WeatherDataFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataFreezedImplCopyWith<_$WeatherDataFreezedImpl> get copyWith =>
      __$$WeatherDataFreezedImplCopyWithImpl<_$WeatherDataFreezedImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataFreezedImplToJson(this);
  }
}

abstract class _WeatherDataFreezed implements WeatherDataFreezed {
  const factory _WeatherDataFreezed({
    required final String location,
    required final String region,
    required final CurrentWeather current,
    required final List<ForecastDayFreezed> forecast,
  }) = _$WeatherDataFreezedImpl;

  factory _WeatherDataFreezed.fromJson(Map<String, dynamic> json) =
      _$WeatherDataFreezedImpl.fromJson;

  @override
  String get location;
  @override
  String get region;
  @override
  CurrentWeather get current;
  @override
  List<ForecastDayFreezed> get forecast;

  /// Create a copy of WeatherDataFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDataFreezedImplCopyWith<_$WeatherDataFreezedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return _CurrentWeather.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeather {
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_f')
  double get tempF => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  WeatherCondition get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_quality')
  AirQualityFreezed? get airQuality => throw _privateConstructorUsedError;

  /// Serializes this CurrentWeather to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentWeatherCopyWith<CurrentWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherCopyWith<$Res> {
  factory $CurrentWeatherCopyWith(
    CurrentWeather value,
    $Res Function(CurrentWeather) then,
  ) = _$CurrentWeatherCopyWithImpl<$Res, CurrentWeather>;
  @useResult
  $Res call({
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'temp_f') double tempF,
    @JsonKey(name: 'condition') WeatherCondition condition,
    @JsonKey(name: 'feelslike_c') double feelsLikeC,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  });

  $WeatherConditionCopyWith<$Res> get condition;
  $AirQualityFreezedCopyWith<$Res>? get airQuality;
}

/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res, $Val extends CurrentWeather>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempC = null,
    Object? tempF = null,
    Object? condition = null,
    Object? feelsLikeC = null,
    Object? airQuality = freezed,
  }) {
    return _then(
      _value.copyWith(
            tempC: null == tempC
                ? _value.tempC
                : tempC // ignore: cast_nullable_to_non_nullable
                      as double,
            tempF: null == tempF
                ? _value.tempF
                : tempF // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as WeatherCondition,
            feelsLikeC: null == feelsLikeC
                ? _value.feelsLikeC
                : feelsLikeC // ignore: cast_nullable_to_non_nullable
                      as double,
            airQuality: freezed == airQuality
                ? _value.airQuality
                : airQuality // ignore: cast_nullable_to_non_nullable
                      as AirQualityFreezed?,
          )
          as $Val,
    );
  }

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherConditionCopyWith<$Res> get condition {
    return $WeatherConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirQualityFreezedCopyWith<$Res>? get airQuality {
    if (_value.airQuality == null) {
      return null;
    }

    return $AirQualityFreezedCopyWith<$Res>(_value.airQuality!, (value) {
      return _then(_value.copyWith(airQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentWeatherImplCopyWith<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  factory _$$CurrentWeatherImplCopyWith(
    _$CurrentWeatherImpl value,
    $Res Function(_$CurrentWeatherImpl) then,
  ) = __$$CurrentWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'temp_f') double tempF,
    @JsonKey(name: 'condition') WeatherCondition condition,
    @JsonKey(name: 'feelslike_c') double feelsLikeC,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  });

  @override
  $WeatherConditionCopyWith<$Res> get condition;
  @override
  $AirQualityFreezedCopyWith<$Res>? get airQuality;
}

/// @nodoc
class __$$CurrentWeatherImplCopyWithImpl<$Res>
    extends _$CurrentWeatherCopyWithImpl<$Res, _$CurrentWeatherImpl>
    implements _$$CurrentWeatherImplCopyWith<$Res> {
  __$$CurrentWeatherImplCopyWithImpl(
    _$CurrentWeatherImpl _value,
    $Res Function(_$CurrentWeatherImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempC = null,
    Object? tempF = null,
    Object? condition = null,
    Object? feelsLikeC = null,
    Object? airQuality = freezed,
  }) {
    return _then(
      _$CurrentWeatherImpl(
        tempC: null == tempC
            ? _value.tempC
            : tempC // ignore: cast_nullable_to_non_nullable
                  as double,
        tempF: null == tempF
            ? _value.tempF
            : tempF // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as WeatherCondition,
        feelsLikeC: null == feelsLikeC
            ? _value.feelsLikeC
            : feelsLikeC // ignore: cast_nullable_to_non_nullable
                  as double,
        airQuality: freezed == airQuality
            ? _value.airQuality
            : airQuality // ignore: cast_nullable_to_non_nullable
                  as AirQualityFreezed?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentWeatherImpl implements _CurrentWeather {
  const _$CurrentWeatherImpl({
    @JsonKey(name: 'temp_c') required this.tempC,
    @JsonKey(name: 'temp_f') required this.tempF,
    @JsonKey(name: 'condition') required this.condition,
    @JsonKey(name: 'feelslike_c') required this.feelsLikeC,
    @JsonKey(name: 'air_quality') this.airQuality,
  });

  factory _$CurrentWeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherImplFromJson(json);

  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  @JsonKey(name: 'temp_f')
  final double tempF;
  @override
  @JsonKey(name: 'condition')
  final WeatherCondition condition;
  @override
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeC;
  @override
  @JsonKey(name: 'air_quality')
  final AirQualityFreezed? airQuality;

  @override
  String toString() {
    return 'CurrentWeather(tempC: $tempC, tempF: $tempF, condition: $condition, feelsLikeC: $feelsLikeC, airQuality: $airQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherImpl &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.tempF, tempF) || other.tempF == tempF) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.feelsLikeC, feelsLikeC) ||
                other.feelsLikeC == feelsLikeC) &&
            (identical(other.airQuality, airQuality) ||
                other.airQuality == airQuality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tempC, tempF, condition, feelsLikeC, airQuality);

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherImplCopyWith<_$CurrentWeatherImpl> get copyWith =>
      __$$CurrentWeatherImplCopyWithImpl<_$CurrentWeatherImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherImplToJson(this);
  }
}

abstract class _CurrentWeather implements CurrentWeather {
  const factory _CurrentWeather({
    @JsonKey(name: 'temp_c') required final double tempC,
    @JsonKey(name: 'temp_f') required final double tempF,
    @JsonKey(name: 'condition') required final WeatherCondition condition,
    @JsonKey(name: 'feelslike_c') required final double feelsLikeC,
    @JsonKey(name: 'air_quality') final AirQualityFreezed? airQuality,
  }) = _$CurrentWeatherImpl;

  factory _CurrentWeather.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherImpl.fromJson;

  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  @JsonKey(name: 'temp_f')
  double get tempF;
  @override
  @JsonKey(name: 'condition')
  WeatherCondition get condition;
  @override
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC;
  @override
  @JsonKey(name: 'air_quality')
  AirQualityFreezed? get airQuality;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentWeatherImplCopyWith<_$CurrentWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) {
  return _WeatherCondition.fromJson(json);
}

/// @nodoc
mixin _$WeatherCondition {
  String get text => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this WeatherCondition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherConditionCopyWith<WeatherCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherConditionCopyWith<$Res> {
  factory $WeatherConditionCopyWith(
    WeatherCondition value,
    $Res Function(WeatherCondition) then,
  ) = _$WeatherConditionCopyWithImpl<$Res, WeatherCondition>;
  @useResult
  $Res call({String text, String icon});
}

/// @nodoc
class _$WeatherConditionCopyWithImpl<$Res, $Val extends WeatherCondition>
    implements $WeatherConditionCopyWith<$Res> {
  _$WeatherConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? icon = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherConditionImplCopyWith<$Res>
    implements $WeatherConditionCopyWith<$Res> {
  factory _$$WeatherConditionImplCopyWith(
    _$WeatherConditionImpl value,
    $Res Function(_$WeatherConditionImpl) then,
  ) = __$$WeatherConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String icon});
}

/// @nodoc
class __$$WeatherConditionImplCopyWithImpl<$Res>
    extends _$WeatherConditionCopyWithImpl<$Res, _$WeatherConditionImpl>
    implements _$$WeatherConditionImplCopyWith<$Res> {
  __$$WeatherConditionImplCopyWithImpl(
    _$WeatherConditionImpl _value,
    $Res Function(_$WeatherConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? icon = null}) {
    return _then(
      _$WeatherConditionImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherConditionImpl implements _WeatherCondition {
  const _$WeatherConditionImpl({required this.text, required this.icon});

  factory _$WeatherConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherConditionImplFromJson(json);

  @override
  final String text;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherCondition(text: $text, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherConditionImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, icon);

  /// Create a copy of WeatherCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherConditionImplCopyWith<_$WeatherConditionImpl> get copyWith =>
      __$$WeatherConditionImplCopyWithImpl<_$WeatherConditionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherConditionImplToJson(this);
  }
}

abstract class _WeatherCondition implements WeatherCondition {
  const factory _WeatherCondition({
    required final String text,
    required final String icon,
  }) = _$WeatherConditionImpl;

  factory _WeatherCondition.fromJson(Map<String, dynamic> json) =
      _$WeatherConditionImpl.fromJson;

  @override
  String get text;
  @override
  String get icon;

  /// Create a copy of WeatherCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherConditionImplCopyWith<_$WeatherConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AirQualityFreezed _$AirQualityFreezedFromJson(Map<String, dynamic> json) {
  return _AirQualityFreezed.fromJson(json);
}

/// @nodoc
mixin _$AirQualityFreezed {
  double? get co => throw _privateConstructorUsedError;
  double? get no2 => throw _privateConstructorUsedError;
  double? get o3 => throw _privateConstructorUsedError;
  double? get so2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pm2_5')
  double? get pm25 => throw _privateConstructorUsedError;
  double? get pm10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'us-epa-index')
  int? get usEpaIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'gb-defra-index')
  int? get gbDefraIndex => throw _privateConstructorUsedError;

  /// Serializes this AirQualityFreezed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AirQualityFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirQualityFreezedCopyWith<AirQualityFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirQualityFreezedCopyWith<$Res> {
  factory $AirQualityFreezedCopyWith(
    AirQualityFreezed value,
    $Res Function(AirQualityFreezed) then,
  ) = _$AirQualityFreezedCopyWithImpl<$Res, AirQualityFreezed>;
  @useResult
  $Res call({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    @JsonKey(name: 'pm2_5') double? pm25,
    double? pm10,
    @JsonKey(name: 'us-epa-index') int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') int? gbDefraIndex,
  });
}

/// @nodoc
class _$AirQualityFreezedCopyWithImpl<$Res, $Val extends AirQualityFreezed>
    implements $AirQualityFreezedCopyWith<$Res> {
  _$AirQualityFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AirQualityFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? co = freezed,
    Object? no2 = freezed,
    Object? o3 = freezed,
    Object? so2 = freezed,
    Object? pm25 = freezed,
    Object? pm10 = freezed,
    Object? usEpaIndex = freezed,
    Object? gbDefraIndex = freezed,
  }) {
    return _then(
      _value.copyWith(
            co: freezed == co
                ? _value.co
                : co // ignore: cast_nullable_to_non_nullable
                      as double?,
            no2: freezed == no2
                ? _value.no2
                : no2 // ignore: cast_nullable_to_non_nullable
                      as double?,
            o3: freezed == o3
                ? _value.o3
                : o3 // ignore: cast_nullable_to_non_nullable
                      as double?,
            so2: freezed == so2
                ? _value.so2
                : so2 // ignore: cast_nullable_to_non_nullable
                      as double?,
            pm25: freezed == pm25
                ? _value.pm25
                : pm25 // ignore: cast_nullable_to_non_nullable
                      as double?,
            pm10: freezed == pm10
                ? _value.pm10
                : pm10 // ignore: cast_nullable_to_non_nullable
                      as double?,
            usEpaIndex: freezed == usEpaIndex
                ? _value.usEpaIndex
                : usEpaIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            gbDefraIndex: freezed == gbDefraIndex
                ? _value.gbDefraIndex
                : gbDefraIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AirQualityFreezedImplCopyWith<$Res>
    implements $AirQualityFreezedCopyWith<$Res> {
  factory _$$AirQualityFreezedImplCopyWith(
    _$AirQualityFreezedImpl value,
    $Res Function(_$AirQualityFreezedImpl) then,
  ) = __$$AirQualityFreezedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    @JsonKey(name: 'pm2_5') double? pm25,
    double? pm10,
    @JsonKey(name: 'us-epa-index') int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') int? gbDefraIndex,
  });
}

/// @nodoc
class __$$AirQualityFreezedImplCopyWithImpl<$Res>
    extends _$AirQualityFreezedCopyWithImpl<$Res, _$AirQualityFreezedImpl>
    implements _$$AirQualityFreezedImplCopyWith<$Res> {
  __$$AirQualityFreezedImplCopyWithImpl(
    _$AirQualityFreezedImpl _value,
    $Res Function(_$AirQualityFreezedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AirQualityFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? co = freezed,
    Object? no2 = freezed,
    Object? o3 = freezed,
    Object? so2 = freezed,
    Object? pm25 = freezed,
    Object? pm10 = freezed,
    Object? usEpaIndex = freezed,
    Object? gbDefraIndex = freezed,
  }) {
    return _then(
      _$AirQualityFreezedImpl(
        co: freezed == co
            ? _value.co
            : co // ignore: cast_nullable_to_non_nullable
                  as double?,
        no2: freezed == no2
            ? _value.no2
            : no2 // ignore: cast_nullable_to_non_nullable
                  as double?,
        o3: freezed == o3
            ? _value.o3
            : o3 // ignore: cast_nullable_to_non_nullable
                  as double?,
        so2: freezed == so2
            ? _value.so2
            : so2 // ignore: cast_nullable_to_non_nullable
                  as double?,
        pm25: freezed == pm25
            ? _value.pm25
            : pm25 // ignore: cast_nullable_to_non_nullable
                  as double?,
        pm10: freezed == pm10
            ? _value.pm10
            : pm10 // ignore: cast_nullable_to_non_nullable
                  as double?,
        usEpaIndex: freezed == usEpaIndex
            ? _value.usEpaIndex
            : usEpaIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        gbDefraIndex: freezed == gbDefraIndex
            ? _value.gbDefraIndex
            : gbDefraIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AirQualityFreezedImpl extends _AirQualityFreezed {
  const _$AirQualityFreezedImpl({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    @JsonKey(name: 'pm2_5') this.pm25,
    this.pm10,
    @JsonKey(name: 'us-epa-index') this.usEpaIndex,
    @JsonKey(name: 'gb-defra-index') this.gbDefraIndex,
  }) : super._();

  factory _$AirQualityFreezedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirQualityFreezedImplFromJson(json);

  @override
  final double? co;
  @override
  final double? no2;
  @override
  final double? o3;
  @override
  final double? so2;
  @override
  @JsonKey(name: 'pm2_5')
  final double? pm25;
  @override
  final double? pm10;
  @override
  @JsonKey(name: 'us-epa-index')
  final int? usEpaIndex;
  @override
  @JsonKey(name: 'gb-defra-index')
  final int? gbDefraIndex;

  @override
  String toString() {
    return 'AirQualityFreezed(co: $co, no2: $no2, o3: $o3, so2: $so2, pm25: $pm25, pm10: $pm10, usEpaIndex: $usEpaIndex, gbDefraIndex: $gbDefraIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirQualityFreezedImpl &&
            (identical(other.co, co) || other.co == co) &&
            (identical(other.no2, no2) || other.no2 == no2) &&
            (identical(other.o3, o3) || other.o3 == o3) &&
            (identical(other.so2, so2) || other.so2 == so2) &&
            (identical(other.pm25, pm25) || other.pm25 == pm25) &&
            (identical(other.pm10, pm10) || other.pm10 == pm10) &&
            (identical(other.usEpaIndex, usEpaIndex) ||
                other.usEpaIndex == usEpaIndex) &&
            (identical(other.gbDefraIndex, gbDefraIndex) ||
                other.gbDefraIndex == gbDefraIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    co,
    no2,
    o3,
    so2,
    pm25,
    pm10,
    usEpaIndex,
    gbDefraIndex,
  );

  /// Create a copy of AirQualityFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirQualityFreezedImplCopyWith<_$AirQualityFreezedImpl> get copyWith =>
      __$$AirQualityFreezedImplCopyWithImpl<_$AirQualityFreezedImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AirQualityFreezedImplToJson(this);
  }
}

abstract class _AirQualityFreezed extends AirQualityFreezed {
  const factory _AirQualityFreezed({
    final double? co,
    final double? no2,
    final double? o3,
    final double? so2,
    @JsonKey(name: 'pm2_5') final double? pm25,
    final double? pm10,
    @JsonKey(name: 'us-epa-index') final int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') final int? gbDefraIndex,
  }) = _$AirQualityFreezedImpl;
  const _AirQualityFreezed._() : super._();

  factory _AirQualityFreezed.fromJson(Map<String, dynamic> json) =
      _$AirQualityFreezedImpl.fromJson;

  @override
  double? get co;
  @override
  double? get no2;
  @override
  double? get o3;
  @override
  double? get so2;
  @override
  @JsonKey(name: 'pm2_5')
  double? get pm25;
  @override
  double? get pm10;
  @override
  @JsonKey(name: 'us-epa-index')
  int? get usEpaIndex;
  @override
  @JsonKey(name: 'gb-defra-index')
  int? get gbDefraIndex;

  /// Create a copy of AirQualityFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirQualityFreezedImplCopyWith<_$AirQualityFreezedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForecastDayFreezed _$ForecastDayFreezedFromJson(Map<String, dynamic> json) {
  return _ForecastDayFreezed.fromJson(json);
}

/// @nodoc
mixin _$ForecastDayFreezed {
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'day')
  DayForecast get dayForecast => throw _privateConstructorUsedError;
  List<HourlyForecastFreezed> get hour => throw _privateConstructorUsedError;

  /// Serializes this ForecastDayFreezed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForecastDayFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastDayFreezedCopyWith<ForecastDayFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDayFreezedCopyWith<$Res> {
  factory $ForecastDayFreezedCopyWith(
    ForecastDayFreezed value,
    $Res Function(ForecastDayFreezed) then,
  ) = _$ForecastDayFreezedCopyWithImpl<$Res, ForecastDayFreezed>;
  @useResult
  $Res call({
    DateTime date,
    @JsonKey(name: 'day') DayForecast dayForecast,
    List<HourlyForecastFreezed> hour,
  });

  $DayForecastCopyWith<$Res> get dayForecast;
}

/// @nodoc
class _$ForecastDayFreezedCopyWithImpl<$Res, $Val extends ForecastDayFreezed>
    implements $ForecastDayFreezedCopyWith<$Res> {
  _$ForecastDayFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastDayFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayForecast = null,
    Object? hour = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            dayForecast: null == dayForecast
                ? _value.dayForecast
                : dayForecast // ignore: cast_nullable_to_non_nullable
                      as DayForecast,
            hour: null == hour
                ? _value.hour
                : hour // ignore: cast_nullable_to_non_nullable
                      as List<HourlyForecastFreezed>,
          )
          as $Val,
    );
  }

  /// Create a copy of ForecastDayFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DayForecastCopyWith<$Res> get dayForecast {
    return $DayForecastCopyWith<$Res>(_value.dayForecast, (value) {
      return _then(_value.copyWith(dayForecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastDayFreezedImplCopyWith<$Res>
    implements $ForecastDayFreezedCopyWith<$Res> {
  factory _$$ForecastDayFreezedImplCopyWith(
    _$ForecastDayFreezedImpl value,
    $Res Function(_$ForecastDayFreezedImpl) then,
  ) = __$$ForecastDayFreezedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    @JsonKey(name: 'day') DayForecast dayForecast,
    List<HourlyForecastFreezed> hour,
  });

  @override
  $DayForecastCopyWith<$Res> get dayForecast;
}

/// @nodoc
class __$$ForecastDayFreezedImplCopyWithImpl<$Res>
    extends _$ForecastDayFreezedCopyWithImpl<$Res, _$ForecastDayFreezedImpl>
    implements _$$ForecastDayFreezedImplCopyWith<$Res> {
  __$$ForecastDayFreezedImplCopyWithImpl(
    _$ForecastDayFreezedImpl _value,
    $Res Function(_$ForecastDayFreezedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastDayFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayForecast = null,
    Object? hour = null,
  }) {
    return _then(
      _$ForecastDayFreezedImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        dayForecast: null == dayForecast
            ? _value.dayForecast
            : dayForecast // ignore: cast_nullable_to_non_nullable
                  as DayForecast,
        hour: null == hour
            ? _value._hour
            : hour // ignore: cast_nullable_to_non_nullable
                  as List<HourlyForecastFreezed>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastDayFreezedImpl extends _ForecastDayFreezed {
  const _$ForecastDayFreezedImpl({
    required this.date,
    @JsonKey(name: 'day') required this.dayForecast,
    required final List<HourlyForecastFreezed> hour,
  }) : _hour = hour,
       super._();

  factory _$ForecastDayFreezedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastDayFreezedImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey(name: 'day')
  final DayForecast dayForecast;
  final List<HourlyForecastFreezed> _hour;
  @override
  List<HourlyForecastFreezed> get hour {
    if (_hour is EqualUnmodifiableListView) return _hour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hour);
  }

  @override
  String toString() {
    return 'ForecastDayFreezed(date: $date, dayForecast: $dayForecast, hour: $hour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastDayFreezedImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayForecast, dayForecast) ||
                other.dayForecast == dayForecast) &&
            const DeepCollectionEquality().equals(other._hour, _hour));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    dayForecast,
    const DeepCollectionEquality().hash(_hour),
  );

  /// Create a copy of ForecastDayFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastDayFreezedImplCopyWith<_$ForecastDayFreezedImpl> get copyWith =>
      __$$ForecastDayFreezedImplCopyWithImpl<_$ForecastDayFreezedImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastDayFreezedImplToJson(this);
  }
}

abstract class _ForecastDayFreezed extends ForecastDayFreezed {
  const factory _ForecastDayFreezed({
    required final DateTime date,
    @JsonKey(name: 'day') required final DayForecast dayForecast,
    required final List<HourlyForecastFreezed> hour,
  }) = _$ForecastDayFreezedImpl;
  const _ForecastDayFreezed._() : super._();

  factory _ForecastDayFreezed.fromJson(Map<String, dynamic> json) =
      _$ForecastDayFreezedImpl.fromJson;

  @override
  DateTime get date;
  @override
  @JsonKey(name: 'day')
  DayForecast get dayForecast;
  @override
  List<HourlyForecastFreezed> get hour;

  /// Create a copy of ForecastDayFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastDayFreezedImplCopyWith<_$ForecastDayFreezedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DayForecast _$DayForecastFromJson(Map<String, dynamic> json) {
  return _DayForecast.fromJson(json);
}

/// @nodoc
mixin _$DayForecast {
  @JsonKey(name: 'maxtemp_c')
  double get maxTempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'mintemp_c')
  double get minTempC => throw _privateConstructorUsedError;
  WeatherCondition get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_quality')
  AirQualityFreezed? get airQuality => throw _privateConstructorUsedError;

  /// Serializes this DayForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayForecastCopyWith<DayForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayForecastCopyWith<$Res> {
  factory $DayForecastCopyWith(
    DayForecast value,
    $Res Function(DayForecast) then,
  ) = _$DayForecastCopyWithImpl<$Res, DayForecast>;
  @useResult
  $Res call({
    @JsonKey(name: 'maxtemp_c') double maxTempC,
    @JsonKey(name: 'mintemp_c') double minTempC,
    WeatherCondition condition,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  });

  $WeatherConditionCopyWith<$Res> get condition;
  $AirQualityFreezedCopyWith<$Res>? get airQuality;
}

/// @nodoc
class _$DayForecastCopyWithImpl<$Res, $Val extends DayForecast>
    implements $DayForecastCopyWith<$Res> {
  _$DayForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTempC = null,
    Object? minTempC = null,
    Object? condition = null,
    Object? airQuality = freezed,
  }) {
    return _then(
      _value.copyWith(
            maxTempC: null == maxTempC
                ? _value.maxTempC
                : maxTempC // ignore: cast_nullable_to_non_nullable
                      as double,
            minTempC: null == minTempC
                ? _value.minTempC
                : minTempC // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as WeatherCondition,
            airQuality: freezed == airQuality
                ? _value.airQuality
                : airQuality // ignore: cast_nullable_to_non_nullable
                      as AirQualityFreezed?,
          )
          as $Val,
    );
  }

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherConditionCopyWith<$Res> get condition {
    return $WeatherConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirQualityFreezedCopyWith<$Res>? get airQuality {
    if (_value.airQuality == null) {
      return null;
    }

    return $AirQualityFreezedCopyWith<$Res>(_value.airQuality!, (value) {
      return _then(_value.copyWith(airQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DayForecastImplCopyWith<$Res>
    implements $DayForecastCopyWith<$Res> {
  factory _$$DayForecastImplCopyWith(
    _$DayForecastImpl value,
    $Res Function(_$DayForecastImpl) then,
  ) = __$$DayForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'maxtemp_c') double maxTempC,
    @JsonKey(name: 'mintemp_c') double minTempC,
    WeatherCondition condition,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  });

  @override
  $WeatherConditionCopyWith<$Res> get condition;
  @override
  $AirQualityFreezedCopyWith<$Res>? get airQuality;
}

/// @nodoc
class __$$DayForecastImplCopyWithImpl<$Res>
    extends _$DayForecastCopyWithImpl<$Res, _$DayForecastImpl>
    implements _$$DayForecastImplCopyWith<$Res> {
  __$$DayForecastImplCopyWithImpl(
    _$DayForecastImpl _value,
    $Res Function(_$DayForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTempC = null,
    Object? minTempC = null,
    Object? condition = null,
    Object? airQuality = freezed,
  }) {
    return _then(
      _$DayForecastImpl(
        maxTempC: null == maxTempC
            ? _value.maxTempC
            : maxTempC // ignore: cast_nullable_to_non_nullable
                  as double,
        minTempC: null == minTempC
            ? _value.minTempC
            : minTempC // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as WeatherCondition,
        airQuality: freezed == airQuality
            ? _value.airQuality
            : airQuality // ignore: cast_nullable_to_non_nullable
                  as AirQualityFreezed?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DayForecastImpl implements _DayForecast {
  const _$DayForecastImpl({
    @JsonKey(name: 'maxtemp_c') required this.maxTempC,
    @JsonKey(name: 'mintemp_c') required this.minTempC,
    required this.condition,
    @JsonKey(name: 'air_quality') this.airQuality,
  });

  factory _$DayForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayForecastImplFromJson(json);

  @override
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;
  @override
  @JsonKey(name: 'mintemp_c')
  final double minTempC;
  @override
  final WeatherCondition condition;
  @override
  @JsonKey(name: 'air_quality')
  final AirQualityFreezed? airQuality;

  @override
  String toString() {
    return 'DayForecast(maxTempC: $maxTempC, minTempC: $minTempC, condition: $condition, airQuality: $airQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayForecastImpl &&
            (identical(other.maxTempC, maxTempC) ||
                other.maxTempC == maxTempC) &&
            (identical(other.minTempC, minTempC) ||
                other.minTempC == minTempC) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.airQuality, airQuality) ||
                other.airQuality == airQuality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxTempC, minTempC, condition, airQuality);

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayForecastImplCopyWith<_$DayForecastImpl> get copyWith =>
      __$$DayForecastImplCopyWithImpl<_$DayForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayForecastImplToJson(this);
  }
}

abstract class _DayForecast implements DayForecast {
  const factory _DayForecast({
    @JsonKey(name: 'maxtemp_c') required final double maxTempC,
    @JsonKey(name: 'mintemp_c') required final double minTempC,
    required final WeatherCondition condition,
    @JsonKey(name: 'air_quality') final AirQualityFreezed? airQuality,
  }) = _$DayForecastImpl;

  factory _DayForecast.fromJson(Map<String, dynamic> json) =
      _$DayForecastImpl.fromJson;

  @override
  @JsonKey(name: 'maxtemp_c')
  double get maxTempC;
  @override
  @JsonKey(name: 'mintemp_c')
  double get minTempC;
  @override
  WeatherCondition get condition;
  @override
  @JsonKey(name: 'air_quality')
  AirQualityFreezed? get airQuality;

  /// Create a copy of DayForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayForecastImplCopyWith<_$DayForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyForecastFreezed _$HourlyForecastFreezedFromJson(
  Map<String, dynamic> json,
) {
  return _HourlyForecastFreezed.fromJson(json);
}

/// @nodoc
mixin _$HourlyForecastFreezed {
  DateTime get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  WeatherCondition get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_quality')
  AirQualityFreezed? get airQuality => throw _privateConstructorUsedError;

  /// Serializes this HourlyForecastFreezed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyForecastFreezedCopyWith<HourlyForecastFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyForecastFreezedCopyWith<$Res> {
  factory $HourlyForecastFreezedCopyWith(
    HourlyForecastFreezed value,
    $Res Function(HourlyForecastFreezed) then,
  ) = _$HourlyForecastFreezedCopyWithImpl<$Res, HourlyForecastFreezed>;
  @useResult
  $Res call({
    DateTime time,
    @JsonKey(name: 'temp_c') double tempC,
    WeatherCondition condition,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  });

  $WeatherConditionCopyWith<$Res> get condition;
  $AirQualityFreezedCopyWith<$Res>? get airQuality;
}

/// @nodoc
class _$HourlyForecastFreezedCopyWithImpl<
  $Res,
  $Val extends HourlyForecastFreezed
>
    implements $HourlyForecastFreezedCopyWith<$Res> {
  _$HourlyForecastFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? tempC = null,
    Object? condition = null,
    Object? airQuality = freezed,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            tempC: null == tempC
                ? _value.tempC
                : tempC // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as WeatherCondition,
            airQuality: freezed == airQuality
                ? _value.airQuality
                : airQuality // ignore: cast_nullable_to_non_nullable
                      as AirQualityFreezed?,
          )
          as $Val,
    );
  }

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherConditionCopyWith<$Res> get condition {
    return $WeatherConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirQualityFreezedCopyWith<$Res>? get airQuality {
    if (_value.airQuality == null) {
      return null;
    }

    return $AirQualityFreezedCopyWith<$Res>(_value.airQuality!, (value) {
      return _then(_value.copyWith(airQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HourlyForecastFreezedImplCopyWith<$Res>
    implements $HourlyForecastFreezedCopyWith<$Res> {
  factory _$$HourlyForecastFreezedImplCopyWith(
    _$HourlyForecastFreezedImpl value,
    $Res Function(_$HourlyForecastFreezedImpl) then,
  ) = __$$HourlyForecastFreezedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime time,
    @JsonKey(name: 'temp_c') double tempC,
    WeatherCondition condition,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  });

  @override
  $WeatherConditionCopyWith<$Res> get condition;
  @override
  $AirQualityFreezedCopyWith<$Res>? get airQuality;
}

/// @nodoc
class __$$HourlyForecastFreezedImplCopyWithImpl<$Res>
    extends
        _$HourlyForecastFreezedCopyWithImpl<$Res, _$HourlyForecastFreezedImpl>
    implements _$$HourlyForecastFreezedImplCopyWith<$Res> {
  __$$HourlyForecastFreezedImplCopyWithImpl(
    _$HourlyForecastFreezedImpl _value,
    $Res Function(_$HourlyForecastFreezedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? tempC = null,
    Object? condition = null,
    Object? airQuality = freezed,
  }) {
    return _then(
      _$HourlyForecastFreezedImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        tempC: null == tempC
            ? _value.tempC
            : tempC // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as WeatherCondition,
        airQuality: freezed == airQuality
            ? _value.airQuality
            : airQuality // ignore: cast_nullable_to_non_nullable
                  as AirQualityFreezed?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyForecastFreezedImpl implements _HourlyForecastFreezed {
  const _$HourlyForecastFreezedImpl({
    required this.time,
    @JsonKey(name: 'temp_c') required this.tempC,
    required this.condition,
    @JsonKey(name: 'air_quality') this.airQuality,
  });

  factory _$HourlyForecastFreezedImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyForecastFreezedImplFromJson(json);

  @override
  final DateTime time;
  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  final WeatherCondition condition;
  @override
  @JsonKey(name: 'air_quality')
  final AirQualityFreezed? airQuality;

  @override
  String toString() {
    return 'HourlyForecastFreezed(time: $time, tempC: $tempC, condition: $condition, airQuality: $airQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyForecastFreezedImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.airQuality, airQuality) ||
                other.airQuality == airQuality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, tempC, condition, airQuality);

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyForecastFreezedImplCopyWith<_$HourlyForecastFreezedImpl>
  get copyWith =>
      __$$HourlyForecastFreezedImplCopyWithImpl<_$HourlyForecastFreezedImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyForecastFreezedImplToJson(this);
  }
}

abstract class _HourlyForecastFreezed implements HourlyForecastFreezed {
  const factory _HourlyForecastFreezed({
    required final DateTime time,
    @JsonKey(name: 'temp_c') required final double tempC,
    required final WeatherCondition condition,
    @JsonKey(name: 'air_quality') final AirQualityFreezed? airQuality,
  }) = _$HourlyForecastFreezedImpl;

  factory _HourlyForecastFreezed.fromJson(Map<String, dynamic> json) =
      _$HourlyForecastFreezedImpl.fromJson;

  @override
  DateTime get time;
  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  WeatherCondition get condition;
  @override
  @JsonKey(name: 'air_quality')
  AirQualityFreezed? get airQuality;

  /// Create a copy of HourlyForecastFreezed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyForecastFreezedImplCopyWith<_$HourlyForecastFreezedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
