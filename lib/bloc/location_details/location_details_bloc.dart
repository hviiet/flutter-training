import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_event.dart';
import 'package:flutter_training/services/weather.dart';
import 'package:flutter_training/models/weather_data.dart';

class LocationDetailsBloc extends Bloc<LocationDetailsEvent, LocationDetailsState> {
  final WeatherApiService weatherService;
  
  // Cache for storing location data
  final Map<String, WeatherData> _cache = {};
  String? _lastLoadedLocation;

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
    final location = event.location.trim();
    
    // Check cache first - if data exists and it's the same location, use cached data
    if (_cache.containsKey(location) && _lastLoadedLocation == location) {
      emit(LocationDetailsLoaded(weatherData: _cache[location]!));
      return;
    }
    
    // Only show loading if we don't have data yet
    if (state is! LocationDetailsLoaded || _lastLoadedLocation != location) {
      emit(LocationDetailsLoading());
    }
    
    await _fetchLocationData(location, emit);
  }

  Future<void> _onRefreshLocationDetails(
    RefreshLocationDetails event,
    Emitter<LocationDetailsState> emit,
  ) async {
    final location = event.location.trim();
    // Don't show loading state on refresh, but clear cache for this location
    _cache.remove(location);
    await _fetchLocationData(location, emit);
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

      // Store in cache
      _cache[location] = weatherData;
      _lastLoadedLocation = location;

      emit(LocationDetailsLoaded(
        weatherData: weatherData,
      ));
    } catch (e) {
      emit(LocationDetailsError(message: e.toString()));
    }
  }
  
  // Helper method to check if data exists for a location
  bool hasDataFor(String location) {
    return _cache.containsKey(location.trim());
  }
  
  // Helper method to clear cache (useful for testing)
  void clearCache() {
    _cache.clear();
    _lastLoadedLocation = null;
  }
}
