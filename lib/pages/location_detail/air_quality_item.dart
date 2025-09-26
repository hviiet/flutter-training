import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AirQualityItem extends StatelessWidget {
  final String name;
  final double value;
  final double maxValue;
  const AirQualityItem({
    super.key,
    required this.name,
    required this.value,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: SizedBox(
          height: 46,
          child: Row(
            spacing: 16,
            children: [
              SfLinearGauge(
                minimum: 0,
                maximum: maxValue,
                showTicks: false,
                showLabels: false,
                orientation: LinearGaugeOrientation.vertical,
                barPointers: [
                  LinearBarPointer(
                    value: value,
                    color: Color(0xFF02DB5C),
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    thickness: 8,
                  ),
                ],
                axisTrackStyle: LinearAxisTrackStyle(
                  color: Color(0x2902DB5C),
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  thickness: 8
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: TextStyle(
                      fontFamily: "ABeeZee",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0
                    ),
                  ),
                  Text((value!=0.0)?"$value":"NA",
                    style: TextStyle(
                      fontFamily: "SF Pro Display",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
