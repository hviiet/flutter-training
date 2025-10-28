// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return _WeatherResponse.fromJson(json);
}

/// @nodoc
mixin _$WeatherResponse {
  Location get location => throw _privateConstructorUsedError;
  Current get current => throw _privateConstructorUsedError;
  Forecast get forecast => throw _privateConstructorUsedError;

  /// Serializes this WeatherResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherResponseCopyWith<WeatherResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherResponseCopyWith<$Res> {
  factory $WeatherResponseCopyWith(
    WeatherResponse value,
    $Res Function(WeatherResponse) then,
  ) = _$WeatherResponseCopyWithImpl<$Res, WeatherResponse>;
  @useResult
  $Res call({Location location, Current current, Forecast forecast});

  $LocationCopyWith<$Res> get location;
  $CurrentCopyWith<$Res> get current;
  $ForecastCopyWith<$Res> get forecast;
}

/// @nodoc
class _$WeatherResponseCopyWithImpl<$Res, $Val extends WeatherResponse>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(
      _value.copyWith(
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as Location,
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as Current,
            forecast: null == forecast
                ? _value.forecast
                : forecast // ignore: cast_nullable_to_non_nullable
                      as Forecast,
          )
          as $Val,
    );
  }

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentCopyWith<$Res> get current {
    return $CurrentCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastCopyWith<$Res> get forecast {
    return $ForecastCopyWith<$Res>(_value.forecast, (value) {
      return _then(_value.copyWith(forecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherResponseImplCopyWith<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  factory _$$WeatherResponseImplCopyWith(
    _$WeatherResponseImpl value,
    $Res Function(_$WeatherResponseImpl) then,
  ) = __$$WeatherResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Location location, Current current, Forecast forecast});

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $CurrentCopyWith<$Res> get current;
  @override
  $ForecastCopyWith<$Res> get forecast;
}

/// @nodoc
class __$$WeatherResponseImplCopyWithImpl<$Res>
    extends _$WeatherResponseCopyWithImpl<$Res, _$WeatherResponseImpl>
    implements _$$WeatherResponseImplCopyWith<$Res> {
  __$$WeatherResponseImplCopyWithImpl(
    _$WeatherResponseImpl _value,
    $Res Function(_$WeatherResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? current = null,
    Object? forecast = null,
  }) {
    return _then(
      _$WeatherResponseImpl(
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as Location,
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as Current,
        forecast: null == forecast
            ? _value.forecast
            : forecast // ignore: cast_nullable_to_non_nullable
                  as Forecast,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherResponseImpl implements _WeatherResponse {
  const _$WeatherResponseImpl({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory _$WeatherResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherResponseImplFromJson(json);

  @override
  final Location location;
  @override
  final Current current;
  @override
  final Forecast forecast;

  @override
  String toString() {
    return 'WeatherResponse(location: $location, current: $current, forecast: $forecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherResponseImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.forecast, forecast) ||
                other.forecast == forecast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, location, current, forecast);

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherResponseImplCopyWith<_$WeatherResponseImpl> get copyWith =>
      __$$WeatherResponseImplCopyWithImpl<_$WeatherResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherResponseImplToJson(this);
  }
}

abstract class _WeatherResponse implements WeatherResponse {
  const factory _WeatherResponse({
    required final Location location,
    required final Current current,
    required final Forecast forecast,
  }) = _$WeatherResponseImpl;

  factory _WeatherResponse.fromJson(Map<String, dynamic> json) =
      _$WeatherResponseImpl.fromJson;

  @override
  Location get location;
  @override
  Current get current;
  @override
  Forecast get forecast;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherResponseImplCopyWith<_$WeatherResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get name => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
  $Res call({String name, String region, double lat, double lon});
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
    Object? name = null,
    Object? region = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            region: null == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String,
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lon: null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                      as double,
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
  $Res call({String name, String region, double lat, double lon});
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
    Object? name = null,
    Object? region = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(
      _$LocationImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        region: null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String,
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lon: null == lon
            ? _value.lon
            : lon // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl({
    required this.name,
    required this.region,
    required this.lat,
    required this.lon,
  });

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final String name;
  @override
  final String region;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'Location(name: $name, region: $region, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, region, lat, lon);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location({
    required final String name,
    required final String region,
    required final double lat,
    required final double lon,
  }) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  String get name;
  @override
  String get region;
  @override
  double get lat;
  @override
  double get lon;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return _Current.fromJson(json);
}

/// @nodoc
mixin _$Current {
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_day')
  int get isDay => throw _privateConstructorUsedError;
  Condition get condition => throw _privateConstructorUsedError;

  /// WeatherAPI trả air_quality chỉ khi aqi=yes
  @JsonKey(name: 'air_quality')
  AirQuality? get airQuality => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_kph')
  double? get windKph => throw _privateConstructorUsedError;
  int? get humidity => throw _privateConstructorUsedError;

  /// Serializes this Current to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentCopyWith<Current> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCopyWith<$Res> {
  factory $CurrentCopyWith(Current value, $Res Function(Current) then) =
      _$CurrentCopyWithImpl<$Res, Current>;
  @useResult
  $Res call({
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'feelslike_c') double feelsLikeC,
    @JsonKey(name: 'is_day') int isDay,
    Condition condition,
    @JsonKey(name: 'air_quality') AirQuality? airQuality,
    @JsonKey(name: 'wind_kph') double? windKph,
    int? humidity,
  });

  $ConditionCopyWith<$Res> get condition;
  $AirQualityCopyWith<$Res>? get airQuality;
}

/// @nodoc
class _$CurrentCopyWithImpl<$Res, $Val extends Current>
    implements $CurrentCopyWith<$Res> {
  _$CurrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempC = null,
    Object? feelsLikeC = null,
    Object? isDay = null,
    Object? condition = null,
    Object? airQuality = freezed,
    Object? windKph = freezed,
    Object? humidity = freezed,
  }) {
    return _then(
      _value.copyWith(
            tempC: null == tempC
                ? _value.tempC
                : tempC // ignore: cast_nullable_to_non_nullable
                      as double,
            feelsLikeC: null == feelsLikeC
                ? _value.feelsLikeC
                : feelsLikeC // ignore: cast_nullable_to_non_nullable
                      as double,
            isDay: null == isDay
                ? _value.isDay
                : isDay // ignore: cast_nullable_to_non_nullable
                      as int,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as Condition,
            airQuality: freezed == airQuality
                ? _value.airQuality
                : airQuality // ignore: cast_nullable_to_non_nullable
                      as AirQuality?,
            windKph: freezed == windKph
                ? _value.windKph
                : windKph // ignore: cast_nullable_to_non_nullable
                      as double?,
            humidity: freezed == humidity
                ? _value.humidity
                : humidity // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionCopyWith<$Res> get condition {
    return $ConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirQualityCopyWith<$Res>? get airQuality {
    if (_value.airQuality == null) {
      return null;
    }

    return $AirQualityCopyWith<$Res>(_value.airQuality!, (value) {
      return _then(_value.copyWith(airQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentImplCopyWith<$Res> implements $CurrentCopyWith<$Res> {
  factory _$$CurrentImplCopyWith(
    _$CurrentImpl value,
    $Res Function(_$CurrentImpl) then,
  ) = __$$CurrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'feelslike_c') double feelsLikeC,
    @JsonKey(name: 'is_day') int isDay,
    Condition condition,
    @JsonKey(name: 'air_quality') AirQuality? airQuality,
    @JsonKey(name: 'wind_kph') double? windKph,
    int? humidity,
  });

  @override
  $ConditionCopyWith<$Res> get condition;
  @override
  $AirQualityCopyWith<$Res>? get airQuality;
}

/// @nodoc
class __$$CurrentImplCopyWithImpl<$Res>
    extends _$CurrentCopyWithImpl<$Res, _$CurrentImpl>
    implements _$$CurrentImplCopyWith<$Res> {
  __$$CurrentImplCopyWithImpl(
    _$CurrentImpl _value,
    $Res Function(_$CurrentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempC = null,
    Object? feelsLikeC = null,
    Object? isDay = null,
    Object? condition = null,
    Object? airQuality = freezed,
    Object? windKph = freezed,
    Object? humidity = freezed,
  }) {
    return _then(
      _$CurrentImpl(
        tempC: null == tempC
            ? _value.tempC
            : tempC // ignore: cast_nullable_to_non_nullable
                  as double,
        feelsLikeC: null == feelsLikeC
            ? _value.feelsLikeC
            : feelsLikeC // ignore: cast_nullable_to_non_nullable
                  as double,
        isDay: null == isDay
            ? _value.isDay
            : isDay // ignore: cast_nullable_to_non_nullable
                  as int,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as Condition,
        airQuality: freezed == airQuality
            ? _value.airQuality
            : airQuality // ignore: cast_nullable_to_non_nullable
                  as AirQuality?,
        windKph: freezed == windKph
            ? _value.windKph
            : windKph // ignore: cast_nullable_to_non_nullable
                  as double?,
        humidity: freezed == humidity
            ? _value.humidity
            : humidity // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentImpl implements _Current {
  const _$CurrentImpl({
    @JsonKey(name: 'temp_c') required this.tempC,
    @JsonKey(name: 'feelslike_c') required this.feelsLikeC,
    @JsonKey(name: 'is_day') required this.isDay,
    required this.condition,
    @JsonKey(name: 'air_quality') this.airQuality,
    @JsonKey(name: 'wind_kph') this.windKph,
    this.humidity,
  });

  factory _$CurrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentImplFromJson(json);

  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  @JsonKey(name: 'feelslike_c')
  final double feelsLikeC;
  @override
  @JsonKey(name: 'is_day')
  final int isDay;
  @override
  final Condition condition;

  /// WeatherAPI trả air_quality chỉ khi aqi=yes
  @override
  @JsonKey(name: 'air_quality')
  final AirQuality? airQuality;
  @override
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @override
  final int? humidity;

  @override
  String toString() {
    return 'Current(tempC: $tempC, feelsLikeC: $feelsLikeC, isDay: $isDay, condition: $condition, airQuality: $airQuality, windKph: $windKph, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentImpl &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.feelsLikeC, feelsLikeC) ||
                other.feelsLikeC == feelsLikeC) &&
            (identical(other.isDay, isDay) || other.isDay == isDay) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.airQuality, airQuality) ||
                other.airQuality == airQuality) &&
            (identical(other.windKph, windKph) || other.windKph == windKph) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tempC,
    feelsLikeC,
    isDay,
    condition,
    airQuality,
    windKph,
    humidity,
  );

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      __$$CurrentImplCopyWithImpl<_$CurrentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentImplToJson(this);
  }
}

abstract class _Current implements Current {
  const factory _Current({
    @JsonKey(name: 'temp_c') required final double tempC,
    @JsonKey(name: 'feelslike_c') required final double feelsLikeC,
    @JsonKey(name: 'is_day') required final int isDay,
    required final Condition condition,
    @JsonKey(name: 'air_quality') final AirQuality? airQuality,
    @JsonKey(name: 'wind_kph') final double? windKph,
    final int? humidity,
  }) = _$CurrentImpl;

  factory _Current.fromJson(Map<String, dynamic> json) = _$CurrentImpl.fromJson;

  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  @JsonKey(name: 'feelslike_c')
  double get feelsLikeC;
  @override
  @JsonKey(name: 'is_day')
  int get isDay;
  @override
  Condition get condition;

  /// WeatherAPI trả air_quality chỉ khi aqi=yes
  @override
  @JsonKey(name: 'air_quality')
  AirQuality? get airQuality;
  @override
  @JsonKey(name: 'wind_kph')
  double? get windKph;
  @override
  int? get humidity;

  /// Create a copy of Current
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return _Forecast.fromJson(json);
}

/// @nodoc
mixin _$Forecast {
  List<ForecastDay> get forecastday => throw _privateConstructorUsedError;

  /// Serializes this Forecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res, Forecast>;
  @useResult
  $Res call({List<ForecastDay> forecastday});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res, $Val extends Forecast>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? forecastday = null}) {
    return _then(
      _value.copyWith(
            forecastday: null == forecastday
                ? _value.forecastday
                : forecastday // ignore: cast_nullable_to_non_nullable
                      as List<ForecastDay>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForecastImplCopyWith<$Res>
    implements $ForecastCopyWith<$Res> {
  factory _$$ForecastImplCopyWith(
    _$ForecastImpl value,
    $Res Function(_$ForecastImpl) then,
  ) = __$$ForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ForecastDay> forecastday});
}

/// @nodoc
class __$$ForecastImplCopyWithImpl<$Res>
    extends _$ForecastCopyWithImpl<$Res, _$ForecastImpl>
    implements _$$ForecastImplCopyWith<$Res> {
  __$$ForecastImplCopyWithImpl(
    _$ForecastImpl _value,
    $Res Function(_$ForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? forecastday = null}) {
    return _then(
      _$ForecastImpl(
        forecastday: null == forecastday
            ? _value._forecastday
            : forecastday // ignore: cast_nullable_to_non_nullable
                  as List<ForecastDay>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastImpl implements _Forecast {
  const _$ForecastImpl({required final List<ForecastDay> forecastday})
    : _forecastday = forecastday;

  factory _$ForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastImplFromJson(json);

  final List<ForecastDay> _forecastday;
  @override
  List<ForecastDay> get forecastday {
    if (_forecastday is EqualUnmodifiableListView) return _forecastday;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecastday);
  }

  @override
  String toString() {
    return 'Forecast(forecastday: $forecastday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastImpl &&
            const DeepCollectionEquality().equals(
              other._forecastday,
              _forecastday,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_forecastday),
  );

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      __$$ForecastImplCopyWithImpl<_$ForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastImplToJson(this);
  }
}

abstract class _Forecast implements Forecast {
  const factory _Forecast({required final List<ForecastDay> forecastday}) =
      _$ForecastImpl;

  factory _Forecast.fromJson(Map<String, dynamic> json) =
      _$ForecastImpl.fromJson;

  @override
  List<ForecastDay> get forecastday;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) {
  return _ForecastDay.fromJson(json);
}

/// @nodoc
mixin _$ForecastDay {
  /// "YYYY-MM-DD"
  String get date => throw _privateConstructorUsedError;
  Day get day => throw _privateConstructorUsedError;
  List<Hour> get hour => throw _privateConstructorUsedError;

  /// Serializes this ForecastDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForecastDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastDayCopyWith<ForecastDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDayCopyWith<$Res> {
  factory $ForecastDayCopyWith(
    ForecastDay value,
    $Res Function(ForecastDay) then,
  ) = _$ForecastDayCopyWithImpl<$Res, ForecastDay>;
  @useResult
  $Res call({String date, Day day, List<Hour> hour});

  $DayCopyWith<$Res> get day;
}

/// @nodoc
class _$ForecastDayCopyWithImpl<$Res, $Val extends ForecastDay>
    implements $ForecastDayCopyWith<$Res> {
  _$ForecastDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? day = null, Object? hour = null}) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            day: null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as Day,
            hour: null == hour
                ? _value.hour
                : hour // ignore: cast_nullable_to_non_nullable
                      as List<Hour>,
          )
          as $Val,
    );
  }

  /// Create a copy of ForecastDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DayCopyWith<$Res> get day {
    return $DayCopyWith<$Res>(_value.day, (value) {
      return _then(_value.copyWith(day: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastDayImplCopyWith<$Res>
    implements $ForecastDayCopyWith<$Res> {
  factory _$$ForecastDayImplCopyWith(
    _$ForecastDayImpl value,
    $Res Function(_$ForecastDayImpl) then,
  ) = __$$ForecastDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, Day day, List<Hour> hour});

  @override
  $DayCopyWith<$Res> get day;
}

/// @nodoc
class __$$ForecastDayImplCopyWithImpl<$Res>
    extends _$ForecastDayCopyWithImpl<$Res, _$ForecastDayImpl>
    implements _$$ForecastDayImplCopyWith<$Res> {
  __$$ForecastDayImplCopyWithImpl(
    _$ForecastDayImpl _value,
    $Res Function(_$ForecastDayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? day = null, Object? hour = null}) {
    return _then(
      _$ForecastDayImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        day: null == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as Day,
        hour: null == hour
            ? _value._hour
            : hour // ignore: cast_nullable_to_non_nullable
                  as List<Hour>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastDayImpl implements _ForecastDay {
  const _$ForecastDayImpl({
    required this.date,
    required this.day,
    required final List<Hour> hour,
  }) : _hour = hour;

  factory _$ForecastDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastDayImplFromJson(json);

  /// "YYYY-MM-DD"
  @override
  final String date;
  @override
  final Day day;
  final List<Hour> _hour;
  @override
  List<Hour> get hour {
    if (_hour is EqualUnmodifiableListView) return _hour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hour);
  }

  @override
  String toString() {
    return 'ForecastDay(date: $date, day: $day, hour: $hour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._hour, _hour));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    day,
    const DeepCollectionEquality().hash(_hour),
  );

  /// Create a copy of ForecastDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastDayImplCopyWith<_$ForecastDayImpl> get copyWith =>
      __$$ForecastDayImplCopyWithImpl<_$ForecastDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastDayImplToJson(this);
  }
}

abstract class _ForecastDay implements ForecastDay {
  const factory _ForecastDay({
    required final String date,
    required final Day day,
    required final List<Hour> hour,
  }) = _$ForecastDayImpl;

  factory _ForecastDay.fromJson(Map<String, dynamic> json) =
      _$ForecastDayImpl.fromJson;

  /// "YYYY-MM-DD"
  @override
  String get date;
  @override
  Day get day;
  @override
  List<Hour> get hour;

  /// Create a copy of ForecastDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastDayImplCopyWith<_$ForecastDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
mixin _$Day {
  @JsonKey(name: 'avgtemp_c')
  double? get avgTempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxtemp_c')
  double? get maxTempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'mintemp_c')
  double? get minTempC => throw _privateConstructorUsedError;
  Condition get condition => throw _privateConstructorUsedError;

  /// đôi khi WeatherAPI cũng cung cấp air_quality ở cấp day
  @JsonKey(name: 'air_quality')
  AirQuality? get airQuality => throw _privateConstructorUsedError;

  /// bạn có dùng daily_chance_of_rain trong recs
  @JsonKey(name: 'daily_chance_of_rain')
  int? get dailyChanceOfRain => throw _privateConstructorUsedError;

  /// Serializes this Day to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res, Day>;
  @useResult
  $Res call({
    @JsonKey(name: 'avgtemp_c') double? avgTempC,
    @JsonKey(name: 'maxtemp_c') double? maxTempC,
    @JsonKey(name: 'mintemp_c') double? minTempC,
    Condition condition,
    @JsonKey(name: 'air_quality') AirQuality? airQuality,
    @JsonKey(name: 'daily_chance_of_rain') int? dailyChanceOfRain,
  });

  $ConditionCopyWith<$Res> get condition;
  $AirQualityCopyWith<$Res>? get airQuality;
}

/// @nodoc
class _$DayCopyWithImpl<$Res, $Val extends Day> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgTempC = freezed,
    Object? maxTempC = freezed,
    Object? minTempC = freezed,
    Object? condition = null,
    Object? airQuality = freezed,
    Object? dailyChanceOfRain = freezed,
  }) {
    return _then(
      _value.copyWith(
            avgTempC: freezed == avgTempC
                ? _value.avgTempC
                : avgTempC // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxTempC: freezed == maxTempC
                ? _value.maxTempC
                : maxTempC // ignore: cast_nullable_to_non_nullable
                      as double?,
            minTempC: freezed == minTempC
                ? _value.minTempC
                : minTempC // ignore: cast_nullable_to_non_nullable
                      as double?,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as Condition,
            airQuality: freezed == airQuality
                ? _value.airQuality
                : airQuality // ignore: cast_nullable_to_non_nullable
                      as AirQuality?,
            dailyChanceOfRain: freezed == dailyChanceOfRain
                ? _value.dailyChanceOfRain
                : dailyChanceOfRain // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionCopyWith<$Res> get condition {
    return $ConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AirQualityCopyWith<$Res>? get airQuality {
    if (_value.airQuality == null) {
      return null;
    }

    return $AirQualityCopyWith<$Res>(_value.airQuality!, (value) {
      return _then(_value.copyWith(airQuality: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DayImplCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$DayImplCopyWith(_$DayImpl value, $Res Function(_$DayImpl) then) =
      __$$DayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'avgtemp_c') double? avgTempC,
    @JsonKey(name: 'maxtemp_c') double? maxTempC,
    @JsonKey(name: 'mintemp_c') double? minTempC,
    Condition condition,
    @JsonKey(name: 'air_quality') AirQuality? airQuality,
    @JsonKey(name: 'daily_chance_of_rain') int? dailyChanceOfRain,
  });

  @override
  $ConditionCopyWith<$Res> get condition;
  @override
  $AirQualityCopyWith<$Res>? get airQuality;
}

/// @nodoc
class __$$DayImplCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$DayImpl>
    implements _$$DayImplCopyWith<$Res> {
  __$$DayImplCopyWithImpl(_$DayImpl _value, $Res Function(_$DayImpl) _then)
    : super(_value, _then);

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgTempC = freezed,
    Object? maxTempC = freezed,
    Object? minTempC = freezed,
    Object? condition = null,
    Object? airQuality = freezed,
    Object? dailyChanceOfRain = freezed,
  }) {
    return _then(
      _$DayImpl(
        avgTempC: freezed == avgTempC
            ? _value.avgTempC
            : avgTempC // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxTempC: freezed == maxTempC
            ? _value.maxTempC
            : maxTempC // ignore: cast_nullable_to_non_nullable
                  as double?,
        minTempC: freezed == minTempC
            ? _value.minTempC
            : minTempC // ignore: cast_nullable_to_non_nullable
                  as double?,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as Condition,
        airQuality: freezed == airQuality
            ? _value.airQuality
            : airQuality // ignore: cast_nullable_to_non_nullable
                  as AirQuality?,
        dailyChanceOfRain: freezed == dailyChanceOfRain
            ? _value.dailyChanceOfRain
            : dailyChanceOfRain // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DayImpl implements _Day {
  const _$DayImpl({
    @JsonKey(name: 'avgtemp_c') this.avgTempC,
    @JsonKey(name: 'maxtemp_c') this.maxTempC,
    @JsonKey(name: 'mintemp_c') this.minTempC,
    required this.condition,
    @JsonKey(name: 'air_quality') this.airQuality,
    @JsonKey(name: 'daily_chance_of_rain') this.dailyChanceOfRain,
  });

  factory _$DayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayImplFromJson(json);

  @override
  @JsonKey(name: 'avgtemp_c')
  final double? avgTempC;
  @override
  @JsonKey(name: 'maxtemp_c')
  final double? maxTempC;
  @override
  @JsonKey(name: 'mintemp_c')
  final double? minTempC;
  @override
  final Condition condition;

  /// đôi khi WeatherAPI cũng cung cấp air_quality ở cấp day
  @override
  @JsonKey(name: 'air_quality')
  final AirQuality? airQuality;

  /// bạn có dùng daily_chance_of_rain trong recs
  @override
  @JsonKey(name: 'daily_chance_of_rain')
  final int? dailyChanceOfRain;

  @override
  String toString() {
    return 'Day(avgTempC: $avgTempC, maxTempC: $maxTempC, minTempC: $minTempC, condition: $condition, airQuality: $airQuality, dailyChanceOfRain: $dailyChanceOfRain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayImpl &&
            (identical(other.avgTempC, avgTempC) ||
                other.avgTempC == avgTempC) &&
            (identical(other.maxTempC, maxTempC) ||
                other.maxTempC == maxTempC) &&
            (identical(other.minTempC, minTempC) ||
                other.minTempC == minTempC) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.airQuality, airQuality) ||
                other.airQuality == airQuality) &&
            (identical(other.dailyChanceOfRain, dailyChanceOfRain) ||
                other.dailyChanceOfRain == dailyChanceOfRain));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    avgTempC,
    maxTempC,
    minTempC,
    condition,
    airQuality,
    dailyChanceOfRain,
  );

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayImplCopyWith<_$DayImpl> get copyWith =>
      __$$DayImplCopyWithImpl<_$DayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DayImplToJson(this);
  }
}

abstract class _Day implements Day {
  const factory _Day({
    @JsonKey(name: 'avgtemp_c') final double? avgTempC,
    @JsonKey(name: 'maxtemp_c') final double? maxTempC,
    @JsonKey(name: 'mintemp_c') final double? minTempC,
    required final Condition condition,
    @JsonKey(name: 'air_quality') final AirQuality? airQuality,
    @JsonKey(name: 'daily_chance_of_rain') final int? dailyChanceOfRain,
  }) = _$DayImpl;

  factory _Day.fromJson(Map<String, dynamic> json) = _$DayImpl.fromJson;

  @override
  @JsonKey(name: 'avgtemp_c')
  double? get avgTempC;
  @override
  @JsonKey(name: 'maxtemp_c')
  double? get maxTempC;
  @override
  @JsonKey(name: 'mintemp_c')
  double? get minTempC;
  @override
  Condition get condition;

  /// đôi khi WeatherAPI cũng cung cấp air_quality ở cấp day
  @override
  @JsonKey(name: 'air_quality')
  AirQuality? get airQuality;

  /// bạn có dùng daily_chance_of_rain trong recs
  @override
  @JsonKey(name: 'daily_chance_of_rain')
  int? get dailyChanceOfRain;

  /// Create a copy of Day
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayImplCopyWith<_$DayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hour _$HourFromJson(Map<String, dynamic> json) {
  return _Hour.fromJson(json);
}

/// @nodoc
mixin _$Hour {
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_c')
  double get tempC => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_day')
  int get isDay => throw _privateConstructorUsedError;
  Condition get condition => throw _privateConstructorUsedError;

  /// Serializes this Hour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourCopyWith<Hour> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourCopyWith<$Res> {
  factory $HourCopyWith(Hour value, $Res Function(Hour) then) =
      _$HourCopyWithImpl<$Res, Hour>;
  @useResult
  $Res call({
    String time,
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'is_day') int isDay,
    Condition condition,
  });

  $ConditionCopyWith<$Res> get condition;
}

/// @nodoc
class _$HourCopyWithImpl<$Res, $Val extends Hour>
    implements $HourCopyWith<$Res> {
  _$HourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? tempC = null,
    Object? isDay = null,
    Object? condition = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            tempC: null == tempC
                ? _value.tempC
                : tempC // ignore: cast_nullable_to_non_nullable
                      as double,
            isDay: null == isDay
                ? _value.isDay
                : isDay // ignore: cast_nullable_to_non_nullable
                      as int,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as Condition,
          )
          as $Val,
    );
  }

  /// Create a copy of Hour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionCopyWith<$Res> get condition {
    return $ConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HourImplCopyWith<$Res> implements $HourCopyWith<$Res> {
  factory _$$HourImplCopyWith(
    _$HourImpl value,
    $Res Function(_$HourImpl) then,
  ) = __$$HourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String time,
    @JsonKey(name: 'temp_c') double tempC,
    @JsonKey(name: 'is_day') int isDay,
    Condition condition,
  });

  @override
  $ConditionCopyWith<$Res> get condition;
}

/// @nodoc
class __$$HourImplCopyWithImpl<$Res>
    extends _$HourCopyWithImpl<$Res, _$HourImpl>
    implements _$$HourImplCopyWith<$Res> {
  __$$HourImplCopyWithImpl(_$HourImpl _value, $Res Function(_$HourImpl) _then)
    : super(_value, _then);

  /// Create a copy of Hour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? tempC = null,
    Object? isDay = null,
    Object? condition = null,
  }) {
    return _then(
      _$HourImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        tempC: null == tempC
            ? _value.tempC
            : tempC // ignore: cast_nullable_to_non_nullable
                  as double,
        isDay: null == isDay
            ? _value.isDay
            : isDay // ignore: cast_nullable_to_non_nullable
                  as int,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as Condition,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HourImpl implements _Hour {
  const _$HourImpl({
    required this.time,
    @JsonKey(name: 'temp_c') required this.tempC,
    @JsonKey(name: 'is_day') required this.isDay,
    required this.condition,
  });

  factory _$HourImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourImplFromJson(json);

  @override
  final String time;
  @override
  @JsonKey(name: 'temp_c')
  final double tempC;
  @override
  @JsonKey(name: 'is_day')
  final int isDay;
  @override
  final Condition condition;

  @override
  String toString() {
    return 'Hour(time: $time, tempC: $tempC, isDay: $isDay, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.tempC, tempC) || other.tempC == tempC) &&
            (identical(other.isDay, isDay) || other.isDay == isDay) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, tempC, isDay, condition);

  /// Create a copy of Hour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourImplCopyWith<_$HourImpl> get copyWith =>
      __$$HourImplCopyWithImpl<_$HourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourImplToJson(this);
  }
}

abstract class _Hour implements Hour {
  const factory _Hour({
    required final String time,
    @JsonKey(name: 'temp_c') required final double tempC,
    @JsonKey(name: 'is_day') required final int isDay,
    required final Condition condition,
  }) = _$HourImpl;

  factory _Hour.fromJson(Map<String, dynamic> json) = _$HourImpl.fromJson;

  @override
  String get time;
  @override
  @JsonKey(name: 'temp_c')
  double get tempC;
  @override
  @JsonKey(name: 'is_day')
  int get isDay;
  @override
  Condition get condition;

  /// Create a copy of Hour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourImplCopyWith<_$HourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return _Condition.fromJson(json);
}

/// @nodoc
mixin _$Condition {
  String get text => throw _privateConstructorUsedError;

  /// Serializes this Condition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionCopyWith<Condition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionCopyWith<$Res> {
  factory $ConditionCopyWith(Condition value, $Res Function(Condition) then) =
      _$ConditionCopyWithImpl<$Res, Condition>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$ConditionCopyWithImpl<$Res, $Val extends Condition>
    implements $ConditionCopyWith<$Res> {
  _$ConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConditionImplCopyWith<$Res>
    implements $ConditionCopyWith<$Res> {
  factory _$$ConditionImplCopyWith(
    _$ConditionImpl value,
    $Res Function(_$ConditionImpl) then,
  ) = __$$ConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$ConditionImplCopyWithImpl<$Res>
    extends _$ConditionCopyWithImpl<$Res, _$ConditionImpl>
    implements _$$ConditionImplCopyWith<$Res> {
  __$$ConditionImplCopyWithImpl(
    _$ConditionImpl _value,
    $Res Function(_$ConditionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$ConditionImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionImpl implements _Condition {
  const _$ConditionImpl({required this.text});

  factory _$ConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionImplFromJson(json);

  @override
  final String text;

  @override
  String toString() {
    return 'Condition(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionImplCopyWith<_$ConditionImpl> get copyWith =>
      __$$ConditionImplCopyWithImpl<_$ConditionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionImplToJson(this);
  }
}

abstract class _Condition implements Condition {
  const factory _Condition({required final String text}) = _$ConditionImpl;

  factory _Condition.fromJson(Map<String, dynamic> json) =
      _$ConditionImpl.fromJson;

  @override
  String get text;

  /// Create a copy of Condition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionImplCopyWith<_$ConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) {
  return _AirQuality.fromJson(json);
}

/// @nodoc
mixin _$AirQuality {
  double? get co => throw _privateConstructorUsedError;
  double? get no2 => throw _privateConstructorUsedError;
  double? get o3 => throw _privateConstructorUsedError;
  double? get so2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pm2_5')
  double? get pm25 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pm10')
  double? get pm10 => throw _privateConstructorUsedError;

  /// chỉ số tổng hợp
  @JsonKey(name: 'us-epa-index')
  int? get usEpaIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'gb-defra-index')
  int? get gbDefraIndex => throw _privateConstructorUsedError;

  /// Serializes this AirQuality to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AirQualityCopyWith<AirQuality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirQualityCopyWith<$Res> {
  factory $AirQualityCopyWith(
    AirQuality value,
    $Res Function(AirQuality) then,
  ) = _$AirQualityCopyWithImpl<$Res, AirQuality>;
  @useResult
  $Res call({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    @JsonKey(name: 'pm2_5') double? pm25,
    @JsonKey(name: 'pm10') double? pm10,
    @JsonKey(name: 'us-epa-index') int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') int? gbDefraIndex,
  });
}

/// @nodoc
class _$AirQualityCopyWithImpl<$Res, $Val extends AirQuality>
    implements $AirQualityCopyWith<$Res> {
  _$AirQualityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AirQuality
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
abstract class _$$AirQualityImplCopyWith<$Res>
    implements $AirQualityCopyWith<$Res> {
  factory _$$AirQualityImplCopyWith(
    _$AirQualityImpl value,
    $Res Function(_$AirQualityImpl) then,
  ) = __$$AirQualityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    @JsonKey(name: 'pm2_5') double? pm25,
    @JsonKey(name: 'pm10') double? pm10,
    @JsonKey(name: 'us-epa-index') int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') int? gbDefraIndex,
  });
}

/// @nodoc
class __$$AirQualityImplCopyWithImpl<$Res>
    extends _$AirQualityCopyWithImpl<$Res, _$AirQualityImpl>
    implements _$$AirQualityImplCopyWith<$Res> {
  __$$AirQualityImplCopyWithImpl(
    _$AirQualityImpl _value,
    $Res Function(_$AirQualityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AirQuality
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
      _$AirQualityImpl(
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
class _$AirQualityImpl implements _AirQuality {
  const _$AirQualityImpl({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    @JsonKey(name: 'pm2_5') this.pm25,
    @JsonKey(name: 'pm10') this.pm10,
    @JsonKey(name: 'us-epa-index') this.usEpaIndex,
    @JsonKey(name: 'gb-defra-index') this.gbDefraIndex,
  });

  factory _$AirQualityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirQualityImplFromJson(json);

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
  @JsonKey(name: 'pm10')
  final double? pm10;

  /// chỉ số tổng hợp
  @override
  @JsonKey(name: 'us-epa-index')
  final int? usEpaIndex;
  @override
  @JsonKey(name: 'gb-defra-index')
  final int? gbDefraIndex;

  @override
  String toString() {
    return 'AirQuality(co: $co, no2: $no2, o3: $o3, so2: $so2, pm25: $pm25, pm10: $pm10, usEpaIndex: $usEpaIndex, gbDefraIndex: $gbDefraIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirQualityImpl &&
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

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AirQualityImplCopyWith<_$AirQualityImpl> get copyWith =>
      __$$AirQualityImplCopyWithImpl<_$AirQualityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirQualityImplToJson(this);
  }
}

abstract class _AirQuality implements AirQuality {
  const factory _AirQuality({
    final double? co,
    final double? no2,
    final double? o3,
    final double? so2,
    @JsonKey(name: 'pm2_5') final double? pm25,
    @JsonKey(name: 'pm10') final double? pm10,
    @JsonKey(name: 'us-epa-index') final int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') final int? gbDefraIndex,
  }) = _$AirQualityImpl;

  factory _AirQuality.fromJson(Map<String, dynamic> json) =
      _$AirQualityImpl.fromJson;

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
  @JsonKey(name: 'pm10')
  double? get pm10;

  /// chỉ số tổng hợp
  @override
  @JsonKey(name: 'us-epa-index')
  int? get usEpaIndex;
  @override
  @JsonKey(name: 'gb-defra-index')
  int? get gbDefraIndex;

  /// Create a copy of AirQuality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AirQualityImplCopyWith<_$AirQualityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
