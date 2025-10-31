import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '/blocs/location_data_cubit.dart';
import '/blocs/location_data_state.dart';
import '/models/air_quality_model.dart';
import '/models/weather_model.dart';
import '/API/weather_api.dart';
import 'aqi_scale.dart';

class AirQualityPainter extends CustomPainter {
  final double progress;
  final Color color;

  AirQualityPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: size.width, height: size.height);

    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2) // Dùng màu động
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    const startAngle = 3 * pi / 4;
    const sweepAngle = 3 * pi / 2;

    canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);
    canvas.drawArc(rect, startAngle, sweepAngle * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant AirQualityPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

class LocationDetailsScreen extends StatefulWidget {
  final String city;

  const LocationDetailsScreen({Key? key, this.city = 'Hanoi'}) : super(key: key);

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  Map<String, dynamic> _getAqiInfo(int aqi) {
    int scaleValue;
    String status;
    Color color;

    if (aqi <= 50) {
      scaleValue = (1 + (aqi / 50 * 2)).round().clamp(1, 3);
      status = 'Low';
      color = Colors.green;
    }
    else if (aqi <= 100) {
      scaleValue = (4 + ((aqi - 51) / 49 * 2)).round().clamp(4, 6);
      status = 'Moderate';
      color = Colors.orange;
    }
    else if (aqi <= 150) {
      scaleValue = (7 + ((aqi - 101) / 49 * 1)).round().clamp(7, 8);
      status = 'High';
      color =  Colors.red;
    }
    else { 
      scaleValue = (aqi <= 200) ? 9 : 10;
      status = 'Very High';
      color = Colors.purple;
    }

    return {
      'status': status,
      'color': color,
      'scaleValue': scaleValue, // <-- Số 1-10 mới
      'progress': (scaleValue / 10.0).clamp(0.1, 1.0)
    };
  }

  double _normalizePollutant(double value) {
    return (value / 100.0).clamp(0.0, 1.0);
  }

  String _mapConditionToIconName(String apiCondition) {
    final condition = apiCondition.toLowerCase();
    if (condition.contains('sunny') || condition.contains('clear')) {
      return 'sunny';
    }
    if (condition.contains('rain') && condition.contains('shower')) {
      return 'rain_shower';
    }
    if (condition.contains('rain') || condition.contains('drizzle')) {
      return 'rain_drop';
    }
    if (condition.contains('cloudy') || condition.contains('overcast') || condition.contains('mist')) {
      return 'cloud';
    }
    return 'cloud';
  }

  String _formatDate(String dateStr) {
    try {
      final DateTime date = DateTime.parse(dateStr);
      // Định dạng: THU 11 NOV 21
      return DateFormat('E dd MMM yy').format(date).toUpperCase();
    } catch (e) {
      return dateStr;
    }
  }

  String _getDailyLabel(int index) {
    if (index == 0) return 'TODAY';
    if (index == 1) return 'TOMORROW';
    return '';
  }

  String _getWeatherIconPath(String iconName) {
    switch (iconName) {
      case 'cloud':
        return 'assets/images/cloud.png';
      case 'rain_drop':
        return 'assets/images/rain_drop.png';
      case 'rain_shower':
        return 'assets/images/rain_shower.png';
      case 'sunny':
        return 'assets/images/sunny.png';
      default:
        return 'assets/images/cloud.png';
    }
  }

  String _getAqiFaceIconPath(String level) {
    switch (level) {
      case 'Low':
        return 'assets/images/low.png';
      case 'Moderate':
        return 'assets/images/moderate.png'; 
      case 'High':
        return 'assets/images/high.png'; 
      case 'Very High':
        return 'assets/images/very_high.png';
      default:
        return 'assets/images/low.png';
    }
}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationDataCubit(
        RepositoryProvider.of<WeatherApiService>(context),
      )..fetchData(widget.city),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: const Text('Current Location', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.location_searching_outlined, color: Colors.black),
            ),
          ],
        ),
        // Dùng BlocBuilder để build UI theo state
        body: BlocBuilder<LocationDataCubit, LocationDataState>(
          builder: (context, state) {
            if (state is LocationDataLoading || state is LocationDataInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is LocationDataError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Lỗi: ${state.message}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            if (state is LocationDataLoaded) {
              final aqData = state.airQualityData;
              final weatherData = state.weatherData;
              // Lấy thông tin AQI động
              final aqiInfo = _getAqiInfo(aqData.aqi.toInt());

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      // Truyền dữ liệu động
                      _buildLocationHeader(aqData),
                      const SizedBox(height: 20),
                      // Truyền dữ liệu động
                      _buildAirQualityCard(context, aqData, aqiInfo, weatherData),
                      const SizedBox(height: 20),
                      // Truyền dữ liệu động
                      _buildWeatherCard(context, weatherData),
                      const SizedBox(height: 20),
                      // Giữ nguyên (chưa có data 7 ngày AQI từ API này)
                      _buildAqForecastCard(context),
                      const SizedBox(height: 20),
                      // Truyền dữ liệu động
                      _buildWeatherForecastCard(context, weatherData.dailyForecast),
                      const SizedBox(height: 20),
                      // Giữ nguyên (dữ liệu tĩnh)
                      _buildRecommendationsCard(context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: Text('Đã xảy ra lỗi không xác định.'));
          },
        ),
      ),
    );
  }

  String _shortCityName(String fullName) {
  final name = fullName.split(',').first.trim();
  if (name.isEmpty) return fullName;
  return name[0].toUpperCase() + name.substring(1);
}

  Widget _buildLocationHeader(AirQualityData aqData) {
    final cityName = _shortCityName(aqData.cityName);
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                 cityName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAirQualityCard(BuildContext context, AirQualityData aqData, Map<String, dynamic> aqiInfo, WeatherData weatherData) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Air Quality',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AqiScaleScreen(
                          aqData: aqData,
                          weatherData: weatherData,
                        ),
                      ),
                    );
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Icon(Icons.info_rounded, color: Colors.blue, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(150, 150),
                    painter: AirQualityPainter(
                      progress: aqiInfo['progress'],
                      color: aqiInfo['color'], 
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            aqiInfo['scaleValue'].toString(),
                            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('AQI', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _getAqiFaceIconPath(aqiInfo['status']), 
                            width: 20, 
                            height: 20, 
                            color: aqiInfo['color']
                          ),
                          const SizedBox(width: 4),
                          Text(
                            aqiInfo['status'], 
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: aqiInfo['color']),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPollutantItem(context, 'O3', 'ug/m3', aqData.o3.toStringAsFixed(1), _normalizePollutant(aqData.o3), aqiInfo['color']),
                _buildPollutantItem(context, 'PM10', 'ug/m3', aqData.pm10.toStringAsFixed(1), _normalizePollutant(aqData.pm10), aqiInfo['color']),
                _buildPollutantItem(context, 'NO', 'ug/m3', aqData.no.toStringAsFixed(1), _normalizePollutant(aqData.no), aqiInfo['color']),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPollutantItem(context, 'NO2', 'ug/m3', aqData.no2.toStringAsFixed(1), _normalizePollutant(aqData.no2), aqiInfo['color']),
                _buildPollutantItem(context, 'PM1', 'ug/m3', aqData.pm1.toStringAsFixed(1), _normalizePollutant(aqData.pm1), aqiInfo['color']),
                _buildPollutantItem(context, 'PM2.5', 'ug/m3', aqData.pm25.toStringAsFixed(1), _normalizePollutant(aqData.pm25), aqiInfo['color']),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPollutantItem(BuildContext context, String name, String unit, String value, double level, Color color) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 8,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50 * level,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '$name ', style: const TextStyle(color: Colors.grey)),
                      TextSpan(text: '($unit)', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard(BuildContext context, WeatherData weatherData) {
    String iconName = _mapConditionToIconName(weatherData.condition);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weather', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('NOW', style: TextStyle(color: Colors.grey)),
                    Text(
                      weatherData.condition,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Feels like ${weatherData.feelsLike.round()}°C',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weatherData.currentTemp.round().toString(),
                      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('°C', style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      _getWeatherIconPath(iconName),
                      width: 40,
                      height: 40,
                      color: Colors.blue[400],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherData.hourlyForecast.length,
                      itemBuilder: (context, index) {
                        final forecast = weatherData.hourlyForecast[index];
                        final itemIconName = _mapConditionToIconName(forecast.condition);
                        return _buildHourlyForecastItem(
                          forecast.time,
                          itemIconName,
                          '${forecast.temp.round()}°C',
                          index == 0,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPageIndicator(true),
                      _buildPageIndicator(false),
                      _buildPageIndicator(false),
                      _buildPageIndicator(false),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildHourlyForecastItem(String time, String iconCondition, String temp, bool isSelected) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(_getWeatherIconPath(iconCondition),
                width: 32, height: 32, color: isSelected ? Colors.white : Colors.blue[400]),
            Text(temp, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            Text(time, style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildAqForecastCard(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('AQ Forcast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Text('AQI', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward, size: 16, color: Colors.blue),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildAqBarItem('SAT', 2, 0.2, Colors.green),
                  _buildAqBarItem('SUN', 5, 0.5, Colors.orange),
                  _buildAqBarItem('MON', 7, 0.7, Colors.red),
                  _buildAqBarItem('TUE', 4, 0.4, Colors.yellow),
                  _buildAqBarItem('WED', 3, 0.3, Colors.green),
                  _buildAqBarItem('THU', 8, 0.8, Colors.red),
                  _buildAqBarItem('FRI', 2, 0.2, Colors.green),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildAqBarItem(String day, int aqi, double heightFactor, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withOpacity(0.8), shape: BoxShape.circle),
          child: Text(aqi.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Container(
          height: 100 * heightFactor,
          width: 20,
          decoration: BoxDecoration(color: color.withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(height: 8),
        Text(day),
      ],
    );
  }

  Widget _buildWeatherForecastCard(BuildContext context, List<DailyForecast> dailyForecasts) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weather Forcast', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Next 7 days', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            // Dùng ListView.builder thay vì Column cứng
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Tắt cuộn của ListView
              itemCount: dailyForecasts.length,
              itemBuilder: (context, index) {
                final forecast = dailyForecasts[index];
                final iconName = _mapConditionToIconName(forecast.condition);
                return _buildWeatherForecastItem(
                  _formatDate(forecast.date),
                  _getDailyLabel(index),
                  forecast.maxTemp.round().toString(),
                  forecast.minTemp.round().toString(),
                  iconName,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherForecastItem(String date, String dayLabel, String tempUp, String tempDown, String iconCondition) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                if (dayLabel.isNotEmpty) Text(dayLabel, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              Text('$tempUp°', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Icon(Icons.arrow_upward, size: 14, color: Colors.red),
              const SizedBox(width: 8),
              Text('$tempDown°', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Icon(Icons.arrow_downward, size: 14, color: Colors.blue),
            ],
          ),
          const SizedBox(width: 16),
          Image.asset(_getWeatherIconPath(iconCondition), width: 32, height: 32, color: Colors.blue[400]),
        ],
      ),
    );
  }

  Widget _buildRecommendationsCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recommendations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRecommendationItem(
                  iconPath: 'assets/images/low.png',
                  title: 'General',
                  text: 'With this level of air quality, you have no limitations. Enjoy the ...'),
              const SizedBox(width: 16),
              _buildRecommendationItem(
                  iconPath: 'assets/images/low.png',
                  title: 'Asthma',
                  text: 'If you start to feel respiratory symptoms such as coughing or ...'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRecommendationItem({required String iconPath, required String title, required String text}) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(iconPath, width: 24, height: 24),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Text(text, maxLines: 2, overflow: TextOverflow.ellipsis),
          const Spacer(),
          const Text('Show More', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}