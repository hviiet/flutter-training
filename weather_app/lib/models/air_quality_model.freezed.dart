// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AirQualityModel {

 double get aqi; double get o3; double get pm10; double get co; double get no2; double get so2; double get pm25; List<AqiForecastModel> get forecast;
/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityModelCopyWith<AirQualityModel> get copyWith => _$AirQualityModelCopyWithImpl<AirQualityModel>(this as AirQualityModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityModel&&(identical(other.aqi, aqi) || other.aqi == aqi)&&(identical(other.o3, o3) || other.o3 == o3)&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.co, co) || other.co == co)&&(identical(other.no2, no2) || other.no2 == no2)&&(identical(other.so2, so2) || other.so2 == so2)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&const DeepCollectionEquality().equals(other.forecast, forecast));
}


@override
int get hashCode => Object.hash(runtimeType,aqi,o3,pm10,co,no2,so2,pm25,const DeepCollectionEquality().hash(forecast));

@override
String toString() {
  return 'AirQualityModel(aqi: $aqi, o3: $o3, pm10: $pm10, co: $co, no2: $no2, so2: $so2, pm25: $pm25, forecast: $forecast)';
}


}

/// @nodoc
abstract mixin class $AirQualityModelCopyWith<$Res>  {
  factory $AirQualityModelCopyWith(AirQualityModel value, $Res Function(AirQualityModel) _then) = _$AirQualityModelCopyWithImpl;
@useResult
$Res call({
 double aqi, double o3, double pm10, double co, double no2, double so2, double pm25, List<AqiForecastModel> forecast
});




}
/// @nodoc
class _$AirQualityModelCopyWithImpl<$Res>
    implements $AirQualityModelCopyWith<$Res> {
  _$AirQualityModelCopyWithImpl(this._self, this._then);

  final AirQualityModel _self;
  final $Res Function(AirQualityModel) _then;

/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aqi = null,Object? o3 = null,Object? pm10 = null,Object? co = null,Object? no2 = null,Object? so2 = null,Object? pm25 = null,Object? forecast = null,}) {
  return _then(_self.copyWith(
aqi: null == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as double,o3: null == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as double,pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,co: null == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as double,no2: null == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as double,so2: null == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as double,pm25: null == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double,forecast: null == forecast ? _self.forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<AqiForecastModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQualityModel].
extension AirQualityModelPatterns on AirQualityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityModel value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityModel value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double aqi,  double o3,  double pm10,  double co,  double no2,  double so2,  double pm25,  List<AqiForecastModel> forecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
return $default(_that.aqi,_that.o3,_that.pm10,_that.co,_that.no2,_that.so2,_that.pm25,_that.forecast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double aqi,  double o3,  double pm10,  double co,  double no2,  double so2,  double pm25,  List<AqiForecastModel> forecast)  $default,) {final _that = this;
switch (_that) {
case _AirQualityModel():
return $default(_that.aqi,_that.o3,_that.pm10,_that.co,_that.no2,_that.so2,_that.pm25,_that.forecast);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double aqi,  double o3,  double pm10,  double co,  double no2,  double so2,  double pm25,  List<AqiForecastModel> forecast)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
return $default(_that.aqi,_that.o3,_that.pm10,_that.co,_that.no2,_that.so2,_that.pm25,_that.forecast);case _:
  return null;

}
}

}

/// @nodoc


class _AirQualityModel implements AirQualityModel {
  const _AirQualityModel({required this.aqi, required this.o3, required this.pm10, required this.co, required this.no2, required this.so2, required this.pm25, required final  List<AqiForecastModel> forecast}): _forecast = forecast;
  

@override final  double aqi;
@override final  double o3;
@override final  double pm10;
@override final  double co;
@override final  double no2;
@override final  double so2;
@override final  double pm25;
 final  List<AqiForecastModel> _forecast;
@override List<AqiForecastModel> get forecast {
  if (_forecast is EqualUnmodifiableListView) return _forecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forecast);
}


/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityModelCopyWith<_AirQualityModel> get copyWith => __$AirQualityModelCopyWithImpl<_AirQualityModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityModel&&(identical(other.aqi, aqi) || other.aqi == aqi)&&(identical(other.o3, o3) || other.o3 == o3)&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.co, co) || other.co == co)&&(identical(other.no2, no2) || other.no2 == no2)&&(identical(other.so2, so2) || other.so2 == so2)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&const DeepCollectionEquality().equals(other._forecast, _forecast));
}


@override
int get hashCode => Object.hash(runtimeType,aqi,o3,pm10,co,no2,so2,pm25,const DeepCollectionEquality().hash(_forecast));

@override
String toString() {
  return 'AirQualityModel(aqi: $aqi, o3: $o3, pm10: $pm10, co: $co, no2: $no2, so2: $so2, pm25: $pm25, forecast: $forecast)';
}


}

