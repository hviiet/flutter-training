import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_training/models/location_detail_data.dart';
import 'package:flutter_training/screens/aqi_scale.dart';
import '../common/aqi_status_icon.dart';
import '../../core/extension/aqi_extension.dart';

class AirQualityDetailCard extends StatelessWidget {
  final int aqi;
  final List<Pollutant> pollutants;

  const AirQualityDetailCard({
    super.key, 
    required this.aqi, 
    required this.pollutants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Air Quality',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AqiScaleScreen()),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  size: 24.0,
                  color: const Color.fromARGB(255, 0, 119, 255),
                ),
              )
            ],
          ),

          const SizedBox(height: 8.0),

          Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AqiGaugeChart(aqi: aqi),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          aqi.toString(),
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(17, 24, 39, 1.0),
                          ),
                        ),

                        const SizedBox(width: 4.0),

                        Text(
                          'AQI',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color.fromRGBO(90, 90, 90, 1.0),
                          ),
                        ),
                      ], 
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AqiStatusIcon(aqi: aqi, size: 24.0),
                        const SizedBox(width: 6.0),
                        Text(
                          aqi.aqiLabel,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(90, 90, 90, 1.0),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12.0),
                  ],
                ),
              ],
            )
          ),

          const SizedBox(height: 20.0), 

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
            ),
            itemCount: pollutants.length,
            itemBuilder: (context, index) {
              final pollutant = pollutants[index];
              return PollutantItemCard(pollutant: pollutant);
            },
          ),


        ],
      ),
    );
  }
}


class PollutantItemCard extends StatelessWidget {
  final Pollutant pollutant;

  const PollutantItemCard({super.key, required this.pollutant});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 8.0,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(210, 250, 220, 1), // background color
                borderRadius: BorderRadius.circular(4.0),
              ),

              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: ((pollutant.value as num ).toDouble()/ 50).clamp(0.0, 1.0), // tạm thời set cứng 50, viết extension cho Pollutant để lấy max value
                child: Container(
                  width: 8.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(34, 197, 94, 1), // tạm thời set cứng, viết extension cho Pollutant để lấy color theo loại pollutant
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pollutant.name} (ug/m³)',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromRGBO(90, 90, 90, 1.0),
                    ),
                  ),
              
                  const SizedBox(height: 4.0),
              
                  Text(
                    '${pollutant.value.toStringAsFixed(1).replaceAll('.0', '')} ',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(17, 24, 39, 1.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}


class AqiGaugeChart extends StatelessWidget {
  final int aqi;

  const AqiGaugeChart({
    super.key,
    required this.aqi,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (aqi / 200).clamp(0.0, 1.0); // set cung 200

    return SizedBox(
      width: 220.0,
      height: 110.0, 
      child: CustomPaint(
        painter: _GaugePainter(percentage: percentage),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double percentage;
  _GaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    final bgPaint = Paint()
      ..color = const Color.fromRGBO(210, 250, 220, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = const Color.fromRGBO(34, 197, 94, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Vẽ nền nhạt (180 độ)
    canvas.drawArc(rect, pi, pi, false, bgPaint);

    // Vẽ phần đậm (dựa trên %)
    final sweepAngle = pi * percentage;
    canvas.drawArc(rect, pi, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}