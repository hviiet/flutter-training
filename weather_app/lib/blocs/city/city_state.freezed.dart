// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityState {

 bool get isLoading; String? get error; Map<String, CityData> get citiesData;
/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityStateCopyWith<CityState> get copyWith => _$CityStateCopyWithImpl<CityState>(this as CityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.citiesData, citiesData));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,const DeepCollectionEquality().hash(citiesData));

@override
String toString() {
  return 'CityState(isLoading: $isLoading, error: $error, citiesData: $citiesData)';
}


}

/// @nodoc
abstract mixin class $CityStateCopyWith<$Res>  {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) _then) = _$CityStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, Map<String, CityData> citiesData
});




}
/// @nodoc
class _$CityStateCopyWithImpl<$Res>
    implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._self, this._then);

  final CityState _self;
  final $Res Function(CityState) _then;

/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? citiesData = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,citiesData: null == citiesData ? _self.citiesData : citiesData // ignore: cast_nullable_to_non_nullable
as Map<String, CityData>,
  ));
}

}


/// Adds pattern-matching-related methods to [CityState].
extension CityStatePatterns on CityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityState value)  $default,){
final _that = this;
switch (_that) {
case _CityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityState value)?  $default,){
final _that = this;
switch (_that) {
case _CityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  Map<String, CityData> citiesData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityState() when $default != null:
return $default(_that.isLoading,_that.error,_that.citiesData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  Map<String, CityData> citiesData)  $default,) {final _that = this;
switch (_that) {
case _CityState():
return $default(_that.isLoading,_that.error,_that.citiesData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  Map<String, CityData> citiesData)?  $default,) {final _that = this;
switch (_that) {
case _CityState() when $default != null:
return $default(_that.isLoading,_that.error,_that.citiesData);case _:
  return null;

}
}

}

/// @nodoc


class _CityState implements CityState {
  const _CityState({this.isLoading = false, this.error, final  Map<String, CityData> citiesData = const {}}): _citiesData = citiesData;
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
 final  Map<String, CityData> _citiesData;
@override@JsonKey() Map<String, CityData> get citiesData {
  if (_citiesData is EqualUnmodifiableMapView) return _citiesData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_citiesData);
}


/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityStateCopyWith<_CityState> get copyWith => __$CityStateCopyWithImpl<_CityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other._citiesData, _citiesData));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,const DeepCollectionEquality().hash(_citiesData));

@override
String toString() {
  return 'CityState(isLoading: $isLoading, error: $error, citiesData: $citiesData)';
}


}

/// @nodoc
abstract mixin class _$CityStateCopyWith<$Res> implements $CityStateCopyWith<$Res> {
  factory _$CityStateCopyWith(_CityState value, $Res Function(_CityState) _then) = __$CityStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, Map<String, CityData> citiesData
});




}
/// @nodoc
class __$CityStateCopyWithImpl<$Res>
    implements _$CityStateCopyWith<$Res> {
  __$CityStateCopyWithImpl(this._self, this._then);

  final _CityState _self;
  final $Res Function(_CityState) _then;

/// Create a copy of CityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? citiesData = null,}) {
  return _then(_CityState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,citiesData: null == citiesData ? _self._citiesData : citiesData // ignore: cast_nullable_to_non_nullable
as Map<String, CityData>,
  ));
}


}

// dart format on
