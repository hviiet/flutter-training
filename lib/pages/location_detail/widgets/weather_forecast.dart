import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/forecast_day.dart';
import 'package:flutter_application_1/pages/location_detail/widgets/weather_forecast_item.dart';

class WeatherForecast extends StatefulWidget {
  final List<ForecastDay> weatherData;
  const WeatherForecast({super.key, required this.weatherData});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
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
                Text("Next ${widget.weatherData.length} days",
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
              children: widget.weatherData.map((e) {
                return WeatherForecastItem(
                  date: e.date!, 
                  isToday: e.date == widget.weatherData[0].date, 
                  isTomorrow: e.date == widget.weatherData[1].date, 
                  maxTemp: e.maxTemp!, 
                  minTemp: e.minTemp!, 
                  icon: e.icon!
                );
              },).toList(),
            )
          ],
        ),
      ),
    );
  }
}