import 'package:flutter/material.dart';

class ChartBackground extends StatelessWidget {
  const ChartBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 26.5,
      children: [
        Container(
          width: double.infinity,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Color(0x14000000))
          ),
        ),
        Container(
          width: double.infinity,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Color(0x14000000))
          ),
        ),
        Container(
          width: double.infinity,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Color(0x14000000))
          ),
        ),
        Container(
          width: double.infinity,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Color(0x14000000))
          ),
        ),
        Container(
          width: double.infinity,
          height: 0,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Color(0x14000000))
          ),
        ),
      ],
    );
  }
}