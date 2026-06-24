import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/models/city_data.dart';

part 'city_state.freezed.dart';

@freezed
abstract class CityState with _$CityState {

  const factory CityState({
    @Default(false) bool isLoading,
    String? error,
    @Default({}) Map<String, CityData> citiesData,
  }) = _CityState;

}