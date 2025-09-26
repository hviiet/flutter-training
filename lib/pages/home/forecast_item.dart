import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:flutter_application_1/widgets/degree.dart';

class ForecastItem extends StatelessWidget {
  final String day;
  final IconData aqiIcon;
  final int aqi;
  final String weatherIcon;
  final double degree;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
            BoxShadow(
                color: Color(0x0A000000),
                offset: Offset(0, 2),                
                blurRadius: 8,                       
                spreadRadius: 0,   
              )
          ]
          ),
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
              color: (aqi<3)?Color(0xFF02FA83)
                    :(aqi<4)?Color(0xFFFFDE30)
                    :(aqi<6)?Color(0xFFFFB133)
                    :Color(0xFFFF6C3E),
            ),
            Aqi(aqiNumber: aqi, aqiSize: 14, textSize: 8, textOffset: -3,),
            Container(
              width: 32,
              height: 0,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0x14000000))
              ),
            ),
            Image.network("http:$weatherIcon", color: Color(0xFF5D5FEF), width: 20, height: 20,fit: BoxFit.contain,),
            Degree(degree: degree, degreeSize: 14, textSize: 8)
          ],
        ),
      ),
    );
  }
}