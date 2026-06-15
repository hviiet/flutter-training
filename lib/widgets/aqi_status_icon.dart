import 'package:flutter/material.dart';
import '../core/extension/aqi_extension.dart';

class AqiStatusIcon extends StatelessWidget {
  final int aqi;
  final double size;

  const AqiStatusIcon({
    super.key, 
    required this.aqi, 
    this.size = 24
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,

      decoration: BoxDecoration(
        color: aqi.aqiColor,
        shape: BoxShape.circle,
      ),
      
      child: Icon(
        aqi.aqiIcon,
        color: Colors.white,
        size: size * 0.72,
      ),
    );
  }
}