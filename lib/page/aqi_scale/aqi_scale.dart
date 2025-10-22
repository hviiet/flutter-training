import 'package:flutter/material.dart';
import 'package:weather_app/page/aqi_scale/aqi.dart';

class AQIScale extends StatefulWidget {
  final String city;
  final String street;
  final int temp;
  final int feelsLikeC;
  final int aqi;
  final String conditionText;
  const AQIScale({
    super.key,
    required this.city,
    required this.street,
    required this.temp,
    required this.aqi,
    required this.conditionText,
    required this.feelsLikeC,
  });

  @override
  State<AQIScale> createState() => _AQIScaleState();
}

class _AQIScaleState extends State<AQIScale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.all(8),
          icon: Image.asset(
            "assets/images/aqiscale/Arrow-Left.png",
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "AQI Scale",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            height: 1.5,
            letterSpacing: 0.5,
            color: Color.fromRGBO(17, 24, 39, 1),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 16, right: 16),
        child: Column(
          children: [
            // Current state card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Location
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/home/GPS icon.png',
                        width: 32,
                        height: 32,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.street,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 20 / 14,
                              color: Color.fromRGBO(0, 0, 0, 0.96),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.city,
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              height: 12 / 10,
                              color: Color.fromRGBO(0, 0, 0, 0.72),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Live data
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/home/rain.png',
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Hàng hiển thị 19°C + mũi tên bé
                              Row(
                                children: [
                                  Text(
                                    '${widget.temp}',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 12 / 16,
                                      letterSpacing: -0.5,
                                      color: Color.fromRGBO(0, 0, 0, 0.96),
                                    ),
                                  ),
                                  const Text(
                                    '°C',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8,
                                      height: 1,
                                      color: Color.fromRGBO(0, 0, 0, 0.72),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Image.asset(
                                    'assets/images/home/high.png',
                                    width: 4,
                                    height: 6,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    widget.conditionText,
                                    style: TextStyle(
                                      fontFamily: 'ABeeZee',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      height: 1,
                                      color: Color.fromRGBO(0, 0, 0, 0.96),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Feels like ${widget.feelsLikeC}°C',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                      height: 0.8,
                                      color: Color.fromRGBO(0, 0, 0, 0.72),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '${widget.aqi}',
                            style: const TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              height: 28 / 24,
                              color: Color.fromRGBO(0, 0, 0, 0.96),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'AQI',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              height: 14 / 10,
                              color: Color.fromRGBO(0, 0, 0, 0.72),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/images/home/smile_normal.png',
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: Column(
                      children: [
                        AQICard(
                          iconPath: 'assets/images/aqiscale/low.png',
                          title: 'Low',
                          start: 1,
                          end: 3,
                          description:
                              'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically affect air quality forecasts within hours or even minutes. ... Show More',
                        ),
                        SizedBox(height: 16),
                        AQICard(
                          iconPath: 'assets/images/aqiscale/moderate.png',
                          title: 'Moderate',
                          start: 4,
                          end: 6,
                          description:
                              'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
                        ),
                        SizedBox(height: 16),
                        AQICard(
                          iconPath: 'assets/images/aqiscale/highaqi.png',
                          title: 'High',
                          start: 7,
                          end: 8,
                          description:
                              'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
                        ),
                        SizedBox(height: 16),
                        AQICard(
                          iconPath: 'assets/images/aqiscale/veryhighaqi.png',
                          title: 'Very High',
                          start: 9,
                          end: 10,
                          description:
                              'Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically...',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
