import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aqi_scale/aqi_scale.dart';
import 'package:flutter_application_1/pages/location_detail/air_quality_item.dart';
import 'package:flutter_application_1/widgets/aqi.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({super.key});

  @override
  Widget build(BuildContext context) {
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
                        maximum: 500,
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
                            value: 200,
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
                                Aqi(aqiNumber: 3, aqiSize: 24, textSize: 10, textOffset: -9),
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
                AirQualityItem(name: "O3 (ug/m3)",value: 52,),
                AirQualityItem(name: "PM10 (ug/m3)",value: 25,),
                AirQualityItem(name: "NO (ug/m3)",value: 22,),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                AirQualityItem(name: "NO2 (ug/m3)",value: 12,),
                AirQualityItem(name: "PM1 (ug/m3)",value: 16,),
                AirQualityItem(name: "PM2.5 (ug/m3)",value: 2.2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}