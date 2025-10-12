abstract class AQIScaleEvent {}

class AQIRequestedByCity extends AQIScaleEvent {
  final String city;
  AQIRequestedByCity(this.city);
}

class AQIRequestedByGeo extends AQIScaleEvent {
  final double lat;
  final double lon;
  AQIRequestedByGeo(this.lat, this.lon);
}

class AQIRequestedHere extends AQIScaleEvent {}

class AQIRefreshed extends AQIScaleEvent {}
