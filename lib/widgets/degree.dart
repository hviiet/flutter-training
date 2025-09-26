import 'package:flutter/material.dart';

class Degree extends StatelessWidget {
  final double degree;
  final double? degreeSize;
  final double? textSize;

  const Degree({super.key, required this.degree, required this.degreeSize, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: degree.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto",
                      fontSize: degreeSize,
                      letterSpacing: -0.5,
                    )
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(0, -4),
                      child: Text(
                        "°C",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "SF Pro Display",
                          fontSize: textSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]
              )
            );
  }
}