import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:flutter_application_1/widgets/degree.dart';

class Location extends StatelessWidget {
  final String street;
  final String location;
  final IconData cardIcon;
  final int aqi;
  final IconData aqiIcon;
  final int degree;
  final IconData weatherIcon; 

  const Location({
    Key? key,
    required this.street,
    required this.location,
    required this.cardIcon,
    required this.aqi,
    required this.aqiIcon,
    required this.degree,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(street,
                          style: TextStyle(
                            fontFamily: "ABeeZee",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0
                          ),
                        ),
                        Text(location,
                          style: TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 8,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0,
                            color: Color(0xB8000000)
                          ),),
                      ],
                    ),
                    Transform.translate(child: Icon(cardIcon),offset: Offset(0, -5),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 4,
                      children: [
                        Icon(aqiIcon,color: Color(0xFF02FA83),size: 20,),
                        Aqi(aqiNumber: aqi, aqiSize: 16, textSize: 8, textOffset: -6)
                      ],
                    ),
                    Row(
                      spacing: 4,
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
      );
  }
}
