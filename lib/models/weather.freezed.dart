// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherHour {

 String get time; double get temperature; String get condition; String get iconUrl;
/// Create a copy of WeatherHour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherHourCopyWith<WeatherHour> get copyWith => _$WeatherHourCopyWithImpl<WeatherHour>(this as WeatherHour, _$identity);

  /// Serializes this WeatherHour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherHour&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temperature,condition,iconUrl);

@override
String toString() {
  return 'WeatherHour(time: $time, temperature: $temperature, condition: $condition, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $WeatherHourCopyWith<$Res>  {
  factory $WeatherHourCopyWith(WeatherHour value, $Res Function(WeatherHour) _then) = _$WeatherHourCopyWithImpl;
@useResult
$Res call({
 String time, double temperature, String condition, String iconUrl
});




}
/// @nodoc
class _$WeatherHourCopyWithImpl<$Res>
    implements $WeatherHourCopyWith<$Res> {
  _$WeatherHourCopyWithImpl(this._self, this._then);

  final WeatherHour _self;
  final $Res Function(WeatherHour) _then;

/// Create a copy of WeatherHour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temperature = null,Object? condition = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherHour].
extension WeatherHourPatterns on WeatherHour {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherHour value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherHour() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherHour value)  $default,){
final _that = this;
switch (_that) {
case _WeatherHour():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherHour value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherHour() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  double temperature,  String condition,  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherHour() when $default != null:
return $default(_that.time,_that.temperature,_that.condition,_that.iconUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  double temperature,  String condition,  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _WeatherHour():
return $default(_that.time,_that.temperature,_that.condition,_that.iconUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  double temperature,  String condition,  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _WeatherHour() when $default != null:
return $default(_that.time,_that.temperature,_that.condition,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherHour implements WeatherHour {
  const _WeatherHour({required this.time, required this.temperature, required this.condition, required this.iconUrl});
  factory _WeatherHour.fromJson(Map<String, dynamic> json) => _$WeatherHourFromJson(json);

@override final  String time;
@override final  double temperature;
@override final  String condition;
@override final  String iconUrl;

/// Create a copy of WeatherHour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherHourCopyWith<_WeatherHour> get copyWith => __$WeatherHourCopyWithImpl<_WeatherHour>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherHourToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherHour&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temperature,condition,iconUrl);

@override
String toString() {
  return 'WeatherHour(time: $time, temperature: $temperature, condition: $condition, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$WeatherHourCopyWith<$Res> implements $WeatherHourCopyWith<$Res> {
  factory _$WeatherHourCopyWith(_WeatherHour value, $Res Function(_WeatherHour) _then) = __$WeatherHourCopyWithImpl;
@override @useResult
$Res call({
 String time, double temperature, String condition, String iconUrl
});




}
/// @nodoc
class __$WeatherHourCopyWithImpl<$Res>
    implements _$WeatherHourCopyWith<$Res> {
  __$WeatherHourCopyWithImpl(this._self, this._then);

  final _WeatherHour _self;
  final $Res Function(_WeatherHour) _then;

/// Create a copy of WeatherHour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temperature = null,Object? condition = null,Object? iconUrl = null,}) {
  return _then(_WeatherHour(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WeatherDay {

 String get date; double get maxTemp; double get minTemp; String get condition; String get iconUrl;
/// Create a copy of WeatherDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherDayCopyWith<WeatherDay> get copyWith => _$WeatherDayCopyWithImpl<WeatherDay>(this as WeatherDay, _$identity);

  /// Serializes this WeatherDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherDay&&(identical(other.date, date) || other.date == date)&&(identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp)&&(identical(other.minTemp, minTemp) || other.minTemp == minTemp)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,maxTemp,minTemp,condition,iconUrl);

@override
String toString() {
  return 'WeatherDay(date: $date, maxTemp: $maxTemp, minTemp: $minTemp, condition: $condition, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $WeatherDayCopyWith<$Res>  {
  factory $WeatherDayCopyWith(WeatherDay value, $Res Function(WeatherDay) _then) = _$WeatherDayCopyWithImpl;
@useResult
$Res call({
 String date, double maxTemp, double minTemp, String condition, String iconUrl
});




}
/// @nodoc
class _$WeatherDayCopyWithImpl<$Res>
    implements $WeatherDayCopyWith<$Res> {
  _$WeatherDayCopyWithImpl(this._self, this._then);

  final WeatherDay _self;
  final $Res Function(WeatherDay) _then;

/// Create a copy of WeatherDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? maxTemp = null,Object? minTemp = null,Object? condition = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,maxTemp: null == maxTemp ? _self.maxTemp : maxTemp // ignore: cast_nullable_to_non_nullable
as double,minTemp: null == minTemp ? _self.minTemp : minTemp // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherDay].
extension WeatherDayPatterns on WeatherDay {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherDay() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherDay value)  $default,){
final _that = this;
switch (_that) {
case _WeatherDay():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherDay value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherDay() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double maxTemp,  double minTemp,  String condition,  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherDay() when $default != null:
return $default(_that.date,_that.maxTemp,_that.minTemp,_that.condition,_that.iconUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double maxTemp,  double minTemp,  String condition,  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _WeatherDay():
return $default(_that.date,_that.maxTemp,_that.minTemp,_that.condition,_that.iconUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double maxTemp,  double minTemp,  String condition,  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _WeatherDay() when $default != null:
return $default(_that.date,_that.maxTemp,_that.minTemp,_that.condition,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherDay implements WeatherDay {
  const _WeatherDay({required this.date, required this.maxTemp, required this.minTemp, required this.condition, required this.iconUrl});
  factory _WeatherDay.fromJson(Map<String, dynamic> json) => _$WeatherDayFromJson(json);

@override final  String date;
@override final  double maxTemp;
@override final  double minTemp;
@override final  String condition;
@override final  String iconUrl;

/// Create a copy of WeatherDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherDayCopyWith<_WeatherDay> get copyWith => __$WeatherDayCopyWithImpl<_WeatherDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherDay&&(identical(other.date, date) || other.date == date)&&(identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp)&&(identical(other.minTemp, minTemp) || other.minTemp == minTemp)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,maxTemp,minTemp,condition,iconUrl);

@override
String toString() {
  return 'WeatherDay(date: $date, maxTemp: $maxTemp, minTemp: $minTemp, condition: $condition, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$WeatherDayCopyWith<$Res> implements $WeatherDayCopyWith<$Res> {
  factory _$WeatherDayCopyWith(_WeatherDay value, $Res Function(_WeatherDay) _then) = __$WeatherDayCopyWithImpl;
@override @useResult
$Res call({
 String date, double maxTemp, double minTemp, String condition, String iconUrl
});




}
/// @nodoc
class __$WeatherDayCopyWithImpl<$Res>
    implements _$WeatherDayCopyWith<$Res> {
  __$WeatherDayCopyWithImpl(this._self, this._then);

  final _WeatherDay _self;
  final $Res Function(_WeatherDay) _then;

/// Create a copy of WeatherDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? maxTemp = null,Object? minTemp = null,Object? condition = null,Object? iconUrl = null,}) {
  return _then(_WeatherDay(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,maxTemp: null == maxTemp ? _self.maxTemp : maxTemp // ignore: cast_nullable_to_non_nullable
as double,minTemp: null == minTemp ? _self.minTemp : minTemp // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Weather {

 String get locationName; String get region; double get temperature; double get feelsLike; String get condition; String get iconUrl; List<WeatherDay> get forecast; List<WeatherHour> get hourlyForecast;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.region, region) || other.region == region)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other.forecast, forecast)&&const DeepCollectionEquality().equals(other.hourlyForecast, hourlyForecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationName,region,temperature,feelsLike,condition,iconUrl,const DeepCollectionEquality().hash(forecast),const DeepCollectionEquality().hash(hourlyForecast));

@override
String toString() {
  return 'Weather(locationName: $locationName, region: $region, temperature: $temperature, feelsLike: $feelsLike, condition: $condition, iconUrl: $iconUrl, forecast: $forecast, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
 String locationName, String region, double temperature, double feelsLike, String condition, String iconUrl, List<WeatherDay> forecast, List<WeatherHour> hourlyForecast
});




}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationName = null,Object? region = null,Object? temperature = null,Object? feelsLike = null,Object? condition = null,Object? iconUrl = null,Object? forecast = null,Object? hourlyForecast = null,}) {
  return _then(_self.copyWith(
locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,forecast: null == forecast ? _self.forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<WeatherDay>,hourlyForecast: null == hourlyForecast ? _self.hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<WeatherHour>,
  ));
}

}


/// Adds pattern-matching-related methods to [Weather].
extension WeatherPatterns on Weather {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Weather value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Weather value)  $default,){
final _that = this;
switch (_that) {
case _Weather():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Weather value)?  $default,){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String locationName,  String region,  double temperature,  double feelsLike,  String condition,  String iconUrl,  List<WeatherDay> forecast,  List<WeatherHour> hourlyForecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.locationName,_that.region,_that.temperature,_that.feelsLike,_that.condition,_that.iconUrl,_that.forecast,_that.hourlyForecast);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String locationName,  String region,  double temperature,  double feelsLike,  String condition,  String iconUrl,  List<WeatherDay> forecast,  List<WeatherHour> hourlyForecast)  $default,) {final _that = this;
switch (_that) {
case _Weather():
return $default(_that.locationName,_that.region,_that.temperature,_that.feelsLike,_that.condition,_that.iconUrl,_that.forecast,_that.hourlyForecast);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String locationName,  String region,  double temperature,  double feelsLike,  String condition,  String iconUrl,  List<WeatherDay> forecast,  List<WeatherHour> hourlyForecast)?  $default,) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.locationName,_that.region,_that.temperature,_that.feelsLike,_that.condition,_that.iconUrl,_that.forecast,_that.hourlyForecast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Weather implements Weather {
  const _Weather({required this.locationName, required this.region, required this.temperature, required this.feelsLike, required this.condition, required this.iconUrl, required final  List<WeatherDay> forecast, required final  List<WeatherHour> hourlyForecast}): _forecast = forecast,_hourlyForecast = hourlyForecast;
  factory _Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

@override final  String locationName;
@override final  String region;
@override final  double temperature;
@override final  double feelsLike;
@override final  String condition;
@override final  String iconUrl;
 final  List<WeatherDay> _forecast;
@override List<WeatherDay> get forecast {
  if (_forecast is EqualUnmodifiableListView) return _forecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forecast);
}

 final  List<WeatherHour> _hourlyForecast;
@override List<WeatherHour> get hourlyForecast {
  if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyForecast);
}


/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.region, region) || other.region == region)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other._forecast, _forecast)&&const DeepCollectionEquality().equals(other._hourlyForecast, _hourlyForecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationName,region,temperature,feelsLike,condition,iconUrl,const DeepCollectionEquality().hash(_forecast),const DeepCollectionEquality().hash(_hourlyForecast));

@override
String toString() {
  return 'Weather(locationName: $locationName, region: $region, temperature: $temperature, feelsLike: $feelsLike, condition: $condition, iconUrl: $iconUrl, forecast: $forecast, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
 String locationName, String region, double temperature, double feelsLike, String condition, String iconUrl, List<WeatherDay> forecast, List<WeatherHour> hourlyForecast
});




}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationName = null,Object? region = null,Object? temperature = null,Object? feelsLike = null,Object? condition = null,Object? iconUrl = null,Object? forecast = null,Object? hourlyForecast = null,}) {
  return _then(_Weather(
locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,forecast: null == forecast ? _self._forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<WeatherDay>,hourlyForecast: null == hourlyForecast ? _self._hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<WeatherHour>,
  ));
}


}

// dart format on
