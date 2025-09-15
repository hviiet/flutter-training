// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/degree.dart';

class WeatherItem extends StatelessWidget {
  final IconData icon;
  final int degree;
  final String time;

  const WeatherItem({
    super.key,
    required this.icon,
    required this.degree,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 48,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x07000000),
              offset: Offset(0, 4),                
              blurRadius: 30,                       
              spreadRadius: 0,   
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            spacing: 4,
            children: [
              Icon(icon,color: Color(0xFF5D5FEF),),
              Degree(degree: degree, degreeSize: 16, textSize: 8),
              Text(time,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0,
                  color: Color(0xB8000000)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
