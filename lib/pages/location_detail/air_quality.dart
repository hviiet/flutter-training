// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:flutter_application_1/pages/aqi_scale/aqi_scale.dart';
import 'package:flutter_application_1/pages/location_detail/air_quality_item.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'dart:math';

class AirQuality extends StatelessWidget {
  final int aqi;
  final double o3;
  final double pm10;  
  final double co;
  final double no2;
  final double so2;
  final double pm2_5;

  const AirQuality({
    super.key,
    required this.aqi,
    required this.o3,
    required this.pm10,
    required this.co,
    required this.no2,
    required this.so2,
    required this.pm2_5,
  });

  @override
  Widget build(BuildContext context) {
    final double maxValue = max(max(max(max(max(o3, pm10), co), no2), so2), pm2_5);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Air Quality",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.info,color: Color(0xFF1882FF),), 
                  onPressed: () {
                   Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => AqiScale())
                   ); 
                  },
                )
              ],
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: SizedBox(
                  height: 190,
                  width: 190,
                  child: SfRadialGauge(
                    axes: [
                      RadialAxis(
                        minimum: 0,
                        maximum: 7,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 180,
                        endAngle: 0,
                        axisLineStyle: AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color(0x2902DB5C),
                          thickness: 9
                        ),
                        // radiusFactor: 0.8,
                        pointers: [
                          RangePointer(
                            color: Color(0xFF02DB5C),
                            value: double.parse(aqi.toString()),
                            cornerStyle: CornerStyle.bothCurve,
                            width: 9,
                          ),
                        ],
                        annotations: [
                          GaugeAnnotation(
                            angle: -90,
                            positionFactor:0.4,
                            widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Aqi(aqiNumber: aqi, aqiSize: 24, textSize: 10, textOffset: -9),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Icon(Icons.emoji_emotions,color: Color(0xFF02DB5C),size: 15,),
                                    ),
                                    Text("Low",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.25,
                                        color: Color(0xFF02DB5C)
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              spacing: 8,
              children: [
                AirQualityItem(name: "O3 (ug/m3)",value: o3,maxValue: maxValue,),
                AirQualityItem(name: "PM10 (ug/m3)",value: pm10,maxValue: maxValue,),
                AirQualityItem(name: "CO (ug/m3)",value: co,maxValue: maxValue,),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                AirQualityItem(name: "NO2 (ug/m3)",value: no2,maxValue: maxValue,),
                AirQualityItem(name: "SO2 (ug/m3)",value: so2,maxValue: maxValue,),
                AirQualityItem(name: "PM2.5 (ug/m3)",value: pm2_5,maxValue: maxValue,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
