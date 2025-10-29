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

/// @nodoc
mixin _$WeatherData {
  double get currentTemp => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  double get feelsLike => throw _privateConstructorUsedError;
  List<HourlyForecast> get hourlyForecast => throw _privateConstructorUsedError;
  List<DailyForecast> get dailyForecast => throw _privateConstructorUsedError;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
    WeatherData value,
    $Res Function(WeatherData) then,
  ) = _$WeatherDataCopyWithImpl<$Res, WeatherData>;
  @useResult
  $Res call({
    double currentTemp,
    String condition,
    double feelsLike,
    List<HourlyForecast> hourlyForecast,
    List<DailyForecast> dailyForecast,
  });
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res, $Val extends WeatherData>
    implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTemp = null,
    Object? condition = null,
    Object? feelsLike = null,
    Object? hourlyForecast = null,
    Object? dailyForecast = null,
  }) {
    return _then(
      _value.copyWith(
            currentTemp: null == currentTemp
                ? _value.currentTemp
                : currentTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
            feelsLike: null == feelsLike
                ? _value.feelsLike
                : feelsLike // ignore: cast_nullable_to_non_nullable
                      as double,
            hourlyForecast: null == hourlyForecast
                ? _value.hourlyForecast
                : hourlyForecast // ignore: cast_nullable_to_non_nullable
                      as List<HourlyForecast>,
            dailyForecast: null == dailyForecast
                ? _value.dailyForecast
                : dailyForecast // ignore: cast_nullable_to_non_nullable
                      as List<DailyForecast>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherDataImplCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$$WeatherDataImplCopyWith(
    _$WeatherDataImpl value,
    $Res Function(_$WeatherDataImpl) then,
  ) = __$$WeatherDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double currentTemp,
    String condition,
    double feelsLike,
    List<HourlyForecast> hourlyForecast,
    List<DailyForecast> dailyForecast,
  });
}

/// @nodoc
class __$$WeatherDataImplCopyWithImpl<$Res>
    extends _$WeatherDataCopyWithImpl<$Res, _$WeatherDataImpl>
    implements _$$WeatherDataImplCopyWith<$Res> {
  __$$WeatherDataImplCopyWithImpl(
    _$WeatherDataImpl _value,
    $Res Function(_$WeatherDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTemp = null,
    Object? condition = null,
    Object? feelsLike = null,
    Object? hourlyForecast = null,
    Object? dailyForecast = null,
  }) {
    return _then(
      _$WeatherDataImpl(
        currentTemp: null == currentTemp
            ? _value.currentTemp
            : currentTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
        feelsLike: null == feelsLike
            ? _value.feelsLike
            : feelsLike // ignore: cast_nullable_to_non_nullable
                  as double,
        hourlyForecast: null == hourlyForecast
            ? _value._hourlyForecast
            : hourlyForecast // ignore: cast_nullable_to_non_nullable
                  as List<HourlyForecast>,
        dailyForecast: null == dailyForecast
            ? _value._dailyForecast
            : dailyForecast // ignore: cast_nullable_to_non_nullable
                  as List<DailyForecast>,
      ),
    );
  }
}

/// @nodoc

class _$WeatherDataImpl implements _WeatherData {
  const _$WeatherDataImpl({
    required this.currentTemp,
    required this.condition,
    required this.feelsLike,
    required final List<HourlyForecast> hourlyForecast,
    required final List<DailyForecast> dailyForecast,
  }) : _hourlyForecast = hourlyForecast,
       _dailyForecast = dailyForecast;

  @override
  final double currentTemp;
  @override
  final String condition;
  @override
  final double feelsLike;
  final List<HourlyForecast> _hourlyForecast;
  @override
  List<HourlyForecast> get hourlyForecast {
    if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecast);
  }

  final List<DailyForecast> _dailyForecast;
  @override
  List<DailyForecast> get dailyForecast {
    if (_dailyForecast is EqualUnmodifiableListView) return _dailyForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyForecast);
  }

  @override
  String toString() {
    return 'WeatherData(currentTemp: $currentTemp, condition: $condition, feelsLike: $feelsLike, hourlyForecast: $hourlyForecast, dailyForecast: $dailyForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataImpl &&
            (identical(other.currentTemp, currentTemp) ||
                other.currentTemp == currentTemp) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            const DeepCollectionEquality().equals(
              other._hourlyForecast,
              _hourlyForecast,
            ) &&
            const DeepCollectionEquality().equals(
              other._dailyForecast,
              _dailyForecast,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentTemp,
    condition,
    feelsLike,
    const DeepCollectionEquality().hash(_hourlyForecast),
    const DeepCollectionEquality().hash(_dailyForecast),
  );

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      __$$WeatherDataImplCopyWithImpl<_$WeatherDataImpl>(this, _$identity);
}

abstract class _WeatherData implements WeatherData {
  const factory _WeatherData({
    required final double currentTemp,
    required final String condition,
    required final double feelsLike,
    required final List<HourlyForecast> hourlyForecast,
    required final List<DailyForecast> dailyForecast,
  }) = _$WeatherDataImpl;

