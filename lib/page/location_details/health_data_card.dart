import 'package:flutter/material.dart';

class HealthDataCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const HealthDataCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      width: 208,
      padding: const EdgeInsets.only(left: 8, right: 12, top: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(iconPath, width: 24, height: 24, fit: BoxFit.cover),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 16 / 12,
                    letterSpacing: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.72),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          height: 14 / 10,
                          letterSpacing: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.72),
                        ),
                      ),
                    ),
                    if (subtitle.length > 60)
                      const Text(
                        ' Show More',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          height: 14 / 10,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
