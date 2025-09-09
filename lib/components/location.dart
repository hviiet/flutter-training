import 'package:flutter/material.dart';

class Location {
  final String title;
  final String address;
  final int aqi;
  final IconData aqiIcon;
  final int temp;
  final IconData? weatherIcon;
  final IconData? trailingIcon;

  Location({
    required this.title,
    required this.address,
    required this.aqi,
    required this.aqiIcon,
    required this.temp,
    this.weatherIcon,
    this.trailingIcon,
  });
}

class LocationsSlider extends StatelessWidget {
  final List<Location> locations;

  const LocationsSlider({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: locations.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final loc = locations[index];
                return Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(loc.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(loc.address, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(loc.aqiIcon, color: Colors.orange, size: 20),
                              const SizedBox(width: 4),
                              Text('${loc.aqi} AQI', style: const TextStyle(fontSize: 14)),
                              const Spacer(),
                              Text('${loc.temp}°C', style: const TextStyle(fontSize: 14)),
                              if (loc.weatherIcon != null) ...[
                                const SizedBox(width: 4),
                                Icon(loc.weatherIcon, color: Colors.blue, size: 18),
                              ],
                            ],
                          ),
                        ],
                      ),
                      if (loc.trailingIcon != null)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(loc.trailingIcon, color: Colors.indigo, size: 20),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: index == 1 ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: index == 1 ? Colors.blue : Colors.blue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}