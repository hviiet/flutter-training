import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_event.dart';
import 'package:flutter_training/services/weather.dart';

class LocationDetailsBloc extends Bloc<LocationDetailsEvent, LocationDetailsState> {
  final WeatherApiService weatherService;

  LocationDetailsBloc({
    required this.weatherService,
  }) : super(LocationDetailsInitial()) {
    on<LoadLocationDetails>(_onLoadLocationDetails);
    on<RefreshLocationDetails>(_onRefreshLocationDetails);
  }

  Future<void> _onLoadLocationDetails(
    LoadLocationDetails event,
    Emitter<LocationDetailsState> emit,
  ) async {
    emit(LocationDetailsLoading());
    await _fetchLocationData(event.location, emit);
  }

  Future<void> _onRefreshLocationDetails(
    RefreshLocationDetails event,
    Emitter<LocationDetailsState> emit,
  ) async {
    // Don't show loading state on refresh
    await _fetchLocationData(event.location, emit);
  }

  Future<void> _fetchLocationData(
    String location,
    Emitter<LocationDetailsState> emit,
  ) async {
    try {
      // Fetch weather data with AQI included (aqi=yes in API call)
      final weatherData = await weatherService.getWeatherForecast(
        location: location, 
        days: 7,
      );

      emit(LocationDetailsLoaded(
        weatherData: weatherData,
      ));
    } catch (e) {
      emit(LocationDetailsError(message: e.toString()));
    }
  }
}
