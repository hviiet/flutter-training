import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final int R;
  final int G;
  final int B;
  final int value;
  const Chart({
    super.key,
    required this.R,
    required this.G,
    required this.B,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 32,
          height: value * 10,
          decoration: BoxDecoration(
            color: Color.fromRGBO(R, G, B, 0.24),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Positioned(
          top: -15,
          left: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(R, G, B, 0.48),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(R, G, B, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                '$value',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  height: 1.0,
                  letterSpacing: -0.5,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
