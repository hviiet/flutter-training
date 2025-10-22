import 'package:flutter/material.dart';
import 'package:air_quality/models/air_quality_model.dart';
import 'package:air_quality/models/weather_model.dart';

class AqiScaleScreen extends StatelessWidget {
  final AirQualityData aqData;
  final WeatherData weatherData;

  const AqiScaleScreen({
    Key? key,
    required this.aqData,
    required this.weatherData,
  }) : super(key: key);

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
      color = Colors.red;
    } 
    else { 
      scaleValue = (aqi <= 200) ? 9 : 10;
      status = 'Very High';
      color = Colors.purple;
    }
    return {
      'status': status,
      'color': color,
      'scaleValue': scaleValue,
    };
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
    return 'cloud';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text('AQI Scale', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildCurrentStatusHeader(context, aqData, weatherData),
              const SizedBox(height: 20),
              _buildAqiScaleItem(
                level: 'Low',
                color: Colors.green,
                range: '1 to 3',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically affect air quality forecasts within hours or even minutes.',
              ),
              const SizedBox(height: 24),
              _buildAqiScaleItem(
                level: 'Moderate',
                color: Colors.orange,
                range: '4 to 6',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
              ),
              const SizedBox(height: 24),
              _buildAqiScaleItem(
                level: 'High',
                color: Colors.red,
                range: '7 to 8',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
              ),
              const SizedBox(height: 24),
              _buildAqiScaleItem(
                level: 'Very High',
                color: Colors.purple,
                range: '9 to 10',
                description:
                    'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStatusHeader(BuildContext context, AirQualityData aqData, WeatherData weatherData) {
    // Lấy thông tin AQI động
    final aqiInfo = _getAqiInfo(aqData.aqi);
    final weatherIconName = _mapConditionToIconName(weatherData.condition);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          children: [
            // Cột bên trái (Location & Weather)
            Expanded(
              child: Column(
                children: [
                  // Row Location
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.blue, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          aqData.cityName, // Dùng data API
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Row Weather
                  Row(
                    children: [
                      Image.asset(
                        _getWeatherIconPath(weatherIconName), // Dùng data API
                        width: 20,
                        height: 20,
                        color: Colors.blue[400],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${weatherData.currentTemp.round()}°C', // Dùng data API
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(color: Colors.black, fontSize: 14),
                            children: [
                              TextSpan(text: '${weatherData.condition} ', style: const TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                text: 'Feels like ${weatherData.feelsLike.round()}°C', // Dùng data API
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Cột bên phải (AQI)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  aqiInfo['scaleValue'].toString(), // Hiển thị số 1-10
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 2),
                  child: Text('AQI', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  _getAqiFaceIconPath(aqiInfo['status']), 
                  width: 28,
                  height: 28,
                  color: aqiInfo['color'],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAqiScaleItem({
    required String level,
    required Color color,
    required String range,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon bên trái
        Image.asset(
          _getAqiFaceIconPath(level),
          width: 30,
          height: 30,
          color: color,
        ),
        const SizedBox(width: 16),
        // Cột text bên phải
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(level, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Air Quality Index: $range', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(color: Colors.grey),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              const Text('Show More', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}