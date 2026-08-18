import 'package:equatable/equatable.dart';

import '../../models/location_details.dart';

enum LocationStatus { initial, loading, success, failure }

class LocationState extends Equatable {
  final LocationStatus status;
  final LocationDetails? details;
  final String? requestedCity;
  final String? error;

  const LocationState({
    this.status = LocationStatus.initial,
    this.details,
    this.requestedCity,
    this.error,
  });

  LocationState copyWith({
    LocationStatus? status,
    LocationDetails? details,
    String? requestedCity,
    String? error,
    bool clearError = false,
  }) {
    return LocationState(
      status: status ?? this.status,
      details: details ?? this.details,
      requestedCity: requestedCity ?? this.requestedCity,
      error: clearError ? null : error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, details, requestedCity, error];
}
