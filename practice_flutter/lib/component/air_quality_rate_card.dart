import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:practice_flutter/models/air_quality_model.dart';
import 'package:practice_flutter/screens/aqi_scale.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_bloc.dart';

class AirQualityRateCard extends StatelessWidget {
  final AirQualityModel? aqiData;
  final String city;

  const AirQualityRateCard({Key? key, this.aqiData, required this.city})
    : super(key: key);

  // PHỤC HỒI HÀM SCALE AQI
  double _scaleAqi(double originalAqi) {
    if (originalAqi.isNaN || originalAqi <= 0) return 1;
    double scaled = (originalAqi / 500) * 10;

    // Làm tròn giá trị và đảm bảo nó nằm trong khoảng [1, 10]
    int roundedScaled = scaled.round().clamp(1, 10);

    return roundedScaled.toDouble();
  }

  // --- Màu AQI (Dựa trên thang 1-10) ---
  Color _getAqiColor(int aqi) {
    if (aqi <= 3) return const Color(0xFF4CAF50); // Xanh lá - Low
    if (aqi <= 6) return const Color(0xFFFFC107); // Vàng cam - Moderate
    if (aqi <= 8) return const Color(0xFFF44336); // Đỏ - High
    return const Color(0xFF9C27B0); // Tím - Very High
  }

  // --- Trạng thái AQI ---
  String _getAqiStatus(int aqi) {
    if (aqi <= 3) return 'Low';
    if (aqi <= 6) return 'Moderate';
    if (aqi <= 8) return 'High';
    return 'Very High';
  }

  // --- Icon theo mức AQI ---
  IconData _getAqiIcon(int aqi) {
    if (aqi <= 3) return Icons.sentiment_satisfied_alt;
    if (aqi <= 6) return Icons.sentiment_neutral;
    if (aqi <= 8) return Icons.sentiment_dissatisfied;
    return Icons.sentiment_very_dissatisfied;
  }

  @override
  Widget build(BuildContext context) {
    if (aqiData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // SỬ DỤNG HÀM SCALE AQI
    final originalAqiValue = aqiData!.aqi?.toDouble() ?? 0.0;
    final scaledAqi = _scaleAqi(originalAqiValue).toInt();
    final color = _getAqiColor(scaledAqi);
    final percentValue = (scaledAqi / 10).clamp(0.0, 1.0);

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
            // --- Tiêu đề + nút Info (Dấu chấm than) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Air Quality',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                IconButton(
                  // Dấu chấm than và màu đỏ
                  icon: Icon(Icons.error_outline, color: Colors.red.shade400),
                  tooltip: 'View AQI Scale',
                  onPressed: () {
                    // SỬA CHỮA CHÍNH: Sử dụng context.read<T>() an toàn hơn để lấy Bloc
                    final weatherAqiBloc = context.read<WeatherAqiBloc>();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: weatherAqiBloc,
                          child: AqiScaleScreen(city: city),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --- Biểu đồ Bán nguyệt AQI ---
            Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 8.0,
                    percent: percentValue,
                    // Cấu hình cho nửa vòng tròn
                    arcType: ArcType.HALF,
                    // Đặt màu nền của phần chưa lấp đầy của CUNG tròn
                    arcBackgroundColor: Colors.grey.shade200,
                    progressColor: color,
                    startAngle: 0.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    center:
                        const SizedBox.shrink(), // Nội dung được đặt trong Stack
                  ),

                  // Nội dung Text/Icon
                  Padding(
                    // Căn chỉnh tương ứng với biểu đồ bán nguyệt
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$scaledAqi', // Hiển thị giá trị AQI đã được scale (1-10)
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'AQI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getAqiIcon(scaledAqi),
                              color: color,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _getAqiStatus(scaledAqi),
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
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- Các thông số (Đã sửa lỗi Null Safety) ---
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 24,
              crossAxisSpacing: 8,
              children: [
                _buildMiniBar('O₃ (μg/m³)', aqiData?.o3, color),
                _buildMiniBar('PM₁₀ (μg/m³)', aqiData?.pm10, color),
                _buildMiniBar('NO (μg/m³)', aqiData?.no, color),
                _buildMiniBar('NO₂ (μg/m³)', aqiData?.no2, color),
                _buildMiniBar('PM₂.₅ (μg/m³)', aqiData?.pm25, color),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMiniBar(String title, double? value, Color aqiColor) {
    final val = (value ?? 0).clamp(0, 100);
    final barPercent = val / 100.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 8,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 8,
                  height: 40 * barPercent,
                  decoration: BoxDecoration(
                    color: aqiColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Text(
              value != null ? value.toStringAsFixed(1) : 'N/A',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
