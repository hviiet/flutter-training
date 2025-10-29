import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_quality/blocs/location_data/location_data_cubit.dart';
import 'package:air_quality/blocs/location_data/location_data_state.dart';
import 'package:air_quality/models/air_quality_model.dart';
import 'package:air_quality/models/weather_model.dart';
import 'package:air_quality/services/weather_api_service.dart';
import 'location_details_screen.dart';

final List<Map<String, dynamic>> otherLocationsData = [
  { 'title': 'Edmund Street', 'address': 'Birmingham', 'aqi': 3, 'temp': 25, 'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20), },
  { 'title': 'Berkley Street', 'address': 'Birmingham', 'aqi': 4, 'temp': 30, 'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20), },
  { 'title': 'Hehe Street', 'address': 'Birmingham', 'aqi': 5, 'temp': 33, 'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20), },
  { 'title': 'Haha Street', 'address': 'Birmingham', 'aqi': 4, 'temp': 30, 'rightIcon': Icon(Icons.bookmark, color: Colors.blueAccent, size: 20), },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _mainPageController = PageController();
  int _mainCurrentPage = 0;

  final PageController _locationsPageController = PageController();
  int _locationsCurrentPage = 0;

  late final PageController _otherLocationsPageController;
  int _otherLocationsCurrentPage = 0;

  final String defaultCity = 'Hanoi';

  @override
  void initState() {
    super.initState();
    _otherLocationsPageController = PageController(viewportFraction: 0.85);

    _mainPageController.addListener(() {
      int nextPage = _mainPageController.page!.round();
      if (_mainCurrentPage != nextPage) {
        setState(() {
          _mainCurrentPage = nextPage;
        });
      }
    });

    _locationsPageController.addListener(() {
      if (_locationsPageController.page?.round() != _locationsCurrentPage) {
        setState(() {
          _locationsCurrentPage = _locationsPageController.page!.round();
        });
      }
    });

    _otherLocationsPageController.addListener(() {
      if (_otherLocationsPageController.page?.round() !=
          _otherLocationsCurrentPage) {
        setState(() {
          _otherLocationsCurrentPage = _otherLocationsPageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    _locationsPageController.dispose();
    _otherLocationsPageController.dispose();
    super.dispose();
  }

  Map<String, dynamic> _getAqiInfo(int aqi) {
    int scaleValue; String status; Color color;
    if (aqi <= 50) { scaleValue = (1 + (aqi / 50 * 2)).round().clamp(1, 3); status = 'Low'; color = Colors.green; }
    else if (aqi <= 100) { scaleValue = (4 + ((aqi - 51) / 49 * 2)).round().clamp(4, 6); status = 'Moderate'; color = Colors.orange; }
    else if (aqi <= 150) { scaleValue = (7 + ((aqi - 101) / 49 * 1)).round().clamp(7, 8); status = 'High'; color = Colors.red; }
    else { scaleValue = (aqi <= 200) ? 9 : 10; status = 'Very High'; color = Colors.purple; }
    return { 'status': status, 'color': color, 'scaleValue': scaleValue };
  }

  String _mapConditionToIconName(String apiCondition) {
    final condition = apiCondition.toLowerCase();
    if (condition.contains('sunny') || condition.contains('clear')) return 'sunny';
    if (condition.contains('rain') && condition.contains('shower')) return 'rain_shower';
    if (condition.contains('rain') || condition.contains('drizzle')) return 'rain_drop';
    if (condition.contains('cloudy') || condition.contains('overcast') || condition.contains('mist')) return 'cloud';
    return 'cloud';
  }

   String _getWeatherIconPath(String iconName) {
    switch (iconName) {
      case 'cloud': return 'assets/images/cloud.png';
      case 'rain_drop': return 'assets/images/rain_drop.png';
      case 'rain_shower': return 'assets/images/rain_shower.png';
      case 'sunny': return 'assets/images/sunny.png';
      default: return 'assets/images/cloud.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationDataCubit(
        RepositoryProvider.of<WeatherApiService>(context),
      )..fetchData(defaultCity),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: Builder(
          builder: (builderContext) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back 👋',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'User',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A1F44),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      BlocBuilder<LocationDataCubit, LocationDataState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loaded: (aqData, weatherData) {
                              final aqiInfo = _getAqiInfo(aqData.aqi);
                              return SizedBox(
                                height: 350,
                                child: PageView(
                                  controller: _mainPageController,
                                  children: [
                                    _MainWeatherCard(
                                      aqData: aqData,
                                      weatherData: weatherData,
                                      aqiInfo: aqiInfo,
                                      getWeatherIconPath: _getWeatherIconPath,
                                      mapConditionToIconName: _mapConditionToIconName,
                                    )
                                  ],
                                ),
                              );
                            },
                            error: (message) => SizedBox(
                              height: 350,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text('Lỗi: $message', style: const TextStyle(color: Colors.red)),
                                ),
                              ),
                            ),
                            orElse: () => const SizedBox(
                              height: 350,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),


                      SizedBox(
                        height: 110,
                        child: PageView(
                          controller: _locationsPageController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: const [
                                  Expanded(child: _LocationCard.workHome(
                                    title: 'Work', address: 'Coventry ST, Birmingham', aqi: 3, temp: 25,
                                  )),
                                  SizedBox(width: 16),
                                  Expanded(child: _LocationCard.workHome(
                                    title: 'Home', address: 'Coventry ST, Birmingham', aqi: 2, temp: 22,
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      SizedBox(
                        height: 110,
                        child: PageView.builder(
                          controller: _otherLocationsPageController,
                          clipBehavior: Clip.none,
                          itemCount: otherLocationsData.length,
                          itemBuilder: (context, index) {
                            final location = otherLocationsData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: _LocationCard.otherLocation(
                                title: location['title'],
                                address: location['address'],
                                aqi: location['aqi'],
                                temp: location['temp'],
                                rightIcon: location['rightIcon'],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildPageIndicator(_otherLocationsCurrentPage, otherLocationsData.length),
                      const SizedBox(height: 24),

                      Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () {
                          final currentState = builderContext.read<LocationDataCubit>().state;
                          currentState.maybeWhen(
                            loaded: (aqData, weatherData) {
                              Navigator.push(
                                builderContext,
                                MaterialPageRoute(
                                  builder: (_) => LocationDetailsScreen(
                                    aqData: aqData,
                                    weatherData: weatherData,
                                  )
                                )
                              );
                            },
                            orElse: () {
                              ScaffoldMessenger.of(builderContext).showSnackBar(
                                const SnackBar(content: Text('Vui lòng chờ tải xong dữ liệu'))
                              );
                            }
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 15,
                                spreadRadius: 2,
                              )
                            ]
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.info_outline, color: Colors.white, size: 20),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Text('Detail Air Quality', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                              ),
                              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.blueAccent),
                            ],
                          ),
                        ),
                      ),
                    ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int currentPage, int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        bool isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.blueAccent : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _MainWeatherCard extends StatelessWidget {
  final AirQualityData aqData;
  final WeatherData weatherData;
  final Map<String, dynamic> aqiInfo;
  final String Function(String) getWeatherIconPath;
  final String Function(String) mapConditionToIconName;

  const _MainWeatherCard({
    required this.aqData,
    required this.weatherData,
    required this.aqiInfo,
    required this.getWeatherIconPath,
    required this.mapConditionToIconName,
  });

  @override
  Widget build(BuildContext context) {
    final weatherIconName = mapConditionToIconName(weatherData.condition);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.blue.shade100.withOpacity(0.5), shape: BoxShape.circle),
              child: const Icon(Icons.location_on, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    aqData.cityName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Image.asset(
                    getWeatherIconPath(weatherIconName),
                    width: 40, height: 40,
                    color: Colors.blueAccent
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black, fontFamily: 'sans-serif', fontSize: 14),
                          children: [
                            TextSpan(
                                text: '${weatherData.currentTemp.round()}',
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const TextSpan(
                                text: '°C',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            weatherData.condition,
                            style: const TextStyle(color: Colors.black, fontSize: 14)),
                          Text(
                            ' Feels like ${weatherData.feelsLike.round()}°C',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Row(children: [
                  Text(
                    '${aqiInfo['scaleValue']}',
                    style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  const Text('AQI', style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(width: 8),
                   _AqiIcon(aqi: aqData.aqi)
                ])
              ],
            ),
          ),
          Text('Forecast', style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          Expanded(
            child: weatherData.hourlyForecast.isEmpty
                ? const Center(child: Text('No hourly data'))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weatherData.hourlyForecast.length,
                    itemBuilder: (context, index){
                       final forecast = weatherData.hourlyForecast[index];
                       final itemIconName = mapConditionToIconName(forecast.condition);
                       final int hardcodedAqi = 50 + (index * 10 % 150);
                       return Padding(
                         padding: const EdgeInsets.only(right: 8.0),
                         child: _ForecastItem(
                            time: forecast.time,
                            temp: forecast.temp,
                            iconPath: getWeatherIconPath(itemIconName),
                            aqi: hardcodedAqi,
                         ),
                       );
                    }
                  ),
          )
        ],
      ),
    );
  }
}

class _ForecastItem extends StatelessWidget {
  final String time;
  final double temp;
  final String iconPath;
  final int aqi;

  const _ForecastItem({
    required this.time,
    required this.temp,
    required this.iconPath,
    required this.aqi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.bold)),
          _AqiIcon(aqi: aqi, size: 24),
          const SizedBox(height: 2),
          Container(height: 1, width: 30, color: const Color.fromARGB(255, 233, 232, 232)), // Đường kẻ ngang
          const SizedBox(height: 2),
          Image.asset(
             iconPath,
             color: Colors.blue.shade300,
             width: 32,
             height: 32
          ),
          Text(
             '${temp.round()}°C',
             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}

class _LocationCard extends StatelessWidget {
  final String title; final String address; final int aqi;
  final int? temp; final Widget? rightIcon;

  const _LocationCard.workHome({
    required this.title, required this.address, required this.aqi, required this.temp,
  }) : rightIcon = null;

  const _LocationCard.otherLocation({
    required this.title, required this.address, required this.aqi, this.temp, this.rightIcon,
  });

   @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis),
                  Text(address,
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                      overflow: TextOverflow.ellipsis),
                ],
              )),
              if (rightIcon != null) rightIcon!,
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _AqiIcon(aqi: aqi, size: 22),
                  const SizedBox(width: 4),
                  Text('$aqi AQI', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              if (temp != null)
                if (rightIcon != null)
                  Row(
                    children: [
                      Text('$temp°C',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(width: 4),
                      Icon(Icons.cloud_queue_outlined,
                          color: Colors.blue.shade300, size: 20),
                    ],
                  )
                else
                  Row(
                    children: [
                      Icon(Icons.cloud_queue_outlined,
                          color: Colors.blue.shade300, size: 20),
                      const SizedBox(width: 4),
                      Text('$temp°C',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
            ],
          )
        ],
      ),
    );
  }
}

class _AqiIcon extends StatelessWidget {
  final int aqi;
  final double size;
  final bool showArrow;

  const _AqiIcon({required this.aqi, this.size = 28, this.showArrow = false});

  Color _getAqiColor() {
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    if (aqi <= 300) return Colors.purple;
    return Colors.brown;
  }

  IconData _getAqiFaceIcon() {
    if (aqi <= 50) return Icons.sentiment_very_satisfied;
    if (aqi <= 100) return Icons.sentiment_satisfied;
    if (aqi <= 150) return Icons.sentiment_neutral;
    if (aqi <= 200) return Icons.sentiment_dissatisfied;
    return Icons.sentiment_very_dissatisfied;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(color: _getAqiColor(), shape: BoxShape.circle),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(_getAqiFaceIcon(), color: Colors.white, size: size * 0.65),
          if (showArrow)
            Positioned(
              bottom: size * 0.05,
              child: Icon(Icons.arrow_downward, color: Colors.white, size: size * 0.4),
            ),
        ],
      ),
    );
  }
}