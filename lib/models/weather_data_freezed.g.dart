// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataFreezedImpl _$$WeatherDataFreezedImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherDataFreezedImpl(
  location: json['location'] as String,
  region: json['region'] as String,
  current: CurrentWeather.fromJson(json['current'] as Map<String, dynamic>),
  forecast: (json['forecast'] as List<dynamic>)
      .map((e) => ForecastDayFreezed.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$WeatherDataFreezedImplToJson(
  _$WeatherDataFreezedImpl instance,
) => <String, dynamic>{
  'location': instance.location,
  'region': instance.region,
  'current': instance.current,
  'forecast': instance.forecast,
};

_$CurrentWeatherImpl _$$CurrentWeatherImplFromJson(Map<String, dynamic> json) =>
    _$CurrentWeatherImpl(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition: WeatherCondition.fromJson(
        json['condition'] as Map<String, dynamic>,
      ),
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      airQuality: json['air_quality'] == null
          ? null
          : AirQualityFreezed.fromJson(
              json['air_quality'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$CurrentWeatherImplToJson(
  _$CurrentWeatherImpl instance,
) => <String, dynamic>{
  'temp_c': instance.tempC,
  'temp_f': instance.tempF,
  'condition': instance.condition,
  'feelslike_c': instance.feelsLikeC,
  'air_quality': instance.airQuality,
};

_$WeatherConditionImpl _$$WeatherConditionImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherConditionImpl(
  text: json['text'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$$WeatherConditionImplToJson(
  _$WeatherConditionImpl instance,
) => <String, dynamic>{'text': instance.text, 'icon': instance.icon};

_$AirQualityFreezedImpl _$$AirQualityFreezedImplFromJson(
  Map<String, dynamic> json,
) => _$AirQualityFreezedImpl(
  co: (json['co'] as num?)?.toDouble(),
  no2: (json['no2'] as num?)?.toDouble(),
  o3: (json['o3'] as num?)?.toDouble(),
  so2: (json['so2'] as num?)?.toDouble(),
  pm25: (json['pm2_5'] as num?)?.toDouble(),
  pm10: (json['pm10'] as num?)?.toDouble(),
  usEpaIndex: (json['us-epa-index'] as num?)?.toInt(),
  gbDefraIndex: (json['gb-defra-index'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AirQualityFreezedImplToJson(
  _$AirQualityFreezedImpl instance,
) => <String, dynamic>{
  'co': instance.co,
  'no2': instance.no2,
  'o3': instance.o3,
  'so2': instance.so2,
  'pm2_5': instance.pm25,
  'pm10': instance.pm10,
  'us-epa-index': instance.usEpaIndex,
  'gb-defra-index': instance.gbDefraIndex,
};

_$ForecastDayFreezedImpl _$$ForecastDayFreezedImplFromJson(
  Map<String, dynamic> json,
) => _$ForecastDayFreezedImpl(
  date: DateTime.parse(json['date'] as String),
  dayForecast: DayForecast.fromJson(json['day'] as Map<String, dynamic>),
  hour: (json['hour'] as List<dynamic>)
      .map((e) => HourlyForecastFreezed.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ForecastDayFreezedImplToJson(
  _$ForecastDayFreezedImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'day': instance.dayForecast,
  'hour': instance.hour,
};

_$DayForecastImpl _$$DayForecastImplFromJson(Map<String, dynamic> json) =>
    _$DayForecastImpl(
      maxTempC: (json['maxtemp_c'] as num).toDouble(),
      minTempC: (json['mintemp_c'] as num).toDouble(),
      condition: WeatherCondition.fromJson(
        json['condition'] as Map<String, dynamic>,
      ),
      airQuality: json['air_quality'] == null
          ? null
          : AirQualityFreezed.fromJson(
              json['air_quality'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$DayForecastImplToJson(_$DayForecastImpl instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'mintemp_c': instance.minTempC,
      'condition': instance.condition,
      'air_quality': instance.airQuality,
    };

_$HourlyForecastFreezedImpl _$$HourlyForecastFreezedImplFromJson(
  Map<String, dynamic> json,
) => _$HourlyForecastFreezedImpl(
  time: DateTime.parse(json['time'] as String),
  tempC: (json['temp_c'] as num).toDouble(),
  condition: WeatherCondition.fromJson(
    json['condition'] as Map<String, dynamic>,
  ),
  airQuality: json['air_quality'] == null
      ? null
      : AirQualityFreezed.fromJson(json['air_quality'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$HourlyForecastFreezedImplToJson(
  _$HourlyForecastFreezedImpl instance,
) => <String, dynamic>{
  'time': instance.time.toIso8601String(),
  'temp_c': instance.tempC,
  'condition': instance.condition,
  'air_quality': instance.airQuality,
};
