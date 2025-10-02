import 'package:flutter/material.dart';

class AirQualityCard extends StatelessWidget {
  final String unit;
  final double value;
  const AirQualityCard({super.key, required this.unit, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 64,
            child: Image.asset(
              'assets/images/locationdetails/status.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$unit (ug/m3)',
                  softWrap: true,
                  maxLines: 2,
                  style: const TextStyle(
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 1.4,
                    letterSpacing: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.72),
                  ),
                ),
                Text(
                  value.toStringAsFixed(1),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 24 / 20,
                    letterSpacing: 0.5,
                    color: Color.fromRGBO(0, 0, 0, 0.96),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
