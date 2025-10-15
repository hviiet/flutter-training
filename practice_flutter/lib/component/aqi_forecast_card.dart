import 'package:flutter/material.dart';
import 'package:practice_flutter/models/air_quality_model.dart';

class AqiForecastCard extends StatelessWidget {
  final List<AqiForecast> forecastData;

  const AqiForecastCard({Key? key, required this.forecastData})
    : super(key: key);

  // Màu theo mức AQI 1–10
  Color _getAqiColor(double aqi) {
    if (aqi <= 3) return Colors.green;
    if (aqi <= 5) return Colors.yellow;
    if (aqi <= 7) return Colors.orange;
    if (aqi <= 9) return Colors.red;
    return Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    // 💡 Thêm kiểm tra dữ liệu rỗng để tránh lỗi
    if (forecastData.isEmpty) {
      return const SizedBox.shrink(); // Ẩn widget nếu không có dữ liệu
    }

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
            // --- Header ---
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

            // --- Biểu đồ cột (có thể cuộn) ---
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Cho phép cuộn ngang
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: forecastData.map((data) {
                  final avg = data.avg;
                  // ✅ Thêm kiểm tra để xử lý giá trị NaN (Not a Number)
                  final aqiValue = avg.isNaN ? 0.0 : avg;
                  final color = _getAqiColor(aqiValue);
                  final height =
                      (aqiValue / 10) * 100; // quy đổi chiều cao 0–100px

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                    ), // Tạo khoảng cách giữa các cột
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          aqiValue.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          height: height,
                          width: 22,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          data.day,
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
