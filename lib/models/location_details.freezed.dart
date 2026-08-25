// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationDetails {

 AirQuality get airQuality; Weather get weather;
/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationDetailsCopyWith<LocationDetails> get copyWith => _$LocationDetailsCopyWithImpl<LocationDetails>(this as LocationDetails, _$identity);

  /// Serializes this LocationDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationDetails&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality)&&(identical(other.weather, weather) || other.weather == weather));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airQuality,weather);

@override
String toString() {
  return 'LocationDetails(airQuality: $airQuality, weather: $weather)';
}


}

/// @nodoc
abstract mixin class $LocationDetailsCopyWith<$Res>  {
  factory $LocationDetailsCopyWith(LocationDetails value, $Res Function(LocationDetails) _then) = _$LocationDetailsCopyWithImpl;
@useResult
$Res call({
 AirQuality airQuality, Weather weather
});


$AirQualityCopyWith<$Res> get airQuality;$WeatherCopyWith<$Res> get weather;

}
/// @nodoc
class _$LocationDetailsCopyWithImpl<$Res>
    implements $LocationDetailsCopyWith<$Res> {
  _$LocationDetailsCopyWithImpl(this._self, this._then);

  final LocationDetails _self;
  final $Res Function(LocationDetails) _then;

/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? airQuality = null,Object? weather = null,}) {
  return _then(_self.copyWith(
airQuality: null == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQuality,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather,
  ));
}
/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCopyWith<$Res> get airQuality {
  
  return $AirQualityCopyWith<$Res>(_self.airQuality, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherCopyWith<$Res> get weather {
  
  return $WeatherCopyWith<$Res>(_self.weather, (value) {
    return _then(_self.copyWith(weather: value));
  });
}
}


/// Adds pattern-matching-related methods to [LocationDetails].
extension LocationDetailsPatterns on LocationDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationDetails value)  $default,){
final _that = this;
switch (_that) {
case _LocationDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationDetails value)?  $default,){
final _that = this;
switch (_that) {
case _LocationDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AirQuality airQuality,  Weather weather)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationDetails() when $default != null:
return $default(_that.airQuality,_that.weather);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AirQuality airQuality,  Weather weather)  $default,) {final _that = this;
switch (_that) {
case _LocationDetails():
return $default(_that.airQuality,_that.weather);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AirQuality airQuality,  Weather weather)?  $default,) {final _that = this;
switch (_that) {
case _LocationDetails() when $default != null:
return $default(_that.airQuality,_that.weather);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationDetails implements LocationDetails {
  const _LocationDetails({required this.airQuality, required this.weather});
  factory _LocationDetails.fromJson(Map<String, dynamic> json) => _$LocationDetailsFromJson(json);

@override final  AirQuality airQuality;
@override final  Weather weather;

/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationDetailsCopyWith<_LocationDetails> get copyWith => __$LocationDetailsCopyWithImpl<_LocationDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationDetails&&(identical(other.airQuality, airQuality) || other.airQuality == airQuality)&&(identical(other.weather, weather) || other.weather == weather));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,airQuality,weather);

@override
String toString() {
  return 'LocationDetails(airQuality: $airQuality, weather: $weather)';
}


}

/// @nodoc
abstract mixin class _$LocationDetailsCopyWith<$Res> implements $LocationDetailsCopyWith<$Res> {
  factory _$LocationDetailsCopyWith(_LocationDetails value, $Res Function(_LocationDetails) _then) = __$LocationDetailsCopyWithImpl;
@override @useResult
$Res call({
 AirQuality airQuality, Weather weather
});


@override $AirQualityCopyWith<$Res> get airQuality;@override $WeatherCopyWith<$Res> get weather;

}
/// @nodoc
class __$LocationDetailsCopyWithImpl<$Res>
    implements _$LocationDetailsCopyWith<$Res> {
  __$LocationDetailsCopyWithImpl(this._self, this._then);

  final _LocationDetails _self;
  final $Res Function(_LocationDetails) _then;

/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? airQuality = null,Object? weather = null,}) {
  return _then(_LocationDetails(
airQuality: null == airQuality ? _self.airQuality : airQuality // ignore: cast_nullable_to_non_nullable
as AirQuality,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather,
  ));
}

/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCopyWith<$Res> get airQuality {
  
  return $AirQualityCopyWith<$Res>(_self.airQuality, (value) {
    return _then(_self.copyWith(airQuality: value));
  });
}/// Create a copy of LocationDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherCopyWith<$Res> get weather {
  
  return $WeatherCopyWith<$Res>(_self.weather, (value) {
    return _then(_self.copyWith(weather: value));
  });
}
}

// dart format on
