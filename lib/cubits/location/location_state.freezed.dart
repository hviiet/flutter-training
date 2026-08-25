// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState()';
}


}

/// @nodoc
class $LocationStateCopyWith<$Res>  {
$LocationStateCopyWith(LocationState _, $Res Function(LocationState) __);
}


/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationInitial value)?  initial,TResult Function( LocationLoading value)?  loading,TResult Function( LocationSuccess value)?  success,TResult Function( LocationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial(_that);case LocationLoading() when loading != null:
return loading(_that);case LocationSuccess() when success != null:
return success(_that);case LocationFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationInitial value)  initial,required TResult Function( LocationLoading value)  loading,required TResult Function( LocationSuccess value)  success,required TResult Function( LocationFailure value)  failure,}){
final _that = this;
switch (_that) {
case LocationInitial():
return initial(_that);case LocationLoading():
return loading(_that);case LocationSuccess():
return success(_that);case LocationFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationInitial value)?  initial,TResult? Function( LocationLoading value)?  loading,TResult? Function( LocationSuccess value)?  success,TResult? Function( LocationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial(_that);case LocationLoading() when loading != null:
return loading(_that);case LocationSuccess() when success != null:
return success(_that);case LocationFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String requestedCity,  LocationDetails? previousDetails)?  loading,TResult Function( String requestedCity,  LocationDetails details)?  success,TResult Function( String requestedCity,  String error,  LocationDetails? previousDetails)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial();case LocationLoading() when loading != null:
return loading(_that.requestedCity,_that.previousDetails);case LocationSuccess() when success != null:
return success(_that.requestedCity,_that.details);case LocationFailure() when failure != null:
return failure(_that.requestedCity,_that.error,_that.previousDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String requestedCity,  LocationDetails? previousDetails)  loading,required TResult Function( String requestedCity,  LocationDetails details)  success,required TResult Function( String requestedCity,  String error,  LocationDetails? previousDetails)  failure,}) {final _that = this;
switch (_that) {
case LocationInitial():
return initial();case LocationLoading():
return loading(_that.requestedCity,_that.previousDetails);case LocationSuccess():
return success(_that.requestedCity,_that.details);case LocationFailure():
return failure(_that.requestedCity,_that.error,_that.previousDetails);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String requestedCity,  LocationDetails? previousDetails)?  loading,TResult? Function( String requestedCity,  LocationDetails details)?  success,TResult? Function( String requestedCity,  String error,  LocationDetails? previousDetails)?  failure,}) {final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial();case LocationLoading() when loading != null:
return loading(_that.requestedCity,_that.previousDetails);case LocationSuccess() when success != null:
return success(_that.requestedCity,_that.details);case LocationFailure() when failure != null:
return failure(_that.requestedCity,_that.error,_that.previousDetails);case _:
  return null;

}
}

}

/// @nodoc


class LocationInitial implements LocationState {
  const LocationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState.initial()';
}


}




/// @nodoc


class LocationLoading implements LocationState {
  const LocationLoading({required this.requestedCity, this.previousDetails});
  

 final  String requestedCity;
 final  LocationDetails? previousDetails;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationLoadingCopyWith<LocationLoading> get copyWith => _$LocationLoadingCopyWithImpl<LocationLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationLoading&&(identical(other.requestedCity, requestedCity) || other.requestedCity == requestedCity)&&(identical(other.previousDetails, previousDetails) || other.previousDetails == previousDetails));
}


@override
int get hashCode => Object.hash(runtimeType,requestedCity,previousDetails);

@override
String toString() {
  return 'LocationState.loading(requestedCity: $requestedCity, previousDetails: $previousDetails)';
}


}

/// @nodoc
abstract mixin class $LocationLoadingCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationLoadingCopyWith(LocationLoading value, $Res Function(LocationLoading) _then) = _$LocationLoadingCopyWithImpl;
@useResult
$Res call({
 String requestedCity, LocationDetails? previousDetails
});


