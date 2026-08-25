import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/location_details.dart';

part 'location_state.freezed.dart';

enum LocationStatus { initial, loading, success, failure }

@freezed
sealed class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationInitial;
  const factory LocationState.loading({
    required String requestedCity,
    LocationDetails? previousDetails,
  }) = LocationLoading;
  const factory LocationState.success({
    required String requestedCity,
    required LocationDetails details,
  }) = LocationSuccess;
  const factory LocationState.failure({
    required String requestedCity,
    required String error,
    LocationDetails? previousDetails,
  }) = LocationFailure;
}

extension LocationStateData on LocationState {
  LocationStatus get status => switch (this) {
    LocationInitial() => LocationStatus.initial,
    LocationLoading() => LocationStatus.loading,
    LocationSuccess() => LocationStatus.success,
    LocationFailure() => LocationStatus.failure,
  };
  String? get requestedCity => switch (this) {
    LocationInitial() => null,
    LocationLoading(:final requestedCity) => requestedCity,
    LocationSuccess(:final requestedCity) => requestedCity,
    LocationFailure(:final requestedCity) => requestedCity,
  };
  LocationDetails? get details => switch (this) {
    LocationInitial() => null,
    LocationLoading(:final previousDetails) => previousDetails,
    LocationSuccess(:final details) => details,
    LocationFailure(:final previousDetails) => previousDetails,
  };
  String? get error => switch (this) {
    LocationFailure(:final error) => error,
    _ => null,
  };
}
