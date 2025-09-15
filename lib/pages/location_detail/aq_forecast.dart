import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/location_detail/chart_background.dart';
import 'package:flutter_application_1/pages/location_detail/chart_item.dart';

class AqForecast extends StatefulWidget {
  const AqForecast({super.key});

  @override
  State<AqForecast> createState() => _AqForecastState();
}

class _AqForecastState extends State<AqForecast> {
  final chartData = [
    {'label': 'SAT', 'value': 2},
    {'label': 'SUN', 'value': 5},
    {'label': 'MON', 'value': 7},
    {'label': 'TUE', 'value': 4},
    {'label': 'WED', 'value': 3},
    {'label': 'THU', 'value': 8},
    {'label': 'FRI', 'value': 2},
  ];


  @override
  Widget build(BuildContext context) {
    final maxValue = chartData
      .map((e) => e['value'] as int)
      .reduce((a, b) => a > b ? a : b);
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
      ),
      height: 230,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("AQ Forecast",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "SF Pro Display",
                        letterSpacing: 0
                      ),
                    ),
                    Text("Next 7 days",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        letterSpacing: 0,
                        color: Color(0xB8000000)
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    
                  }, 
                  child: Row(
                    children: [
                      Text("AQI",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Outfit",
                          letterSpacing: 2,
                          color: Color(0xFF1882FF)
                        ),
                      ),
                      Icon(Icons.arrow_drop_down_rounded, size: 24, color: Color(0xFF1882FF),)
                    ],
                  )
                )
              ],
            ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.5),
              child: Stack(
                children: [
                  ChartBackground(),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: chartData.map((e) {
                    return ChartItem(number: e["value"] as int,label: e["label"] as String, maxNumber: maxValue);
                  },).toList(),
                ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}