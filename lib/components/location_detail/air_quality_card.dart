import 'package:flutter/material.dart';
import 'package:flutter_training/models/aqi_scale_info.dart';
import 'package:flutter_training/models/weather_data.dart';
import 'package:flutter_training/views/aqi_scale_page.dart';

/// Air Quality Card component for Location Detail Page
class AirQualityCard extends StatelessWidget {
  final int aqi;
  final AQIScaleInfo aqiInfo;
  final AirQuality? airQuality;
  final String location;
  final String region;
  final Current current;

  const AirQualityCard({
    super.key,
    required this.aqi,
    required this.aqiInfo,
    this.airQuality,
    required this.location,
    required this.region,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    // Build pollutants list using real API data
    // API provides: CO, NO2, O3, SO2, PM2.5, PM10
    final pollutants = <Map<String, dynamic>>[];
    
    if (airQuality != null) {
      // Order: O3, PM10, CO, NO2, SO2, PM2.5 (6 items for 3x2 grid)
      if (airQuality!.o3 != null) {
        pollutants.add({
          'label': 'O3 (ug/m3)',
          'shortLabel': 'O3',
          'value': airQuality!.o3!.toInt()
        });
      }
      if (airQuality!.pm10 != null) {
        pollutants.add({
          'label': 'PM10 (ug/m3)',
          'shortLabel': 'PM10',
          'value': airQuality!.pm10!.toInt()
        });
      }
      if (airQuality!.co != null) {
        pollutants.add({
          'label': 'CO (ug/m3)',
          'shortLabel': 'CO',
          'value': airQuality!.co!.toInt()
        });
      }
      if (airQuality!.no2 != null) {
        pollutants.add({
          'label': 'NO2 (ug/m3)',
          'shortLabel': 'NO2',
          'value': airQuality!.no2!.toInt()
        });
      }
      if (airQuality!.so2 != null) {
        pollutants.add({
          'label': 'SO2 (ug/m3)',
          'shortLabel': 'SO2',
          'value': airQuality!.so2!.toInt()
        });
      }
      if (airQuality!.pm25 != null) {
        pollutants.add({
          'label': 'PM2.5 (ug/m3)',
          'shortLabel': 'PM2.5',
          'value': airQuality!.pm25!.toInt()
        });
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Air Quality',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AQIScalePage(
                        location: location,
                        region: region,
                        current: current,
                        aqi: aqi,
                        aqiInfo: aqiInfo,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 180,
                  height: 100,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Background semi-circle
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 180,
                          height: 90,
                          decoration: BoxDecoration(
                            color: aqiInfo.color.withOpacity(1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(90),
                              topRight: Radius.circular(90),
                            ),
                          ),
                        ),
                      ),
                      // Inner semi-circle
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 150,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(75),
                              topRight: Radius.circular(75),
                            ),
                          ),
                        ),
                      ),
                      // AQI value
                      Positioned(
                        bottom: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              aqi.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'AQI',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: aqiInfo.color, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      aqiInfo.level,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: aqiInfo.color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Pollutants Grid (3x2)
          if (pollutants.isNotEmpty)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: pollutants.take(6).map((pollutant) {
                return _PollutantItem(
                  label: pollutant['label'] as String,
                  shortLabel: pollutant['shortLabel'] as String,
                  value: pollutant['value'].toString(),
                  color: aqiInfo.color,
                );
              }).toList(),
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Air quality data not available',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PollutantItem extends StatelessWidget {
  final String label;
  final String shortLabel;
  final String value;
  final Color color;

  const _PollutantItem({
    required this.label,
    required this.shortLabel,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate fill percentage (mock calculation based on value)
    final numValue = int.tryParse(value) ?? 0;
    final fillPercentage = (numValue / 100).clamp(0.2, 1.0);
    
    return Container(
      padding: const EdgeInsets.all(10),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label on top
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Row with test tube on left and value on right
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Test tube / liquid indicator on LEFT
                SizedBox(
                  width: 20,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Test tube container (border)
                      Container(
                        width: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // Liquid fill
                      FractionallySizedBox(
                        heightFactor: fillPercentage,
                        child: Container(
                          width: 15,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                color.withOpacity(0.4),
                                color.withOpacity(1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Value text on RIGHT (separated from tube)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
