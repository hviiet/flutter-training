import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:flutter_application_1/widgets/degree.dart';

class AddPlace extends StatelessWidget {
  final String title;
  final String location;
  final int aqi;
  final IconData aqiIcon;
  final double degree;
  final String weatherIcon;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 2,
                      children: [
                        Icon(aqiIcon, color: (aqi<3)?Color(0xFF02FA83)
                                          :(aqi<4)?Color(0xFFFFDE30)
                                          :(aqi<6)?Color(0xFFFFB133)
                                          :Color(0xFFFF6C3E), size: 20,),
                        Aqi(aqiNumber: aqi, aqiSize: 16, textSize: 8, textOffset: -6)
                      ],
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        Image.network("https:$weatherIcon", color: Color(0xFF5D5FEF), width: 20, height: 20,fit: BoxFit.contain,),
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