  @override
  double get currentTemp;
  @override
  String get condition;
  @override
  double get feelsLike;
  @override
  List<HourlyForecast> get hourlyForecast;
  @override
  List<DailyForecast> get dailyForecast;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HourlyForecast {
  String get time => throw _privateConstructorUsedError;
  double get temp => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyForecastCopyWith<HourlyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyForecastCopyWith<$Res> {
  factory $HourlyForecastCopyWith(
    HourlyForecast value,
    $Res Function(HourlyForecast) then,
  ) = _$HourlyForecastCopyWithImpl<$Res, HourlyForecast>;
  @useResult
  $Res call({String time, double temp, String condition});
}

/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res, $Val extends HourlyForecast>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temp = null,
    Object? condition = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            temp: null == temp
                ? _value.temp
                : temp // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HourlyForecastImplCopyWith<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  factory _$$HourlyForecastImplCopyWith(
    _$HourlyForecastImpl value,
    $Res Function(_$HourlyForecastImpl) then,
  ) = __$$HourlyForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, double temp, String condition});
}

/// @nodoc
class __$$HourlyForecastImplCopyWithImpl<$Res>
    extends _$HourlyForecastCopyWithImpl<$Res, _$HourlyForecastImpl>
    implements _$$HourlyForecastImplCopyWith<$Res> {
  __$$HourlyForecastImplCopyWithImpl(
    _$HourlyForecastImpl _value,
    $Res Function(_$HourlyForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temp = null,
    Object? condition = null,
  }) {
    return _then(
      _$HourlyForecastImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        temp: null == temp
            ? _value.temp
            : temp // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HourlyForecastImpl implements _HourlyForecast {
  const _$HourlyForecastImpl({
    required this.time,
    required this.temp,
    required this.condition,
  });

  @override
  final String time;
  @override
  final double temp;
  @override
  final String condition;

  @override
  String toString() {
    return 'HourlyForecast(time: $time, temp: $temp, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyForecastImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, temp, condition);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      __$$HourlyForecastImplCopyWithImpl<_$HourlyForecastImpl>(
        this,
        _$identity,
      );
}

abstract class _HourlyForecast implements HourlyForecast {
  const factory _HourlyForecast({
    required final String time,
    required final double temp,
    required final String condition,
  }) = _$HourlyForecastImpl;

  @override
  String get time;
  @override
  double get temp;
  @override
  String get condition;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyForecast {
  String get date => throw _privateConstructorUsedError;
  double get maxTemp => throw _privateConstructorUsedError;
  double get minTemp => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyForecastCopyWith<DailyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyForecastCopyWith<$Res> {
  factory $DailyForecastCopyWith(
    DailyForecast value,
    $Res Function(DailyForecast) then,
  ) = _$DailyForecastCopyWithImpl<$Res, DailyForecast>;
  @useResult
  $Res call({String date, double maxTemp, double minTemp, String condition});
}

/// @nodoc
class _$DailyForecastCopyWithImpl<$Res, $Val extends DailyForecast>
    implements $DailyForecastCopyWith<$Res> {
  _$DailyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? maxTemp = null,
    Object? minTemp = null,
    Object? condition = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            maxTemp: null == maxTemp
                ? _value.maxTemp
                : maxTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            minTemp: null == minTemp
                ? _value.minTemp
                : minTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyForecastImplCopyWith<$Res>
    implements $DailyForecastCopyWith<$Res> {
  factory _$$DailyForecastImplCopyWith(
    _$DailyForecastImpl value,
    $Res Function(_$DailyForecastImpl) then,
  ) = __$$DailyForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, double maxTemp, double minTemp, String condition});
}

/// @nodoc
class __$$DailyForecastImplCopyWithImpl<$Res>
    extends _$DailyForecastCopyWithImpl<$Res, _$DailyForecastImpl>
    implements _$$DailyForecastImplCopyWith<$Res> {
  __$$DailyForecastImplCopyWithImpl(
    _$DailyForecastImpl _value,
    $Res Function(_$DailyForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? maxTemp = null,
    Object? minTemp = null,
    Object? condition = null,
  }) {
    return _then(
      _$DailyForecastImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        maxTemp: null == maxTemp
            ? _value.maxTemp
            : maxTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        minTemp: null == minTemp
            ? _value.minTemp
            : minTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DailyForecastImpl implements _DailyForecast {
  const _$DailyForecastImpl({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  @override
  final String date;
  @override
  final double maxTemp;
  @override
  final double minTemp;
  @override
  final String condition;

  @override
  String toString() {
    return 'DailyForecast(date: $date, maxTemp: $maxTemp, minTemp: $minTemp, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyForecastImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, date, maxTemp, minTemp, condition);

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyForecastImplCopyWith<_$DailyForecastImpl> get copyWith =>
      __$$DailyForecastImplCopyWithImpl<_$DailyForecastImpl>(this, _$identity);
}

abstract class _DailyForecast implements DailyForecast {
  const factory _DailyForecast({
    required final String date,
    required final double maxTemp,
    required final double minTemp,
    required final String condition,
  }) = _$DailyForecastImpl;

  @override
  String get date;
  @override
  double get maxTemp;
  @override
  double get minTemp;
  @override
  String get condition;

  /// Create a copy of DailyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyForecastImplCopyWith<_$DailyForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
