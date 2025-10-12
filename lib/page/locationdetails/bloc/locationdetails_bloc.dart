import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/geocoding.dart';
import '../../../api/weather.dart';
import 'locationdetails_event.dart';
import 'locationdetails_state.dart';

class LocationDetailsBloc
    extends Bloc<LocationDetailsEvent, LocationDetailsState> {
  final WeatherApi api;
  LocationDetailsBloc(this.api) : super(LocationDetailsInitial) {
    on<LocationDetailsRequested>(_onRequested);
    on<LocationDetailsRefreshed>(_onRefreshed);
  }

  Future<void> _onRequested(
    LocationDetailsRequested e,
    Emitter<LocationDetailsState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final weather = await api.fetchForecastWeather(city: e.city);
      final loc = weather['location'] as Map<String, dynamic>;
      final lat = (loc['lat'] as num).toDouble();
      final lon = (loc['lon'] as num).toDouble();
      final street = await getStreetFromLatLng(lat, lon);
      emit(state.copyWith(loading: false, weather: weather, street: street));
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  Future<void> _onRefreshed(
    LocationDetailsRefreshed e,
    Emitter<LocationDetailsState> emit,
  ) async {
    final w = state.weather;
    if (w == null) return;
    final city = (w['location']?['name'] as String?) ?? '';
    if (city.isEmpty) return;
    add(LocationDetailsRequested(city));
  }
}
