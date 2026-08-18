import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/location_repository.dart';
import 'location_state.dart';

export 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository repository;

  LocationCubit(this.repository) : super(const LocationState());

  Future<void> loadLocation(
    String city, {
    bool forceRefresh = false,
  }) async {
    final normalizedCity = city.trim();
    if (normalizedCity.isEmpty) return;

    final isSameCity = state.requestedCity?.toLowerCase() ==
        normalizedCity.toLowerCase();

    // Dùng dữ liệu đang giữ nếu người dùng mở lại đúng thành phố cũ.
    if (!forceRefresh && isSameCity && state.details != null) return;

    emit(
      state.copyWith(
        status: LocationStatus.loading,
        requestedCity: normalizedCity,
        clearError: true,
      ),
    );

    try {
      final details = await repository.getLocationDetails(normalizedCity);
      emit(
        LocationState(
          status: LocationStatus.success,
          details: details,
          requestedCity: normalizedCity,
        ),
      );
    } catch (error) {
      emit(
        LocationState(
          status: LocationStatus.failure,
          details: isSameCity ? state.details : null,
          requestedCity: normalizedCity,
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> refreshLocation() async {
    final city = state.requestedCity;
    if (city == null) return;
    await loadLocation(city, forceRefresh: true);
  }
}
