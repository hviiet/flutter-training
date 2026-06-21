import 'package:flutter/material.dart';

class AqiInfoCard extends StatelessWidget {
  final String level;
  final int minValue;
  final int maxValue;
  final String description;
  final IconData icon;
  final Color iconColor;

  const AqiInfoCard({
    super.key,
    required this.level,
    required this.minValue,
    required this.maxValue,
    required this.description,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      
      child: Row(
        children: [

          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  level,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  'Air Quality Index: $minValue to $maxValue',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(181, 0, 0, 0)
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12, 
                    color: Color.fromARGB(181, 0, 0, 0)
                  ),
                ),

                const SizedBox(height: 1),

                Text(
                  'Show more',
                  style: const TextStyle(
                    fontSize: 12, 
                    color: Color.fromRGBO(25, 118, 210, 1)
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}