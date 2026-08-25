// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirQuality {

 int get aqi; double get co; double get no2; double get o3; double get so2; double get pm10; double get pm25; List<int> get forecast;
/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityCopyWith<AirQuality> get copyWith => _$AirQualityCopyWithImpl<AirQuality>(this as AirQuality, _$identity);

  /// Serializes this AirQuality to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQuality&&(identical(other.aqi, aqi) || other.aqi == aqi)&&(identical(other.co, co) || other.co == co)&&(identical(other.no2, no2) || other.no2 == no2)&&(identical(other.o3, o3) || other.o3 == o3)&&(identical(other.so2, so2) || other.so2 == so2)&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&const DeepCollectionEquality().equals(other.forecast, forecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aqi,co,no2,o3,so2,pm10,pm25,const DeepCollectionEquality().hash(forecast));

@override
String toString() {
  return 'AirQuality(aqi: $aqi, co: $co, no2: $no2, o3: $o3, so2: $so2, pm10: $pm10, pm25: $pm25, forecast: $forecast)';
}


}

/// @nodoc
abstract mixin class $AirQualityCopyWith<$Res>  {
  factory $AirQualityCopyWith(AirQuality value, $Res Function(AirQuality) _then) = _$AirQualityCopyWithImpl;
@useResult
$Res call({
 int aqi, double co, double no2, double o3, double so2, double pm10, double pm25, List<int> forecast
});




}
/// @nodoc
class _$AirQualityCopyWithImpl<$Res>
    implements $AirQualityCopyWith<$Res> {
  _$AirQualityCopyWithImpl(this._self, this._then);

  final AirQuality _self;
  final $Res Function(AirQuality) _then;

/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aqi = null,Object? co = null,Object? no2 = null,Object? o3 = null,Object? so2 = null,Object? pm10 = null,Object? pm25 = null,Object? forecast = null,}) {
  return _then(_self.copyWith(
aqi: null == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as int,co: null == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as double,no2: null == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as double,o3: null == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as double,so2: null == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as double,pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,pm25: null == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double,forecast: null == forecast ? _self.forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQuality].
extension AirQualityPatterns on AirQuality {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQuality value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQuality value)  $default,){
final _that = this;
switch (_that) {
case _AirQuality():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQuality value)?  $default,){
final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int aqi,  double co,  double no2,  double o3,  double so2,  double pm10,  double pm25,  List<int> forecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
return $default(_that.aqi,_that.co,_that.no2,_that.o3,_that.so2,_that.pm10,_that.pm25,_that.forecast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int aqi,  double co,  double no2,  double o3,  double so2,  double pm10,  double pm25,  List<int> forecast)  $default,) {final _that = this;
switch (_that) {
case _AirQuality():
return $default(_that.aqi,_that.co,_that.no2,_that.o3,_that.so2,_that.pm10,_that.pm25,_that.forecast);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int aqi,  double co,  double no2,  double o3,  double so2,  double pm10,  double pm25,  List<int> forecast)?  $default,) {final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
return $default(_that.aqi,_that.co,_that.no2,_that.o3,_that.so2,_that.pm10,_that.pm25,_that.forecast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQuality implements AirQuality {
  const _AirQuality({required this.aqi, required this.co, required this.no2, required this.o3, required this.so2, required this.pm10, required this.pm25, required final  List<int> forecast}): _forecast = forecast;
  factory _AirQuality.fromJson(Map<String, dynamic> json) => _$AirQualityFromJson(json);

@override final  int aqi;
@override final  double co;
@override final  double no2;
@override final  double o3;
@override final  double so2;
@override final  double pm10;
@override final  double pm25;
 final  List<int> _forecast;
@override List<int> get forecast {
  if (_forecast is EqualUnmodifiableListView) return _forecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_forecast);
}


/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityCopyWith<_AirQuality> get copyWith => __$AirQualityCopyWithImpl<_AirQuality>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQuality&&(identical(other.aqi, aqi) || other.aqi == aqi)&&(identical(other.co, co) || other.co == co)&&(identical(other.no2, no2) || other.no2 == no2)&&(identical(other.o3, o3) || other.o3 == o3)&&(identical(other.so2, so2) || other.so2 == so2)&&(identical(other.pm10, pm10) || other.pm10 == pm10)&&(identical(other.pm25, pm25) || other.pm25 == pm25)&&const DeepCollectionEquality().equals(other._forecast, _forecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aqi,co,no2,o3,so2,pm10,pm25,const DeepCollectionEquality().hash(_forecast));

@override
String toString() {
  return 'AirQuality(aqi: $aqi, co: $co, no2: $no2, o3: $o3, so2: $so2, pm10: $pm10, pm25: $pm25, forecast: $forecast)';
}


}

/// @nodoc
abstract mixin class _$AirQualityCopyWith<$Res> implements $AirQualityCopyWith<$Res> {
  factory _$AirQualityCopyWith(_AirQuality value, $Res Function(_AirQuality) _then) = __$AirQualityCopyWithImpl;
@override @useResult
$Res call({
 int aqi, double co, double no2, double o3, double so2, double pm10, double pm25, List<int> forecast
});




}
/// @nodoc
class __$AirQualityCopyWithImpl<$Res>
    implements _$AirQualityCopyWith<$Res> {
  __$AirQualityCopyWithImpl(this._self, this._then);

  final _AirQuality _self;
  final $Res Function(_AirQuality) _then;

/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aqi = null,Object? co = null,Object? no2 = null,Object? o3 = null,Object? so2 = null,Object? pm10 = null,Object? pm25 = null,Object? forecast = null,}) {
  return _then(_AirQuality(
aqi: null == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as int,co: null == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as double,no2: null == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as double,o3: null == o3 ? _self.o3 : o3 // ignore: cast_nullable_to_non_nullable
as double,so2: null == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as double,pm10: null == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as double,pm25: null == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double,forecast: null == forecast ? _self._forecast : forecast // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
