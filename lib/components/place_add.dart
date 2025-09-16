import 'package:flutter/material.dart';
import '../models/place_info.dart';

class AddPlaces extends StatelessWidget {
  final List<PlaceInfo> places;

  const AddPlaces({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: List.generate(places.length, (index) {
            final place = places[index];
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    place.address,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(place.aqiIcon, color: Colors.green, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${place.aqi} AQI',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      Icon(place.weatherIcon, color: Colors.blue, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${place.temp}°C',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
