import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  final String street;
  final String city;
  final int aqi;
  final int tempC;
  final String? conditionText;

  const LocationItem({
    super.key,
    required this.street,
    required this.city,
    required this.aqi,
    required this.tempC,
    this.conditionText,
  });

  // =================== Helpers ===================
  static String aqiIconFor(int aqi) {
    if (aqi <= 50) return 'assets/images/home/smile_normal.png';
    if (aqi <= 100) return 'assets/images/home/smile_yellow.png';
    if (aqi <= 150) return 'assets/images/home/smile_orange.png';
    return 'assets/images/home/smile_dark.png';
  }

  static String weatherIconFor(String? conditionText) {
    final text = (conditionText ?? '').toLowerCase();
    if (text.contains('rain') ||
        text.contains('drizzle') ||
        text.contains('shower')) {
      return 'assets/images/home/rain.png';
    }
    if (text.contains('overcast') || text.contains('cloud')) {
      if (text.contains('partly') || text.contains('patchy')) {
        return 'assets/images/home/cloud_sun.png';
      }
      return 'assets/images/home/cloud.png';
    }
    if (text.contains('sunny') || text.contains('clear')) {
      return 'assets/images/home/sun.png';
    }
    return 'assets/images/home/cloud.png';
  }

  @override
  Widget build(BuildContext context) {
    final aqiIcon = aqiIconFor(aqi);
    final weatherIcon = weatherIconFor(conditionText);

    return Container(
      width: 240,
      height: 88,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Locate
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      street,
                      style: const TextStyle(
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 16 / 12,
                        color: Color.fromRGBO(0, 0, 0, 0.96),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      city,
                      style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w300,
                        fontSize: 8,
                        height: 10 / 8,
                        color: Color.fromRGBO(0, 0, 0, 0.72),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/home/decorate_icon.png',
                width: 16,
                height: 16,
              ),
            ],
          ),

          // AQI + Temp
          Row(
            children: [
              // AQI block
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(aqiIcon, width: 16, height: 16),
                  const SizedBox(width: 6),
                  Text(
                    '$aqi',
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'AQI',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      height: 1.0,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Temp block
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$tempC',
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    '°C',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      height: 1.0,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.asset(weatherIcon, width: 16, height: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
