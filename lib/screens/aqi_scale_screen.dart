import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/location/location_cubit.dart';

class AqiScaleScreen extends StatelessWidget {
  const AqiScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final details =
        context.select((LocationCubit cubit) => cubit.state.details);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AQI Scale',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (details != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.my_location,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          details.weather.locationName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(details.weather.region),
                        Text(
                          '${details.weather.temperature.round()}°C'
                          ' · ${details.weather.condition}',
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${details.airQuality.aqi}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              children: [
                AqiScaleItem(
                  emoji: '🙂',
                  title: 'Good',
                  range: 'AQI: 0–50',
                  color: Colors.green,
                  description:
                      'Air quality is satisfactory and poses '
                      'little or no health risk.',
                ),
                AqiScaleItem(
                  emoji: '😐',
                  title: 'Moderate',
                  range: 'AQI: 51–100',
                  color: Colors.orange,
                  description:
                      'Air quality is acceptable. Sensitive '
                      'people may experience minor effects.',
                ),
                AqiScaleItem(
                  emoji: '😷',
                  title: 'Unhealthy for Sensitive Groups',
                  range: 'AQI: 101–150',
                  color: Color(0xffff7e00),
                  description:
                      'Sensitive groups may experience health '
                      'effects.',
                ),
                AqiScaleItem(
                  emoji: '😡',
                  title: 'Unhealthy',
                  range: 'AQI: 151–200',
                  color: Colors.red,
                  description:
                      'Some members of the public may '
                      'experience health effects.',
                ),
                AqiScaleItem(
                  emoji: '🤢',
                  title: 'Very Unhealthy',
                  range: 'AQI: 201–300',
                  color: Colors.purple,
                  description:
                      'The risk of health effects is increased '
                      'for everyone.',
                ),
                AqiScaleItem(
                  emoji: '☠️',
                  title: 'Hazardous',
                  range: 'AQI: 301–500',
                  color: Color(0xff7e0023),
                  description:
                      'Emergency conditions. Everyone is more '
                      'likely to be affected.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AqiScaleItem extends StatelessWidget {
  final String emoji;
  final String title;
  final String range;
  final String description;
  final Color color;

  const AqiScaleItem({
    super.key,
    required this.emoji,
    required this.title,
    required this.range,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 25)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  range,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
