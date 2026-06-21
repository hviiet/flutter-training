import '../../models/location_detail_data.dart';

abstract class LocationDetailState {}

class LocationDetailInitial extends LocationDetailState {}

class LocationDetailLoading extends LocationDetailState {}

class LocationDetailLoaded extends LocationDetailState {
  final LocationDetailData locationDetailData;

  LocationDetailLoaded(this.locationDetailData);
}

class LocationDetailError extends LocationDetailState {
  final String message;

  LocationDetailError(this.message);
} 