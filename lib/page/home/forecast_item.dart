import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final String day;
  final String aqiImg;
  final int aqi;
  final String weatherImg;
  final int temp;

  const ForecastItem({
    super.key,
    required this.day,
    required this.aqiImg,
    required this.aqi,
    required this.weatherImg,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Day label
        Text(
          day,
          softWrap: false,
          overflow: TextOverflow.fade,
          style: const TextStyle(
            fontFamily: 'ABeeZee',
            fontWeight: FontWeight.w400,
            fontSize: 8,
            height: 1.0,
            color: Color.fromRGBO(0, 0, 0, 0.72),
          ),
        ),

        // AQI block
        Column(
          children: [
            Image.asset(aqiImg, width: 24, height: 24),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$aqi',
                    softWrap: false,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'AQI',
                    softWrap: false,
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
            ),
          ],
        ),

        // Divider
        const SizedBox(
          width: 32,
          child: Divider(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            thickness: 1,
            height: 1,
          ),
        ),

        // Temp block
        Column(
          children: [
            Image.asset(weatherImg, width: 24, height: 24),
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$temp',
                    softWrap: false,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    '°C',
                    softWrap: false,
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
            ),
          ],
        ),
      ],
    );
  }
}
