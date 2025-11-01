import 'package:flutter/material.dart';
import 'package:flutter_training/models/aqi_scale_info.dart';

/// AQ Forecast Section component for Location Detail Page
class AQForecastSection extends StatelessWidget {
  final List<dynamic> forecast;

  const AQForecastSection({
    super.key,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
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
                'AQ Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'AQI',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Next 7 days',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          // Bar chart with rounded tops
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                final day = forecast[index];
                // Use real AQI data from API
                final airQuality = day.airQuality;
                final aqi = airQuality?.aqi ?? 4; // Use AQI 1-10 scale, default to 4 (moderate)
                final aqiInfo = AQIScaleInfo.fromAQI(aqi);
                
                // Calculate bar height based on AQI value (scale 1-10)
                // AQI ranges: 1-3 (Low), 4-6 (Moderate), 7-8 (High), 9-10 (Very High)
                // Map to bar height: 40-140px
                final normalizedAqi = ((aqi - 1) / 9.0).clamp(0.0, 1.0); // Normalize 1-10 to 0-1
                final barHeight = 40.0 + (normalizedAqi * 100.0);
                
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Bar with circle on top
                        Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            // Main bar column
                            Container(
                              width: 32,
                              height: barHeight,
                              decoration: BoxDecoration(
                                color: aqiInfo.color.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                            ),
                            // Circle on top of the bar
                            Positioned(
                              top: -10,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: aqiInfo.color,
                                ),
                                child: Center(
                                  child: Text(
                                    aqi.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Day label at bottom
                        Text(
                          day.dayName,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
