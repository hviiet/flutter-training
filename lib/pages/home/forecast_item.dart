import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:flutter_application_1/widgets/degree.dart';

class ForecastItem extends StatelessWidget {
  final String day;
  final IconData aqiIcon;
  final int aqi;
  final IconData weatherIcon;
  final int degree;

  const ForecastItem({
    super.key,
    required this.day,
    required this.aqiIcon,
    required this.aqi,
    required this.weatherIcon,
    required this.degree,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Column(
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(day,
                style: TextStyle(
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  letterSpacing: 0,
                ),
              ),
            ),
            Icon(aqiIcon,
              color: Color(0xFF02FA83),
            ),
            Aqi(aqiNumber: aqi, aqiSize: 14, textSize: 8, textOffset: -3,),
            Container(
              width: 32,
              height: 0,
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1,color: Color(0x14000000))
              ),
            ),
            Icon(weatherIcon, color: Color(0xFF5D5FEF),),
            Degree(degree: degree, degreeSize: 14, textSize: 8)
          ],
        ),
      ),
    );
  }
}