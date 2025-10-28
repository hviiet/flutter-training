// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseImpl _$$WeatherResponseImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherResponseImpl(
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  current: Current.fromJson(json['current'] as Map<String, dynamic>),
  forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$WeatherResponseImplToJson(
  _$WeatherResponseImpl instance,
) => <String, dynamic>{
  'location': instance.location,
  'current': instance.current,
  'forecast': instance.forecast,
};

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      name: json['name'] as String,
      region: json['region'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      tempC: (json['temp_c'] as num).toDouble(),
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      isDay: (json['is_day'] as num).toInt(),
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      airQuality: json['air_quality'] == null
          ? null
          : AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'feelslike_c': instance.feelsLikeC,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'air_quality': instance.airQuality,
      'wind_kph': instance.windKph,
      'humidity': instance.humidity,
    };

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{'forecastday': instance.forecastday};

_$ForecastDayImpl _$$ForecastDayImplFromJson(Map<String, dynamic> json) =>
    _$ForecastDayImpl(
      date: json['date'] as String,
      day: Day.fromJson(json['day'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>)
          .map((e) => Hour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForecastDayImplToJson(_$ForecastDayImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'hour': instance.hour,
    };

_$DayImpl _$$DayImplFromJson(Map<String, dynamic> json) => _$DayImpl(
  avgTempC: (json['avgtemp_c'] as num?)?.toDouble(),
  maxTempC: (json['maxtemp_c'] as num?)?.toDouble(),
  minTempC: (json['mintemp_c'] as num?)?.toDouble(),
  condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
  airQuality: json['air_quality'] == null
      ? null
      : AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
  dailyChanceOfRain: (json['daily_chance_of_rain'] as num?)?.toInt(),
);

Map<String, dynamic> _$$DayImplToJson(_$DayImpl instance) => <String, dynamic>{
  'avgtemp_c': instance.avgTempC,
  'maxtemp_c': instance.maxTempC,
  'mintemp_c': instance.minTempC,
  'condition': instance.condition,
  'air_quality': instance.airQuality,
  'daily_chance_of_rain': instance.dailyChanceOfRain,
};

_$HourImpl _$$HourImplFromJson(Map<String, dynamic> json) => _$HourImpl(
  time: json['time'] as String,
  tempC: (json['temp_c'] as num).toDouble(),
  isDay: (json['is_day'] as num).toInt(),
  condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$HourImplToJson(_$HourImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.tempC,
      'is_day': instance.isDay,
      'condition': instance.condition,
    };

_$ConditionImpl _$$ConditionImplFromJson(Map<String, dynamic> json) =>
    _$ConditionImpl(text: json['text'] as String);

Map<String, dynamic> _$$ConditionImplToJson(_$ConditionImpl instance) =>
    <String, dynamic>{'text': instance.text};

_$AirQualityImpl _$$AirQualityImplFromJson(Map<String, dynamic> json) =>
    _$AirQualityImpl(
      co: (json['co'] as num?)?.toDouble(),
      no2: (json['no2'] as num?)?.toDouble(),
      o3: (json['o3'] as num?)?.toDouble(),
      so2: (json['so2'] as num?)?.toDouble(),
      pm25: (json['pm2_5'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
      usEpaIndex: (json['us-epa-index'] as num?)?.toInt(),
      gbDefraIndex: (json['gb-defra-index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AirQualityImplToJson(_$AirQualityImpl instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm25,
      'pm10': instance.pm10,
      'us-epa-index': instance.usEpaIndex,
      'gb-defra-index': instance.gbDefraIndex,
    };
