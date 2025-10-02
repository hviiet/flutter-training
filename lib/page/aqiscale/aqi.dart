import 'package:flutter/material.dart';

class AQICard extends StatelessWidget {
  final String iconPath;
  final String title;
  final int start;
  final int end;
  final String description;

  const AQICard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.start,
    required this.end,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(iconPath, width: 24, height: 24),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: 0.5,
                  color: Color.fromRGBO(17, 24, 39, 1),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Air Quality Index: $start to $end ',
                style: const TextStyle(
                  fontFamily: 'ABeeZee',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.35,
                  letterSpacing: 0.5,
                  color: Color.fromRGBO(28, 28, 30, 0.72),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  height: 1.4,
                  letterSpacing: 0,
                  color: Color.fromRGBO(0, 0, 0, 0.72),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Show More',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  height: 1.4,
                  letterSpacing: 0,
                  color: Color.fromRGBO(24, 130, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
