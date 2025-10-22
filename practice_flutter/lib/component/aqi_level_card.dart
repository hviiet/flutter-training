import 'package:flutter/material.dart';

class AqiLevelCard extends StatelessWidget {
  final String title;
  final String indexRange;
  final Color color;
  final String emoji;

  const AqiLevelCard({
    super.key,
    required this.title,
    required this.indexRange,
    required this.color,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1.5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: color,
              child: Text(emoji, style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Air Quality Index: $indexRange",
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Air quality can change quickly due to both weather and human activity. "
                    "Air quality forecasts are often adjusted based on weather patterns.",
                    style: TextStyle(color: Colors.grey),
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
