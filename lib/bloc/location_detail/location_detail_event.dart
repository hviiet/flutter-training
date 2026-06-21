abstract class LocationDetailEvent {}

class LoadLocationDetailEvent extends LocationDetailEvent {
  final String cityName;

  LoadLocationDetailEvent({required this.cityName});
}