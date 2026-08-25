// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationDetails _$LocationDetailsFromJson(Map<String, dynamic> json) =>
    _LocationDetails(
      airQuality: AirQuality.fromJson(
        json['airQuality'] as Map<String, dynamic>,
      ),
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationDetailsToJson(_LocationDetails instance) =>
    <String, dynamic>{
      'airQuality': instance.airQuality,
      'weather': instance.weather,
    };