/// @nodoc
abstract mixin class _$AirQualityModelCopyWith<$Res> implements $AirQualityModelCopyWith<$Res> {
  factory _$AirQualityModelCopyWith(_AirQualityModel value, $Res Function(_AirQualityModel) _then) = __$AirQualityModelCopyWithImpl;
@override @useResult
$Res call({
 double aqi, double o3, double pm10, double co, double no2, double so2, double pm25, List<AqiForecastModel> forecast
});




}
/// @nodoc
class __$AirQualityModelCopyWithImpl<$Res>
    implements _$AirQualityModelCopyWith<$Res> {
  __$AirQualityModelCopyWithImpl(this._self, this._then);

  final _AirQualityModel _self;
  final $Res Function(_AirQualityModel) _then;

/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aqi = null,Object? o3 = null,Object? pm10 = null,Object? co = null,Object? no2 = null,Object? so2 = null,Object? pm25 = null,Object? forecast = null,}) {
  return _then(_AirQualityModel(
aqi: null == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as double,o3: null == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as double,pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,co: null == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as double,no2: null == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as double,so2: null == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as double,pm25: null == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double,forecast: null == forecast ? _self._forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<AqiForecastModel>,
  ));
}


}

/// @nodoc
mixin _$AqiForecastModel {

 DateTime get day; double get avg;
/// Create a copy of AqiForecastModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AqiForecastModelCopyWith<AqiForecastModel> get copyWith => _$AqiForecastModelCopyWithImpl<AqiForecastModel>(this as AqiForecastModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AqiForecastModel&&(identical(other.day, day) || other.day == day)&&(identical(other.avg, avg) || other.avg == avg));
}


@override
int get hashCode => Object.hash(runtimeType,day,avg);

@override
String toString() {
  return 'AqiForecastModel(day: $day, avg: $avg)';
}


}

/// @nodoc
abstract mixin class $AqiForecastModelCopyWith<$Res>  {
  factory $AqiForecastModelCopyWith(AqiForecastModel value, $Res Function(AqiForecastModel) _then) = _$AqiForecastModelCopyWithImpl;
@useResult
$Res call({
 DateTime day, double avg
});




}
/// @nodoc
class _$AqiForecastModelCopyWithImpl<$Res>
    implements $AqiForecastModelCopyWith<$Res> {
  _$AqiForecastModelCopyWithImpl(this._self, this._then);

  final AqiForecastModel _self;
  final $Res Function(AqiForecastModel) _then;

/// Create a copy of AqiForecastModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? avg = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,avg: null == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AqiForecastModel].
extension AqiForecastModelPatterns on AqiForecastModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AqiForecastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AqiForecastModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AqiForecastModel value)  $default,){
final _that = this;
switch (_that) {
case _AqiForecastModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AqiForecastModel value)?  $default,){
final _that = this;
switch (_that) {
case _AqiForecastModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime day,  double avg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AqiForecastModel() when $default != null:
return $default(_that.day,_that.avg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime day,  double avg)  $default,) {final _that = this;
switch (_that) {
case _AqiForecastModel():
return $default(_that.day,_that.avg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime day,  double avg)?  $default,) {final _that = this;
switch (_that) {
case _AqiForecastModel() when $default != null:
return $default(_that.day,_that.avg);case _:
  return null;

}
}

}

/// @nodoc


class _AqiForecastModel implements AqiForecastModel {
  const _AqiForecastModel({required this.day, required this.avg});
  

@override final  DateTime day;
@override final  double avg;

/// Create a copy of AqiForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AqiForecastModelCopyWith<_AqiForecastModel> get copyWith => __$AqiForecastModelCopyWithImpl<_AqiForecastModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AqiForecastModel&&(identical(other.day, day) || other.day == day)&&(identical(other.avg, avg) || other.avg == avg));
}


@override
int get hashCode => Object.hash(runtimeType,day,avg);

@override
String toString() {
  return 'AqiForecastModel(day: $day, avg: $avg)';
}


}

/// @nodoc
abstract mixin class _$AqiForecastModelCopyWith<$Res> implements $AqiForecastModelCopyWith<$Res> {
  factory _$AqiForecastModelCopyWith(_AqiForecastModel value, $Res Function(_AqiForecastModel) _then) = __$AqiForecastModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime day, double avg
});




}
/// @nodoc
class __$AqiForecastModelCopyWithImpl<$Res>
    implements _$AqiForecastModelCopyWith<$Res> {
  __$AqiForecastModelCopyWithImpl(this._self, this._then);

  final _AqiForecastModel _self;
  final $Res Function(_AqiForecastModel) _then;

/// Create a copy of AqiForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? avg = null,}) {
  return _then(_AqiForecastModel(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DateTime,avg: null == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
