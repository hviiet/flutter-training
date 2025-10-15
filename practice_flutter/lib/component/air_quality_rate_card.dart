import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:practice_flutter/models/air_quality_model.dart';

class AirQualityRateCard extends StatelessWidget {
  final AirQualityModel? aqiData;

  const AirQualityRateCard({Key? key, this.aqiData}) : super(key: key);

  // --- Màu AQI (thang 1–10) ---
  Color _getAqiColor(int aqi) {
    if (aqi <= 3) return const Color(0xFF4CAF50); // Xanh lá - Low
    if (aqi <= 6) return const Color(0xFFFFC107); // Vàng cam - Moderate
    if (aqi <= 8) return const Color(0xFFF44336); // Đỏ - High
    return const Color(0xFF9C27B0); // Tím - Very High
  }

  // --- Trạng thái AQI (1–10) ---
  String _getAqiStatus(int aqi) {
    if (aqi <= 3) return 'Low';
    if (aqi <= 6) return 'Moderate';
    if (aqi <= 8) return 'High';
    return 'Very High';
  }

  // --- Icon tương ứng mức AQI ---
  IconData _getAqiIcon(int aqi) {
    if (aqi <= 3) return Icons.sentiment_satisfied_alt; // Good
    if (aqi <= 6) return Icons.sentiment_neutral; // Moderate
    if (aqi <= 8) return Icons.sentiment_dissatisfied; // High
    return Icons.sentiment_very_dissatisfied; // Very High
  }

  @override
  Widget build(BuildContext context) {
    if (aqiData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final aqi = aqiData!.aqi ?? 0;
    final color = _getAqiColor(aqi);

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
            // --- Tiêu đề ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Air Quality',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Icon(Icons.info_outline, color: Colors.grey[600]),
              ],
            ),
            const SizedBox(height: 20),

            // --- Vòng tròn AQI ---
            Center(
              child: CircularPercentIndicator(
                radius: 65.0,
                lineWidth: 10.0,
                percent: (aqi / 10).clamp(0.0, 1.0), // <-- đổi từ /500 sang /10
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade200,
                linearGradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$aqi',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_getAqiIcon(aqi), color: color, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          _getAqiStatus(aqi),
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Các thông số ---
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              children: [
                _buildMiniBar('O₃', aqiData!.o3),
                _buildMiniBar('PM₁₀', aqiData!.pm10),
                _buildMiniBar('NO₂', aqiData!.no2),
                _buildMiniBar('NO', aqiData!.no),
                _buildMiniBar('SO₂', aqiData!.so2),
                _buildMiniBar('PM₂.₅', aqiData!.pm25),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- Thanh nhỏ từng thông số ---
  Widget _buildMiniBar(String title, double? value) {
    final val = (value ?? 0).clamp(0, 100);
    final barColor = Colors.greenAccent.shade400;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 8,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: 8,
              height: 30 * (val / 100),
              decoration: BoxDecoration(
                color: barColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value != null ? value.toStringAsFixed(1) : 'N/A',
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
        const Text('μg/m³', style: TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}
