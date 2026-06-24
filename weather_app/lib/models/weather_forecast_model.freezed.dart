// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherForecastModel {

 DateTime get date; WeatherDayModel get day;
/// Create a copy of WeatherForecastModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherForecastModelCopyWith<WeatherForecastModel> get copyWith => _$WeatherForecastModelCopyWithImpl<WeatherForecastModel>(this as WeatherForecastModel, _$identity);

  /// Serializes this WeatherForecastModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherForecastModel&&(identical(other.date, date) || other.date == date)&&(identical(other.day, day) || other.day == day));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,day);

@override
String toString() {
  return 'WeatherForecastModel(date: $date, day: $day)';
}


}

/// @nodoc
abstract mixin class $WeatherForecastModelCopyWith<$Res>  {
  factory $WeatherForecastModelCopyWith(WeatherForecastModel value, $Res Function(WeatherForecastModel) _then) = _$WeatherForecastModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, WeatherDayModel day
});


$WeatherDayModelCopyWith<$Res> get day;

}
/// @nodoc
class _$WeatherForecastModelCopyWithImpl<$Res>
    implements $WeatherForecastModelCopyWith<$Res> {
  _$WeatherForecastModelCopyWithImpl(this._self, this._then);

  final WeatherForecastModel _self;
  final $Res Function(WeatherForecastModel) _then;

/// Create a copy of WeatherForecastModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? day = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as WeatherDayModel,
  ));
}
/// Create a copy of WeatherForecastModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherDayModelCopyWith<$Res> get day {
  
  return $WeatherDayModelCopyWith<$Res>(_self.day, (value) {
    return _then(_self.copyWith(day: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherForecastModel].
extension WeatherForecastModelPatterns on WeatherForecastModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherForecastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherForecastModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherForecastModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherForecastModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherForecastModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherForecastModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  WeatherDayModel day)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherForecastModel() when $default != null:
return $default(_that.date,_that.day);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  WeatherDayModel day)  $default,) {final _that = this;
switch (_that) {
case _WeatherForecastModel():
return $default(_that.date,_that.day);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  WeatherDayModel day)?  $default,) {final _that = this;
switch (_that) {
case _WeatherForecastModel() when $default != null:
return $default(_that.date,_that.day);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherForecastModel implements WeatherForecastModel {
  const _WeatherForecastModel({required this.date, required this.day});
  factory _WeatherForecastModel.fromJson(Map<String, dynamic> json) => _$WeatherForecastModelFromJson(json);

@override final  DateTime date;
@override final  WeatherDayModel day;

/// Create a copy of WeatherForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherForecastModelCopyWith<_WeatherForecastModel> get copyWith => __$WeatherForecastModelCopyWithImpl<_WeatherForecastModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherForecastModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherForecastModel&&(identical(other.date, date) || other.date == date)&&(identical(other.day, day) || other.day == day));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,day);

@override
String toString() {
  return 'WeatherForecastModel(date: $date, day: $day)';
}


}

/// @nodoc
abstract mixin class _$WeatherForecastModelCopyWith<$Res> implements $WeatherForecastModelCopyWith<$Res> {
  factory _$WeatherForecastModelCopyWith(_WeatherForecastModel value, $Res Function(_WeatherForecastModel) _then) = __$WeatherForecastModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, WeatherDayModel day
});


@override $WeatherDayModelCopyWith<$Res> get day;

}
/// @nodoc
class __$WeatherForecastModelCopyWithImpl<$Res>
    implements _$WeatherForecastModelCopyWith<$Res> {
  __$WeatherForecastModelCopyWithImpl(this._self, this._then);

  final _WeatherForecastModel _self;
  final $Res Function(_WeatherForecastModel) _then;

/// Create a copy of WeatherForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? day = null,}) {
  return _then(_WeatherForecastModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as WeatherDayModel,
  ));
}

/// Create a copy of WeatherForecastModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherDayModelCopyWith<$Res> get day {
  
  return $WeatherDayModelCopyWith<$Res>(_self.day, (value) {
    return _then(_self.copyWith(day: value));
  });
}
}


