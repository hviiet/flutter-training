import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String iconPath;
  final int temperature;
  final String time;
  const WeatherCard({
    super.key,
    required this.iconPath,
    required this.temperature,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 80,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            offset: Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(iconPath, fit: BoxFit.cover, width: 32, height: 32),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                '$temperature',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.0,
                  letterSpacing: -0.5,
                  color: Color.fromRGBO(0, 0, 0, 0.96),
                ),
              ),
              Text(
                '°C',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  fontSize: 8,
                  height: 1.0,
                  letterSpacing: 0,
                  color: Color.fromRGBO(0, 0, 0, 0.72),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              fontSize: 8,
              height: 1.0,
              letterSpacing: 0,
              color: Color.fromRGBO(0, 0, 0, 0.72),
            ),
          ),
        ],
      ),
    );
  }
}
