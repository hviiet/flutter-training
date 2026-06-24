// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherModel {

 DateTime get localTime; String get location; double get temp_c; double get feelslike_c; String get conditionText; String get conditionIcon; List<WeatherForecastModel> get forecast; List<WeatherHourModel> get hourlyForecast;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.localTime, localTime) || other.localTime == localTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.temp_c, temp_c) || other.temp_c == temp_c)&&(identical(other.feelslike_c, feelslike_c) || other.feelslike_c == feelslike_c)&&(identical(other.conditionText, conditionText) || other.conditionText == conditionText)&&(identical(other.conditionIcon, conditionIcon) || other.conditionIcon == conditionIcon)&&const DeepCollectionEquality().equals(other.forecast, forecast)&&const DeepCollectionEquality().equals(other.hourlyForecast, hourlyForecast));
}


@override
int get hashCode => Object.hash(runtimeType,localTime,location,temp_c,feelslike_c,conditionText,conditionIcon,const DeepCollectionEquality().hash(forecast),const DeepCollectionEquality().hash(hourlyForecast));

@override
String toString() {
  return 'WeatherModel(localTime: $localTime, location: $location, temp_c: $temp_c, feelslike_c: $feelslike_c, conditionText: $conditionText, conditionIcon: $conditionIcon, forecast: $forecast, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 DateTime localTime, String location, double temp_c, double feelslike_c, String conditionText, String conditionIcon, List<WeatherForecastModel> forecast, List<WeatherHourModel> hourlyForecast
});




}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localTime = null,Object? location = null,Object? temp_c = null,Object? feelslike_c = null,Object? conditionText = null,Object? conditionIcon = null,Object? forecast = null,Object? hourlyForecast = null,}) {
  return _then(_self.copyWith(
localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,temp_c: null == temp_c ? _self.temp_c : temp_c // ignore: cast_nullable_to_non_nullable
as double,feelslike_c: null == feelslike_c ? _self.feelslike_c : feelslike_c // ignore: cast_nullable_to_non_nullable
as double,conditionText: null == conditionText ? _self.conditionText : conditionText // ignore: cast_nullable_to_non_nullable
as String,conditionIcon: null == conditionIcon ? _self.conditionIcon : conditionIcon // ignore: cast_nullable_to_non_nullable
as String,forecast: null == forecast ? _self.forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<WeatherForecastModel>,hourlyForecast: null == hourlyForecast ? _self.hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<WeatherHourModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime localTime,  String location,  double temp_c,  double feelslike_c,  String conditionText,  String conditionIcon,  List<WeatherForecastModel> forecast,  List<WeatherHourModel> hourlyForecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.localTime,_that.location,_that.temp_c,_that.feelslike_c,_that.conditionText,_that.conditionIcon,_that.forecast,_that.hourlyForecast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime localTime,  String location,  double temp_c,  double feelslike_c,  String conditionText,  String conditionIcon,  List<WeatherForecastModel> forecast,  List<WeatherHourModel> hourlyForecast)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.localTime,_that.location,_that.temp_c,_that.feelslike_c,_that.conditionText,_that.conditionIcon,_that.forecast,_that.hourlyForecast);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime localTime,  String location,  double temp_c,  double feelslike_c,  String conditionText,  String conditionIcon,  List<WeatherForecastModel> forecast,  List<WeatherHourModel> hourlyForecast)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.localTime,_that.location,_that.temp_c,_that.feelslike_c,_that.conditionText,_that.conditionIcon,_that.forecast,_that.hourlyForecast);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherModel implements WeatherModel {
  const _WeatherModel({required this.localTime, required this.location, required this.temp_c, required this.feelslike_c, required this.conditionText, required this.conditionIcon, required final  List<WeatherForecastModel> forecast, required final  List<WeatherHourModel> hourlyForecast}): _forecast = forecast,_hourlyForecast = hourlyForecast;
  

@override final  DateTime localTime;
@override final  String location;
@override final  double temp_c;
@override final  double feelslike_c;
@override final  String conditionText;
@override final  String conditionIcon;
 final  List<WeatherForecastModel> _forecast;
@override List<WeatherForecastModel> get forecast {
  if (_forecast is EqualUnmodifiableListView) return _forecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forecast);
}

 final  List<WeatherHourModel> _hourlyForecast;
@override List<WeatherHourModel> get hourlyForecast {
  if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyForecast);
}


/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.localTime, localTime) || other.localTime == localTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.temp_c, temp_c) || other.temp_c == temp_c)&&(identical(other.feelslike_c, feelslike_c) || other.feelslike_c == feelslike_c)&&(identical(other.conditionText, conditionText) || other.conditionText == conditionText)&&(identical(other.conditionIcon, conditionIcon) || other.conditionIcon == conditionIcon)&&const DeepCollectionEquality().equals(other._forecast, _forecast)&&const DeepCollectionEquality().equals(other._hourlyForecast, _hourlyForecast));
}


@override
int get hashCode => Object.hash(runtimeType,localTime,location,temp_c,feelslike_c,conditionText,conditionIcon,const DeepCollectionEquality().hash(_forecast),const DeepCollectionEquality().hash(_hourlyForecast));

@override
String toString() {
  return 'WeatherModel(localTime: $localTime, location: $location, temp_c: $temp_c, feelslike_c: $feelslike_c, conditionText: $conditionText, conditionIcon: $conditionIcon, forecast: $forecast, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime localTime, String location, double temp_c, double feelslike_c, String conditionText, String conditionIcon, List<WeatherForecastModel> forecast, List<WeatherHourModel> hourlyForecast
});




}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localTime = null,Object? location = null,Object? temp_c = null,Object? feelslike_c = null,Object? conditionText = null,Object? conditionIcon = null,Object? forecast = null,Object? hourlyForecast = null,}) {
  return _then(_WeatherModel(
localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,temp_c: null == temp_c ? _self.temp_c : temp_c // ignore: cast_nullable_to_non_nullable
as double,feelslike_c: null == feelslike_c ? _self.feelslike_c : feelslike_c // ignore: cast_nullable_to_non_nullable
as double,conditionText: null == conditionText ? _self.conditionText : conditionText // ignore: cast_nullable_to_non_nullable
as String,conditionIcon: null == conditionIcon ? _self.conditionIcon : conditionIcon // ignore: cast_nullable_to_non_nullable
as String,forecast: null == forecast ? _self._forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<WeatherForecastModel>,hourlyForecast: null == hourlyForecast ? _self._hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<WeatherHourModel>,
  ));
}


}

// dart format on