/// @nodoc
mixin _$WeatherDayModel {

 double get avgtemp_c; double get maxtemp_c; double get mintemp_c; DayConditionModel get condition;
/// Create a copy of WeatherDayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherDayModelCopyWith<WeatherDayModel> get copyWith => _$WeatherDayModelCopyWithImpl<WeatherDayModel>(this as WeatherDayModel, _$identity);

  /// Serializes this WeatherDayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherDayModel&&(identical(other.avgtemp_c, avgtemp_c) || other.avgtemp_c == avgtemp_c)&&(identical(other.maxtemp_c, maxtemp_c) || other.maxtemp_c == maxtemp_c)&&(identical(other.mintemp_c, mintemp_c) || other.mintemp_c == mintemp_c)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avgtemp_c,maxtemp_c,mintemp_c,condition);

@override
String toString() {
  return 'WeatherDayModel(avgtemp_c: $avgtemp_c, maxtemp_c: $maxtemp_c, mintemp_c: $mintemp_c, condition: $condition)';
}


}

/// @nodoc
abstract mixin class $WeatherDayModelCopyWith<$Res>  {
  factory $WeatherDayModelCopyWith(WeatherDayModel value, $Res Function(WeatherDayModel) _then) = _$WeatherDayModelCopyWithImpl;
@useResult
$Res call({
 double avgtemp_c, double maxtemp_c, double mintemp_c, DayConditionModel condition
});


$DayConditionModelCopyWith<$Res> get condition;

}
/// @nodoc
class _$WeatherDayModelCopyWithImpl<$Res>
    implements $WeatherDayModelCopyWith<$Res> {
  _$WeatherDayModelCopyWithImpl(this._self, this._then);

  final WeatherDayModel _self;
  final $Res Function(WeatherDayModel) _then;

/// Create a copy of WeatherDayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avgtemp_c = null,Object? maxtemp_c = null,Object? mintemp_c = null,Object? condition = null,}) {
  return _then(_self.copyWith(
avgtemp_c: null == avgtemp_c ? _self.avgtemp_c : avgtemp_c // ignore: cast_nullable_to_non_nullable
as double,maxtemp_c: null == maxtemp_c ? _self.maxtemp_c : maxtemp_c // ignore: cast_nullable_to_non_nullable
as double,mintemp_c: null == mintemp_c ? _self.mintemp_c : mintemp_c // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as DayConditionModel,
  ));
}
/// Create a copy of WeatherDayModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayConditionModelCopyWith<$Res> get condition {
  
  return $DayConditionModelCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherDayModel].
