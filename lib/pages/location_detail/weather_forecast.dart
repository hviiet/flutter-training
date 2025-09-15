import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/location_detail/weather_forecast_item.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  final List<Map<String,dynamic>> weatherData = [
    {"date": "THU 11 NOV 21", "isToday": true, "isTomorrow": false, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
    {"date": "FRI 12 NOV 21", "isToday": false, "isTomorrow": true, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
    {"date": "SAT 13 NOV 21", "isToday": false, "isTomorrow": false, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
    {"date": "SAT 14 NOV 21", "isToday": false, "isTomorrow": false, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
    {"date": "SAT 15 NOV 21", "isToday": false, "isTomorrow": false, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
    {"date": "SAT 16 NOV 21", "isToday": false, "isTomorrow": false, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
    {"date": "SAT 17 NOV 21", "isToday": false, "isTomorrow": false, "maxTemp": 25, "minTemp": 20, "icon": Icons.cloud},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Weather Forecast",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "SF Pro Display",
                    letterSpacing: 0
                  ),
                ),
                Text("Next 7 days",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    letterSpacing: 0,
                    color: Color(0xB8000000)
                  ),
                ),
              ],
            ),
            Column(
              spacing: 4,
              children: weatherData.map((e) {
                return WeatherForecastItem(
                  date: e["date"], 
                  isToday: e["isToday"], 
                  isTomorrow: e["isTomorrow"], 
                  maxTemp: e["maxTemp"], 
                  minTemp: e["minTemp"], 
                  icon: e["icon"]
                );
              },).toList(),
            )
          ],
        ),
      ),
    );
  }
}