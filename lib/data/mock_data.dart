import '../models/forecast.dart';
import '../models/user_profile.dart';
import '../models/weather_location.dart';
import '../models/weather_status.dart';

class MockData {
  static final UserProfile userProfile = UserProfile(
    name: 'Anamoul Rouf',
    email: 'anamoulrouf.bd@gmail.com',
    avatarUrl: 'assets/images/avatar.png',
  );

  static final WeatherLocation mainLocation = WeatherLocation(
    name: 'Church Street Square',
    city: 'Birmingham',
    aqi: 3,
    temperature: 19,
    weatherStatus: WeatherStatus.rainShower,
    feelsLike: 11,
  );

  static final List<Forecast> forecasts = [
    Forecast(
      day: '12/06',
      aqi: 1,
      temperature: 20,
      weatherStatus: WeatherStatus.rainShower,
    ),
    Forecast(
      day: '13/06',
      aqi: 2,
      temperature: 21,
      weatherStatus: WeatherStatus.cloudy,
    ),
    Forecast(
      day: '14/06',
      aqi: 3,
      temperature: 22,
      weatherStatus: WeatherStatus.partlyCloudy,
    ),
    Forecast(
      day: '15/06',
      aqi: 2,
      temperature: 21,
      weatherStatus: WeatherStatus.sunny,
    ),
    Forecast(
      day: '16/06',
      aqi: 1,
      temperature: 20,
      weatherStatus: WeatherStatus.partlyCloudy,
    ),
    Forecast(
      day: '17/06',
      aqi: 2,
      temperature: 20,
      weatherStatus: WeatherStatus.sunny,
    ),
    Forecast(
      day: '18/06',
      aqi: 4,
      temperature: 23,
      weatherStatus: WeatherStatus.cloudy,
    ),
    Forecast(
      day: '19/06',
      aqi: 5,
      temperature: 24,
      weatherStatus: WeatherStatus.rainShower,
    ),
  ];

  static final List<WeatherLocation> smallLocations = [
    WeatherLocation(
      name: 'Work',
      city: 'Coventry ST, Birmingham',
      aqi: 3,
      temperature: 25,
      weatherStatus: WeatherStatus.rainShower,
      feelsLike: 25,
    ),
    WeatherLocation(
      name: 'Home',
      city: 'Coventry ST, Birmingham',
      aqi: 2,
      temperature: 22,
      weatherStatus: WeatherStatus.rainShower,
      feelsLike: 22,
    ),
  ];

  static final List<WeatherLocation> largeLocations = [
    WeatherLocation(
      name: 'Edmund Street',
      city: 'Birmingham',
      aqi: 5,
      temperature: 21,
      weatherStatus: WeatherStatus.snow,
      feelsLike: 21,
    ),
    WeatherLocation(
      name: 'Berkley Street',
      city: 'Birmingham',
      aqi: 4,
      temperature: 21,
      weatherStatus: WeatherStatus.snow,
      feelsLike: 21,
    ),
    WeatherLocation(
      name: 'New Street',
      city: 'Birmingham',
      aqi: 6,
      temperature: 22,
      weatherStatus: WeatherStatus.cloudy,
      feelsLike: 22,
    ),
    WeatherLocation(
      name: 'Victoria Square',
      city: 'Birmingham',
      aqi: 2,
      temperature: 20,
      weatherStatus: WeatherStatus.sunny,
      feelsLike: 20,
    ),
  ];
}