extension WeatherDayModelPatterns on WeatherDayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherDayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherDayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherDayModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherDayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherDayModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherDayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double avgtemp_c,  double maxtemp_c,  double mintemp_c,  DayConditionModel condition)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherDayModel() when $default != null:
return $default(_that.avgtemp_c,_that.maxtemp_c,_that.mintemp_c,_that.condition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double avgtemp_c,  double maxtemp_c,  double mintemp_c,  DayConditionModel condition)  $default,) {final _that = this;
switch (_that) {
case _WeatherDayModel():
return $default(_that.avgtemp_c,_that.maxtemp_c,_that.mintemp_c,_that.condition);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double avgtemp_c,  double maxtemp_c,  double mintemp_c,  DayConditionModel condition)?  $default,) {final _that = this;
switch (_that) {
case _WeatherDayModel() when $default != null:
return $default(_that.avgtemp_c,_that.maxtemp_c,_that.mintemp_c,_that.condition);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherDayModel implements WeatherDayModel {
  const _WeatherDayModel({required this.avgtemp_c, required this.maxtemp_c, required this.mintemp_c, required this.condition});
  factory _WeatherDayModel.fromJson(Map<String, dynamic> json) => _$WeatherDayModelFromJson(json);

@override final  double avgtemp_c;
@override final  double maxtemp_c;
@override final  double mintemp_c;
@override final  DayConditionModel condition;

/// Create a copy of WeatherDayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherDayModelCopyWith<_WeatherDayModel> get copyWith => __$WeatherDayModelCopyWithImpl<_WeatherDayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherDayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherDayModel&&(identical(other.avgtemp_c, avgtemp_c) || other.avgtemp_c == avgtemp_c)&&(identical(other.maxtemp_c, maxtemp_c) || other.maxtemp_c == maxtemp_c)&&(identical(other.mintemp_c, mintemp_c) || other.mintemp_c == mintemp_c)&&(identical(other.condition, condition) || other.condition == condition));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avgtemp_c,maxtemp_c,mintemp_c,condition);

@override
String toString() {
  return 'WeatherDayModel(avgtemp_c: $avgtemp_c, maxtemp_c: $maxtemp_c, mintemp_c: $mintemp_c, condition: $condition)';
}


}

/// @nodoc
abstract mixin class _$WeatherDayModelCopyWith<$Res> implements $WeatherDayModelCopyWith<$Res> {
  factory _$WeatherDayModelCopyWith(_WeatherDayModel value, $Res Function(_WeatherDayModel) _then) = __$WeatherDayModelCopyWithImpl;
@override @useResult
$Res call({
 double avgtemp_c, double maxtemp_c, double mintemp_c, DayConditionModel condition
});


@override $DayConditionModelCopyWith<$Res> get condition;

}
/// @nodoc
class __$WeatherDayModelCopyWithImpl<$Res>
    implements _$WeatherDayModelCopyWith<$Res> {
  __$WeatherDayModelCopyWithImpl(this._self, this._then);

  final _WeatherDayModel _self;
  final $Res Function(_WeatherDayModel) _then;

/// Create a copy of WeatherDayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avgtemp_c = null,Object? maxtemp_c = null,Object? mintemp_c = null,Object? condition = null,}) {
  return _then(_WeatherDayModel(
avgtemp_c: null == avgtemp_c ? _self.avgtemp_c : avgtemp_c // ignore: cast_nullable_to_non_nullable
as double,maxtemp_c: null == maxtemp_c ? _self.maxtemp_c : maxtemp_c // ignore: cast_nullable_to_non_nullable
as double,mintemp_c: null == mintemp_c ? _self.mintemp_c : mintemp_c // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as DayConditionModel,
  ));
}

/// Create a copy of WeatherDayModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DayConditionModelCopyWith<$Res> get condition {
  
  return $DayConditionModelCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// @nodoc
mixin _$DayConditionModel {

 String get text; String get icon;
/// Create a copy of DayConditionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayConditionModelCopyWith<DayConditionModel> get copyWith => _$DayConditionModelCopyWithImpl<DayConditionModel>(this as DayConditionModel, _$identity);

  /// Serializes this DayConditionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayConditionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,icon);

@override
String toString() {
  return 'DayConditionModel(text: $text, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $DayConditionModelCopyWith<$Res>  {
  factory $DayConditionModelCopyWith(DayConditionModel value, $Res Function(DayConditionModel) _then) = _$DayConditionModelCopyWithImpl;
@useResult
$Res call({
 String text, String icon
});




}
/// @nodoc
class _$DayConditionModelCopyWithImpl<$Res>
    implements $DayConditionModelCopyWith<$Res> {
  _$DayConditionModelCopyWithImpl(this._self, this._then);

  final DayConditionModel _self;
  final $Res Function(DayConditionModel) _then;

/// Create a copy of DayConditionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? icon = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DayConditionModel].
extension DayConditionModelPatterns on DayConditionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayConditionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayConditionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayConditionModel value)  $default,){
final _that = this;
switch (_that) {
case _DayConditionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayConditionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DayConditionModel() when $default != null:
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
case _DayConditionModel() when $default != null:
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
case _DayConditionModel():
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
case _DayConditionModel() when $default != null:
return $default(_that.text,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayConditionModel implements DayConditionModel {
  const _DayConditionModel({required this.text, required this.icon});
  factory _DayConditionModel.fromJson(Map<String, dynamic> json) => _$DayConditionModelFromJson(json);

@override final  String text;
@override final  String icon;

/// Create a copy of DayConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayConditionModelCopyWith<_DayConditionModel> get copyWith => __$DayConditionModelCopyWithImpl<_DayConditionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayConditionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayConditionModel&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,icon);

@override
String toString() {
  return 'DayConditionModel(text: $text, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$DayConditionModelCopyWith<$Res> implements $DayConditionModelCopyWith<$Res> {
  factory _$DayConditionModelCopyWith(_DayConditionModel value, $Res Function(_DayConditionModel) _then) = __$DayConditionModelCopyWithImpl;
@override @useResult
$Res call({
 String text, String icon
});




}
/// @nodoc
class __$DayConditionModelCopyWithImpl<$Res>
    implements _$DayConditionModelCopyWith<$Res> {
  __$DayConditionModelCopyWithImpl(this._self, this._then);

  final _DayConditionModel _self;
  final $Res Function(_DayConditionModel) _then;

/// Create a copy of DayConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? icon = null,}) {
  return _then(_DayConditionModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
