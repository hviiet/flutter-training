import 'package:flutter/material.dart';
import 'package:flutter_training/core/extension/aqi_extension.dart';
import 'package:flutter_training/models/location_detail_data.dart';

class AqiForecastChartCard extends StatelessWidget {
  final List<DailyAqiForecastItem> aqiForecasts;

  const AqiForecastChartCard({super.key, required this.aqiForecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'AQI Forecast',
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
                ],
              ),
              Row(
                children: const [
                  Text(
                    'PM2.5',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(194, 10, 59, 255),
                    ),
                  ),
                  SizedBox(width: 6.0),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 18.0,
                    color: Color.fromARGB(194, 10, 59, 255),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16.0),

          // --- CHART AREA ---
          SizedBox(
            height: 170.0,
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0), 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return const Divider(
                        color: Color.fromRGBO(200, 200, 200, 0.5),
                        thickness: 1.0,
                        height: 1.0,
                      );
                    }),
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: aqiForecasts.map((forecast) {
                    return _buildAqiBar(forecast);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAqiBar(DailyAqiForecastItem forecast) {
    final double barHeight = ((forecast.aqi / 200) * 140.0).clamp(30.0, 140.0).toDouble();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Khối vẽ cột
        Container(
          width: 30.0,
          height: barHeight,
          decoration: BoxDecoration(
            color: forecast.aqi.aqiBgAqiChartColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
          ),
          alignment: Alignment.topCenter,
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: forecast.aqi.aqiColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              forecast.aqi.toString(),
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // Khoảng cách giữa cột và chữ
        const SizedBox(height: 8.0),

        // Khối vẽ chữ 
        Text(
          forecast.date,
          style: const TextStyle(
            fontSize: 12.0,
            color: Color.fromRGBO(90, 90, 90, 1.0),
          ),
        ),
      ],
    );
  }
}