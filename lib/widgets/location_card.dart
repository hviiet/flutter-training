import 'package:flutter/material.dart';

import '../models/weather_location.dart';
import '../models/weather_status.dart';
import 'aqi_status_icon.dart';

enum LocationCardType {
  small,
  large,
}

class LocationCard extends StatelessWidget {
  final WeatherLocation location;
  final LocationCardType type;

  const LocationCard({
    super.key, 
    required this.location, 
    required this.type,
  });

  bool get isLarge => type == LocationCardType.large;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isLarge ? 240 : 165.0,
      height: isLarge ? 96 : 92.0,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      margin: const EdgeInsets.only(right: 8.0, left: 8.0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 10.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isLarge ? 16.0 : 14.0,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(17, 24, 39, 1.0),
            ),
          ),

          const SizedBox(height: 4.0),

          Text(
            location.city,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(90, 90, 90, 1.0),
            ),
          ),

          const Spacer(),

          Row(
            children: [
              AqiStatusIcon(aqi: location.aqi, size: 20.0),

              const SizedBox(width: 6.0),

              Text(
                location.aqi.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),

              const SizedBox(width: 6.0),

              Text(
                'AQI',
                style: TextStyle(
                  fontSize: 11.0,
                  color: const Color.fromRGBO(90, 90, 90, 1.0),
                ),
              ),

              const Spacer(),

              isLarge ? buildTextTemperature(location) : buildIconWetherStatus(location.weatherStatus),
              const SizedBox(width: 6.0),
              isLarge ? buildIconWetherStatus(location.weatherStatus) : buildTextTemperature(location),
            ],
          )
          
        ],
      ),
    );

  }
}

Widget buildIconWetherStatus(WeatherStatus status) {
  return Icon(
    status.getIcon,
    size: 20.0,
    color: status.getColor,
  );
}

Widget buildTextTemperature(WeatherLocation location) {
  return Text(
    '${location.temperature}°C',
    style: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(17, 24, 39, 1.0),
    ),
  );
}