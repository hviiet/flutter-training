import 'package:freezed_annotation/freezed_annotation.dart';
import 'air_quality.dart';
import 'weather.dart';

part 'location_details.freezed.dart';
part 'location_details.g.dart';

@freezed
abstract class LocationDetails with _$LocationDetails {
  const factory LocationDetails({
    required AirQuality airQuality,
    required Weather weather,
  }) = _LocationDetails;
  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsFromJson(json);
}