$LocationDetailsCopyWith<$Res>? get previousDetails;

}
/// @nodoc
class _$LocationLoadingCopyWithImpl<$Res>
    implements $LocationLoadingCopyWith<$Res> {
  _$LocationLoadingCopyWithImpl(this._self, this._then);

  final LocationLoading _self;
  final $Res Function(LocationLoading) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestedCity = null,Object? previousDetails = freezed,}) {
  return _then(LocationLoading(
requestedCity: null == requestedCity ? _self.requestedCity : requestedCity // ignore: cast_nullable_to_non_nullable
as String,previousDetails: freezed == previousDetails ? _self.previousDetails : previousDetails // ignore: cast_nullable_to_non_nullable
as LocationDetails?,
  ));
}

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsCopyWith<$Res>? get previousDetails {
    if (_self.previousDetails == null) {
    return null;
  }

  return $LocationDetailsCopyWith<$Res>(_self.previousDetails!, (value) {
    return _then(_self.copyWith(previousDetails: value));
  });
}
}

/// @nodoc


class LocationSuccess implements LocationState {
  const LocationSuccess({required this.requestedCity, required this.details});
  

 final  String requestedCity;
 final  LocationDetails details;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationSuccessCopyWith<LocationSuccess> get copyWith => _$LocationSuccessCopyWithImpl<LocationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationSuccess&&(identical(other.requestedCity, requestedCity) || other.requestedCity == requestedCity)&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,requestedCity,details);

@override
String toString() {
  return 'LocationState.success(requestedCity: $requestedCity, details: $details)';
}


}

/// @nodoc
abstract mixin class $LocationSuccessCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationSuccessCopyWith(LocationSuccess value, $Res Function(LocationSuccess) _then) = _$LocationSuccessCopyWithImpl;
@useResult
$Res call({
 String requestedCity, LocationDetails details
});


$LocationDetailsCopyWith<$Res> get details;

}
/// @nodoc
class _$LocationSuccessCopyWithImpl<$Res>
    implements $LocationSuccessCopyWith<$Res> {
  _$LocationSuccessCopyWithImpl(this._self, this._then);

  final LocationSuccess _self;
  final $Res Function(LocationSuccess) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestedCity = null,Object? details = null,}) {
  return _then(LocationSuccess(
requestedCity: null == requestedCity ? _self.requestedCity : requestedCity // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as LocationDetails,
  ));
}

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsCopyWith<$Res> get details {
  
  return $LocationDetailsCopyWith<$Res>(_self.details, (value) {
    return _then(_self.copyWith(details: value));
  });
}
}

/// @nodoc


class LocationFailure implements LocationState {
  const LocationFailure({required this.requestedCity, required this.error, this.previousDetails});
  

 final  String requestedCity;
 final  String error;
 final  LocationDetails? previousDetails;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationFailureCopyWith<LocationFailure> get copyWith => _$LocationFailureCopyWithImpl<LocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationFailure&&(identical(other.requestedCity, requestedCity) || other.requestedCity == requestedCity)&&(identical(other.error, error) || other.error == error)&&(identical(other.previousDetails, previousDetails) || other.previousDetails == previousDetails));
}


@override
int get hashCode => Object.hash(runtimeType,requestedCity,error,previousDetails);

@override
String toString() {
  return 'LocationState.failure(requestedCity: $requestedCity, error: $error, previousDetails: $previousDetails)';
}


}

/// @nodoc
abstract mixin class $LocationFailureCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationFailureCopyWith(LocationFailure value, $Res Function(LocationFailure) _then) = _$LocationFailureCopyWithImpl;
@useResult
$Res call({
 String requestedCity, String error, LocationDetails? previousDetails
});


$LocationDetailsCopyWith<$Res>? get previousDetails;

}
/// @nodoc
class _$LocationFailureCopyWithImpl<$Res>
    implements $LocationFailureCopyWith<$Res> {
  _$LocationFailureCopyWithImpl(this._self, this._then);

  final LocationFailure _self;
  final $Res Function(LocationFailure) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestedCity = null,Object? error = null,Object? previousDetails = freezed,}) {
  return _then(LocationFailure(
requestedCity: null == requestedCity ? _self.requestedCity : requestedCity // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,previousDetails: freezed == previousDetails ? _self.previousDetails : previousDetails // ignore: cast_nullable_to_non_nullable
as LocationDetails?,
  ));
}

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDetailsCopyWith<$Res>? get previousDetails {
    if (_self.previousDetails == null) {
    return null;
  }

  return $LocationDetailsCopyWith<$Res>(_self.previousDetails!, (value) {
    return _then(_self.copyWith(previousDetails: value));
  });
}
}

// dart format on
