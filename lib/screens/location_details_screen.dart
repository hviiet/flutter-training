import 'dart:math';
import 'package:flutter/material.dart';

// Lớp CustomPainter để vẽ biểu đồ tròn (Gauge)
class AirQualityPainter extends CustomPainter {
  final double progress; // Giá trị từ 0.0 đến 1.0

  AirQualityPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: size.width, height: size.height);

    final backgroundPaint = Paint()
      ..color = Colors.green.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    final progressPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    const startAngle = 3 * pi / 4;
    const sweepAngle = 3 * pi / 2;

    canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);
    canvas.drawArc(rect, startAngle, sweepAngle * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class LocationDetailsScreen extends StatelessWidget {
  const LocationDetailsScreen({Key? key}) : super(key: key);

  String _getWeatherIconPath(String condition) {
    switch (condition) {
      case 'cloud': return 'assets/images/cloud.png';
      case 'rain_drop': return 'assets/images/rain_drop.png';
      case 'rain_shower': return 'assets/images/rain_shower.png';
      case 'sunny': return 'assets/images/sunny.png';
      default: return 'assets/images/cloud.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text('Current Location', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.location_searching_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildLocationHeader(),
              const SizedBox(height: 20),
              _buildAirQualityCard(context),
              const SizedBox(height: 20),
              _buildWeatherCard(context),
              const SizedBox(height: 20),
              // GIỮ LẠI WIDGET GỐC CỦA BẠN
              _buildAqForecastCard(context),
              const SizedBox(height: 20),
              _buildWeatherForecastCard(context),
              const SizedBox(height: 20),
              // GIỮ LẠI WIDGET GỐC CỦA BẠN
              _buildRecommendationsCard(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ============== WIDGET ĐÃ ĐƯỢC SỬA LẠI THEO ẢNH ==============
  Widget _buildLocationHeader() {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 75, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Church Street Square', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Birmingham', style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildAirQualityCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Air Quality', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration( shape: BoxShape.circle),
                  child: const Icon(Icons.info_rounded, color: Colors.blue, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(150, 150),
                    painter: AirQualityPainter(progress: 0.3),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('3', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('AQI', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/low.png', width: 20, height: 20, color: Colors.green[600]),
                          const SizedBox(width: 4),
                          Text('Low', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[600])),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPollutantItem(context, 'O3', 'ug/m3', '52', 0.52),
                _buildPollutantItem(context, 'PM10', 'ug/m3', '25', 0.25),
                _buildPollutantItem(context, 'NO', 'ug/m3', '22', 0.22),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPollutantItem(context, 'NO2', 'ug/m3', '12', 0.12),
                _buildPollutantItem(context, 'PM1', 'ug/m3', '16', 0.16),
                _buildPollutantItem(context, 'PM2.5', 'ug/m3', '2.2', 0.7),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============== WIDGET ĐÃ ĐƯỢC SỬA LẠI THEO ẢNH VÀ SỬA LỖI CONTEXT ==============
  Widget _buildPollutantItem(BuildContext context, String name, String unit, String value, double level) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Căn lề trái
        children: [
          Container(
            height: 50,
            width: 8,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50 * level,
              decoration: BoxDecoration(color: Colors.green[400], borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '$name ', style: const TextStyle(color: Colors.grey)),
                      TextSpan(text: '($unit)', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============== WIDGET ĐÃ ĐƯỢC SỬA LẠI THEO ẢNH ==============
  Widget _buildWeatherCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weather', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NOW', style: TextStyle(color: Colors.grey)),
                    Text('Rain Shower', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text('Feels like 11°C', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('15', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('°C', style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(_getWeatherIconPath('rain_shower'), width: 40, height: 40, color: Colors.blue[400]),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildHourlyForecastItem('08:00', 'rain_shower', '15°C', false),
                        _buildHourlyForecastItem('09:00', 'rain_shower', '14°C', false),
                        _buildHourlyForecastItem('10:00', 'rain_drop', '13°C', true),
                        _buildHourlyForecastItem('11:00', 'rain_drop', '12°C', false),
                        _buildHourlyForecastItem('12:00', 'cloud', '12°C', false),
                        _buildHourlyForecastItem('13:00', 'sunny', '11°C', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPageIndicator(true),
                      _buildPageIndicator(false),
                      _buildPageIndicator(false),
                      _buildPageIndicator(false),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildHourlyForecastItem(String time, String iconCondition, String temp, bool isSelected) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(_getWeatherIconPath(iconCondition),
                width: 32, height: 32, color: isSelected ? Colors.white : Colors.blue[400]),
            Text(temp, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            Text(time, style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // ============== WIDGET GỐC CỦA BẠN (ĐƯỢC GIỮ LẠI) ==============
  Widget _buildAqForecastCard(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('AQ Forcast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Text('AQI', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward, size: 16, color: Colors.blue),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildAqBarItem('SAT', 2, 0.2, Colors.green),
                  _buildAqBarItem('SUN', 5, 0.5, Colors.orange),
                  _buildAqBarItem('MON', 7, 0.7, Colors.red),
                  _buildAqBarItem('TUE', 4, 0.4, Colors.yellow),
                  _buildAqBarItem('WED', 3, 0.3, Colors.green),
                  _buildAqBarItem('THU', 8, 0.8, Colors.red),
                  _buildAqBarItem('FRI', 2, 0.2, Colors.green),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildAqBarItem(String day, int aqi, double heightFactor, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withOpacity(0.8), shape: BoxShape.circle),
          child: Text(aqi.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Container(
          height: 100 * heightFactor,
          width: 20,
          decoration: BoxDecoration(color: color.withOpacity(0.3), borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(height: 8),
        Text(day),
      ],
    );
  }

  // ============== WIDGET ĐÃ ĐƯỢC SỬA LẠI THEO ẢNH ==============
  Widget _buildWeatherForecastCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weather Forcast', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Next 7 days', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildWeatherForecastItem('THU 11 NOV 21', 'TODAY', '25', '20', 'rain_shower'),
                _buildWeatherForecastItem('FRI 12 NOV 21', 'TOMORROW', '25', '20', 'cloud'),
                _buildWeatherForecastItem('SAT 13 NOV 21', '', '25', '20', 'sunny'),
                _buildWeatherForecastItem('SUN 14 NOV 21', '', '25', '20', 'rain_drop'),
                _buildWeatherForecastItem('SAT 15 NOV 21', '', '25', '20', 'cloud'),
                _buildWeatherForecastItem('SAT 16 NOV 21', '', '25', '20', 'rain_shower'),
                _buildWeatherForecastItem('SAT 17 NOV 21', '', '25', '20', 'cloud'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherForecastItem(String date, String dayLabel, String tempUp, String tempDown, String iconCondition) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                if (dayLabel.isNotEmpty) Text(dayLabel, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              Text('$tempUp°', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Icon(Icons.arrow_upward, size: 14, color: Colors.red),
              const SizedBox(width: 8),
              Text('$tempDown°', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Icon(Icons.arrow_downward, size: 14, color: Colors.blue),
            ],
          ),
          const SizedBox(width: 16),
          Image.asset(_getWeatherIconPath(iconCondition), width: 32, height: 32, color: Colors.blue[400]),
        ],
      ),
    );
  }

  // ============== WIDGET GỐC CỦA BẠN (ĐƯỢC GIỮ LẠI) ==============
  Widget _buildRecommendationsCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recommendations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRecommendationItem(
                  iconPath: 'assets/images/low.png',
                  title: 'General',
                  text: 'With this level of air quality, you have no limitations. Enjoy the ...'),
              const SizedBox(width: 16),
              _buildRecommendationItem(
                  iconPath: 'assets/images/low.png',
                  title: 'Asthma',
                  text: 'If you start to feel respiratory symptoms such as coughing or ...'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRecommendationItem({required String iconPath, required String title, required String text}) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(iconPath, width: 24, height: 24),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 8),
          Text(text, maxLines: 2, overflow: TextOverflow.ellipsis),
          const Spacer(),
          const Text('Show More', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}