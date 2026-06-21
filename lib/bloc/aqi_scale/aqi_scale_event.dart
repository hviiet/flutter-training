abstract class AqiScaleEvent {}

class LoadAqiScale extends AqiScaleEvent {
  final String cityName;

  LoadAqiScale({required this.cityName});
}