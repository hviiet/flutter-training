import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/air_quality.dart';
import 'aqiscale_event.dart';
import 'aqiscale_state.dart';

class AQIScaleBloc extends Bloc<AQIScaleEvent, AQIScaleState> {
  final AirQualityApi api;
  AQIScaleBloc(this.api) : super(AQIScaleInitial) {
    on<AQIRequestedByCity>(_onCity);
    on<AQIRequestedByGeo>(_onGeo);
    on<AQIRequestedHere>(_onHere);
    on<AQIRefreshed>(_onRefresh);
  }

  Future<void> _onCity(
    AQIRequestedByCity e,
    Emitter<AQIScaleState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final feed = await api.fetchCity(city: e.city);
      emit(state.copyWith(loading: false, feed: feed));
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  Future<void> _onGeo(AQIRequestedByGeo e, Emitter<AQIScaleState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final feed = await api.fetchGeo(lat: e.lat, lon: e.lon);
      emit(state.copyWith(loading: false, feed: feed));
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  Future<void> _onHere(AQIRequestedHere e, Emitter<AQIScaleState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final feed = await api.fetchHere();
      emit(state.copyWith(loading: false, feed: feed));
    } catch (err) {
      emit(state.copyWith(loading: false, error: err.toString()));
    }
  }

  Future<void> _onRefresh(AQIRefreshed e, Emitter<AQIScaleState> emit) async {
    final f = state.feed;
    if (f == null) return;
    final name = (f['data']?['city']?['name'] as String?) ?? '';
    if (name.isNotEmpty) {
      add(AQIRequestedByCity(name));
      return;
    }
    add(AQIRequestedHere());
  }
}
