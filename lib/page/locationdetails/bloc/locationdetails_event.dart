abstract class LocationDetailsEvent {}

class LocationDetailsRequested extends LocationDetailsEvent {
  final String city;
  LocationDetailsRequested(this.city);
}

class LocationDetailsRefreshed extends LocationDetailsEvent {}
