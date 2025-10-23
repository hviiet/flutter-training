import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:flutter_application_1/widgets/degree.dart';

class LiveLocation extends StatelessWidget {
  final String title;
  final String subtitle;
  final double temp;
  final int aqi;
  final String text;
  final double feelLike;

  const LiveLocation({
    super.key,
    required this.title,
    required this.subtitle,
    required this.temp,
    required this.aqi,
    required this.text,
    required this.feelLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.my_location,color: Color(0xFF1882FF),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0
                    ),
                  ),
                  Text(subtitle,
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8,
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 9.33, left: 6.33),
                      child: Icon(Icons.cloud, color: Color(0xFF5D5FEF),),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Degree(degree: temp, degreeSize: 16, textSize: 12),
                          Text("↑",style: TextStyle(color: Color(0xFF56BF30)),)
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: text,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontSize: 10,
                                letterSpacing: 0,
                              )
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(3, 2),
                                child: Text(
                                  "Feels like $feelLike°C",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "SF Pro Display",
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ]
                        )
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Aqi(aqiNumber: aqi, aqiSize: 24, textSize: 10, textOffset: -10,),
                  const SizedBox(width: 8),
                  const Icon(Icons.emoji_emotions,color: Color(0xFF30B502),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
