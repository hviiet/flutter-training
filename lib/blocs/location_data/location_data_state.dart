import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:air_quality/models/air_quality_model.dart';
import 'package:air_quality/models/weather_model.dart';

part 'location_data_state.freezed.dart';

@freezed
class LocationDataState with _$LocationDataState {
  // 1. Trạng thái ban đầu
  const factory LocationDataState.initial() = _LocationDataInitial;
  
  // 2. Trạng thái đang tải
  const factory LocationDataState.loading() = _LocationDataLoading;
  
  // 3. Trạng thái tải thành công, chứa data
  const factory LocationDataState.loaded({
    required AirQualityData airQualityData,
    required WeatherData weatherData,
  }) = _LocationDataLoaded;
  
  // 4. Trạng thái lỗi
  const factory LocationDataState.error({
    required String message,
  }) = _LocationDataError;
}