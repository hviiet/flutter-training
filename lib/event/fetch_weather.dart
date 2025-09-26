abstract class WeatherEvent {}

class FetchWeatherAndAirQuality extends WeatherEvent {
  final String cityName;
  final int days;
  final String aqi;
  final String alerts;
  final String weatherKey;
  final String aqiKey;
  
  FetchWeatherAndAirQuality({
    this.cityName = "Da Nang",
    this.days = 12,
    this.aqi = "no",
    this.alerts = "no",
    this.weatherKey = "f182670201c94a9889183956251609",
    this.aqiKey = "7c00a5380068b70eda1a310deb848bf42f86d786", 
  });
  
  
  
}
