import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_flutter/models/air_quality_model.dart'; // Giữ lại import model

class AqiForecastCard extends StatelessWidget {
  final List<AqiForecast> forecastData;

  const AqiForecastCard({Key? key, required this.forecastData})
    : super(key: key);

  Color _getAqiColor(double aqi) {
    if (aqi <= 3) return Colors.green;
    if (aqi <= 5) return Colors.yellow;
    if (aqi <= 7) return Colors.orange;
    if (aqi <= 9) return Colors.red;
    return Colors.purple; // >= 10
  }

  // scale AQI từ 0-500 về 1-10
  double _scaleAqi(double originalAqi) {
    if (originalAqi.isNaN || originalAqi <= 0) return 1;
    double scaled = (originalAqi / 500) * 10;
    int roundedScaled = scaled.round().clamp(1, 10);
    return roundedScaled.toDouble();
  }

  String _getDayAbbr(DateTime date) {
    return DateFormat('EEE').format(date).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (forecastData.isEmpty) return const SizedBox.shrink();

    const double maxChartHeight = 160.0;

    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'AQ Forecast',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Next 7 days',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'AQI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.blue),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: forecastData.map((data) {
                  final scaledAqi = _scaleAqi(data.avg);
                  final color = _getAqiColor(scaledAqi);
                  final height = (scaledAqi / 10) * maxChartHeight;
                  final dayAbbr = _getDayAbbr(DateTime.parse(data.day));

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ), // Tùy chọn border
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            scaledAqi.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: height,
                          width: 28,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          dayAbbr,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
