import 'package:flutter/material.dart';
import 'package:flutter_training/core/extension/date_extension.dart';

import '../../models/location_detail_data.dart';

class DailyWeatherForecast extends StatelessWidget {
  final List<DailyWeatherForecastItem> dailyForecasts;

  const DailyWeatherForecast({super.key, required this.dailyForecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      //margin: const EdgeInsets.all(6.0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const[
          BoxShadow(
            color:  Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 12.0,
            offset: Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Forecast',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          Text(
            'Next 7 days',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 5.0),

          Column(
            children: dailyForecasts.map((forecast) {
              return _buildDailyForecastItem(forecast);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyForecastItem(DailyWeatherForecastItem forecast) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      margin: const EdgeInsets.only(bottom: 6.0, top: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 10.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                forecast.date,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              forecast.date.isTodayOrTomorrow? Text(
                forecast.date.getDayLabel,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ) : SizedBox.shrink(),
            ],
          ),

          Row(
            children: [
              // Nhiệt độ Max (Mũi tên xanh lá hướng lên)
              Text(
                '${forecast.maxTemp}°C',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),
              const Icon(
                Icons.arrow_upward_rounded,
                size: 14.0,
                color: Color.fromRGBO(34, 197, 94, 1), // Xanh lá
              ),
              
              const SizedBox(width: 8.0),
              
              // Nhiệt độ Min (Mũi tên đỏ hướng xuống)
              Text(
                '${forecast.minTemp}°C',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),
              const Icon(
                Icons.arrow_downward_rounded,
                size: 14.0,
                color: Color.fromRGBO(239, 68, 68, 1), // Đỏ
              ),

              const SizedBox(width: 6.0),

              // Icon thời tiết
              Image.network(
                forecast.conditionIcon,
                width: 32.0,
                height: 32.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

}