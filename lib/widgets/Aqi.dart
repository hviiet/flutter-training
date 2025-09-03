import 'package:flutter/material.dart';

class Aqi extends StatelessWidget {
  final int aqiNumber;
  final double? aqiSize;
  final double? textSize;
  final double textOffset;

  const Aqi({super.key, required this.aqiNumber, required this.aqiSize, required this.textSize, required this.textOffset});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Transform.translate(
                    offset: Offset(0, 0),
                    child: Text(aqiNumber.toString(),
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                      fontSize: aqiSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      ),
                    ),
                  ),
                ),
                
                WidgetSpan(
                  child: Transform.translate(
                    offset: Offset(2, textOffset),
                    child: Text("AQI",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: textSize,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}