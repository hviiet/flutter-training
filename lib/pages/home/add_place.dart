import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:flutter_application_1/widgets/degree.dart';

class AddPlace extends StatelessWidget {
  final String title;
  final String location;
  final int aqi;
  final IconData aqiIcon;
  final int degree;
  final IconData weatherIcon;

  const AddPlace({super.key, required this.title, required this.location, required this.aqi, required this.aqiIcon, required this.degree, required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0
                      ),
                    ),
                    Text(location,
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontSize: 8,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0
                      ),),
                  ],
                ),
                Row(
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 2,
                      children: [
                        Icon(aqiIcon,color: Color(0xFF02FA83),size: 20,),
                        Aqi(aqiNumber: aqi, aqiSize: 16, textSize: 8, textOffset: -6)
                      ],
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        Icon(weatherIcon, color: Color(0xFF5D5FEF),size: 20,),
                        Degree(degree: degree, degreeSize: 16, textSize: 8)
                      ],
                    )
                  ],
                )
              ],
            )
          ),
      ),
    );
  }
}