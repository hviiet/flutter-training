import 'package:flutter/material.dart';

import '../models/forecast.dart';
import '../models/weather_status.dart';
import 'aqi_status_icon.dart';

class ForecastItemCard extends StatelessWidget {
  final Forecast forecast;

  const ForecastItemCard({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
      margin: const EdgeInsets.only(right: 5.0, left: 5.0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          Text(
            forecast.day,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(90, 90, 90, 1.0),
            ),
          ),

          const SizedBox(height: 6.0),

          AqiStatusIcon(aqi: forecast.aqi, size: 24.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                forecast.aqi.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),

              const SizedBox(width: 2.0),

              Text(
                'AQI',
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Color.fromRGBO(90, 90, 90, 1.0),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1.0),
          const Divider(               
            thickness: 1.0, 
            color: Color.fromRGBO(213, 210, 210, 1)
          ),
          const SizedBox(height: 1.0),

          Icon(
            forecast.weatherStatus.getIcon,
            size: 24.0,
            color: forecast.weatherStatus.getColor,
          ),

          const SizedBox(height: 3.0),

          Text(
            '${forecast.temperature}°C',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(17, 24, 39, 1.0),
            ),
          )

        ],
      ),
    );
  }
}
