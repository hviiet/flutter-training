// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_hour_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherHourModel {

 DateTime get time; double get temp_c; WeatherConditionModel get condition;
/// Create a copy of WeatherHourModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherHourModelCopyWith<WeatherHourModel> get copyWith => _$WeatherHourModelCopyWithImpl<WeatherHourModel>(this as WeatherHourModel, _$identity);

  /// Serializes this WeatherHourModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherHourModel&&(identical(other.time, time) || other.time == time)&&(identical(other.temp_c, temp_c) || other.temp_c == temp_c)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temp_c,condition);

@override
String toString() {
  return 'WeatherHourModel(time: $time, temp_c: $temp_c, condition: $condition)';
}


}

/// @nodoc
abstract mixin class $WeatherHourModelCopyWith<$Res>  {
  factory $WeatherHourModelCopyWith(WeatherHourModel value, $Res Function(WeatherHourModel) _then) = _$WeatherHourModelCopyWithImpl;
@useResult
$Res call({
 DateTime time, double temp_c, WeatherConditionModel condition
});


$WeatherConditionModelCopyWith<$Res> get condition;

}
/// @nodoc
class _$WeatherHourModelCopyWithImpl<$Res>
    implements $WeatherHourModelCopyWith<$Res> {
  _$WeatherHourModelCopyWithImpl(this._self, this._then);

  final WeatherHourModel _self;
  final $Res Function(WeatherHourModel) _then;

/// Create a copy of WeatherHourModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temp_c = null,Object? condition = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temp_c: null == temp_c ? _self.temp_c : temp_c // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherConditionModel,
  ));
}
/// Create a copy of WeatherHourModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionModelCopyWith<$Res> get condition {
  
  return $WeatherConditionModelCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherHourModel].
extension WeatherHourModelPatterns on WeatherHourModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherHourModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherHourModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherHourModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherHourModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherHourModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherHourModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  double temp_c,  WeatherConditionModel condition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherHourModel() when $default != null:
return $default(_that.time,_that.temp_c,_that.condition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  double temp_c,  WeatherConditionModel condition)  $default,) {final _that = this;
switch (_that) {
case _WeatherHourModel():
return $default(_that.time,_that.temp_c,_that.condition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  double temp_c,  WeatherConditionModel condition)?  $default,) {final _that = this;
switch (_that) {
case _WeatherHourModel() when $default != null:
return $default(_that.time,_that.temp_c,_that.condition);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherHourModel implements WeatherHourModel {
  const _WeatherHourModel({required this.time, required this.temp_c, required this.condition});
  factory _WeatherHourModel.fromJson(Map<String, dynamic> json) => _$WeatherHourModelFromJson(json);

@override final  DateTime time;
@override final  double temp_c;
@override final  WeatherConditionModel condition;

/// Create a copy of WeatherHourModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherHourModelCopyWith<_WeatherHourModel> get copyWith => __$WeatherHourModelCopyWithImpl<_WeatherHourModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherHourModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherHourModel&&(identical(other.time, time) || other.time == time)&&(identical(other.temp_c, temp_c) || other.temp_c == temp_c)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temp_c,condition);

@override
String toString() {
  return 'WeatherHourModel(time: $time, temp_c: $temp_c, condition: $condition)';
}


}

/// @nodoc
abstract mixin class _$WeatherHourModelCopyWith<$Res> implements $WeatherHourModelCopyWith<$Res> {
  factory _$WeatherHourModelCopyWith(_WeatherHourModel value, $Res Function(_WeatherHourModel) _then) = __$WeatherHourModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, double temp_c, WeatherConditionModel condition
});


@override $WeatherConditionModelCopyWith<$Res> get condition;

}
/// @nodoc
class __$WeatherHourModelCopyWithImpl<$Res>
    implements _$WeatherHourModelCopyWith<$Res> {
  __$WeatherHourModelCopyWithImpl(this._self, this._then);

  final _WeatherHourModel _self;
  final $Res Function(_WeatherHourModel) _then;

/// Create a copy of WeatherHourModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temp_c = null,Object? condition = null,}) {
  return _then(_WeatherHourModel(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temp_c: null == temp_c ? _self.temp_c : temp_c // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherConditionModel,
  ));
}

/// Create a copy of WeatherHourModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionModelCopyWith<$Res> get condition {
  
  return $WeatherConditionModelCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// @nodoc
mixin _$WeatherConditionModel {

 String get text; String get icon;
/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherConditionModelCopyWith<WeatherConditionModel> get copyWith => _$WeatherConditionModelCopyWithImpl<WeatherConditionModel>(this as WeatherConditionModel, _$identity);

  /// Serializes this WeatherConditionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherConditionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,icon);

@override
String toString() {
  return 'WeatherConditionModel(text: $text, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $WeatherConditionModelCopyWith<$Res>  {
  factory $WeatherConditionModelCopyWith(WeatherConditionModel value, $Res Function(WeatherConditionModel) _then) = _$WeatherConditionModelCopyWithImpl;
@useResult
$Res call({
 String text, String icon
});




}
/// @nodoc
class _$WeatherConditionModelCopyWithImpl<$Res>
    implements $WeatherConditionModelCopyWith<$Res> {
  _$WeatherConditionModelCopyWithImpl(this._self, this._then);

  final WeatherConditionModel _self;
  final $Res Function(WeatherConditionModel) _then;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? icon = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherConditionModel].
extension WeatherConditionModelPatterns on WeatherConditionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherConditionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherConditionModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherConditionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherConditionModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
return $default(_that.text,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String icon)  $default,) {final _that = this;
switch (_that) {
case _WeatherConditionModel():
return $default(_that.text,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
return $default(_that.text,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherConditionModel implements WeatherConditionModel {
  const _WeatherConditionModel({required this.text, required this.icon});
  factory _WeatherConditionModel.fromJson(Map<String, dynamic> json) => _$WeatherConditionModelFromJson(json);

@override final  String text;
@override final  String icon;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherConditionModelCopyWith<_WeatherConditionModel> get copyWith => __$WeatherConditionModelCopyWithImpl<_WeatherConditionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherConditionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherConditionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,icon);

@override
String toString() {
  return 'WeatherConditionModel(text: $text, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherConditionModelCopyWith<$Res> implements $WeatherConditionModelCopyWith<$Res> {
  factory _$WeatherConditionModelCopyWith(_WeatherConditionModel value, $Res Function(_WeatherConditionModel) _then) = __$WeatherConditionModelCopyWithImpl;
@override @useResult
$Res call({
 String text, String icon
});




}
/// @nodoc
class __$WeatherConditionModelCopyWithImpl<$Res>
    implements _$WeatherConditionModelCopyWith<$Res> {
  __$WeatherConditionModelCopyWithImpl(this._self, this._then);

  final _WeatherConditionModel _self;
  final $Res Function(_WeatherConditionModel) _then;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? icon = null,}) {
  return _then(_WeatherConditionModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
