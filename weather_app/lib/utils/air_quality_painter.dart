import 'dart:math';
import 'package:flutter/material.dart';

class AirQualityPainter extends CustomPainter {
  final double progress; // Giá trị từ 0.0 đến 1.0

  AirQualityPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Định nghĩa tâm và bán kính
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    // Góc bắt đầu (khoảng 7 giờ = 140 độ) và tổng góc quét (khoảng 260 độ)
    const double startAngle = 140 * pi / 180;
    const double totalSweepAngle = 260 * pi / 180;
    final double currentSweepAngle = totalSweepAngle * progress;

    // 2. Cấu hình nét vẽ nền (Màu xanh nhạt)
    final backgroundPaint = Paint()
      ..color = Colors.green.shade100
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0
      ..strokeCap = StrokeCap.round; // Bo tròn 2 đầu

    // 3. Cấu hình nét vẽ tiến trình (Màu xanh đậm)
    final progressPaint = Paint()
      ..color = const Color(0xFF00E676) // Màu xanh neon/green của app
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0
      ..strokeCap = StrokeCap.round;

    // 4. Vẽ vòng cung nền
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweepAngle,
      false,
      backgroundPaint,
    );

    // 5. Vẽ vòng cung tiến trình đè lên
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      currentSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AirQualityPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}