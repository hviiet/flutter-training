import 'package:flutter/material.dart';
import 'package:practice_flutter/component/current_state_card.dart';
import 'package:practice_flutter/component/locations.dart';
import 'package:practice_flutter/component/add_places.dart';
import 'package:practice_flutter/screens/location_details.dart';
import 'package:practice_flutter/provider/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data cho ví dụ
    final currentStateForecast = [
      ForecastDay(
        day: 'MON',
        aqi: 1,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 20,
      ),
      ForecastDay(
        day: 'TUE',
        aqi: 2,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 21,
      ),
      ForecastDay(
        day: 'WED',
        aqi: 3,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 22,
      ),
      ForecastDay(
        day: 'THU',
        aqi: 2,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.wb_sunny,
        temp: 21,
      ),
      ForecastDay(
        day: 'FRI',
        aqi: 2,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.wb_sunny,
        temp: 20,
      ),
      ForecastDay(
        day: 'SAT',
        aqi: 2,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 20,
      ),
    ];

    final addPlaces = [
      PlaceInfo(
        title: 'Work',
        address: 'Coventry ST, Birmingham',
        aqi: 3,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 25,
      ),
      PlaceInfo(
        title: 'Home',
        address: 'Coventry ST, Birmingham',
        aqi: 2,
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 22,
      ),
    ];

    final locations = [
      LocationCardInfo(
        title: 'Edmund Street',
        address: 'Birmingham',
        aqi: 5,
        aqiIcon: Icons.sentiment_satisfied,
        temp: 21,
        weatherIcon: Icons.ac_unit,
        trailingIcon: Icons.wallet,
      ),
      LocationCardInfo(
        title: 'Berkley Street',
        address: 'Birmingham',
        aqi: 4,
        aqiIcon: Icons.sentiment_satisfied,
        temp: 20,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Welcome Back 👋',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Anamoul',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Thẻ trạng thái hiện tại
            CurrentStateCard(
              location: 'Church Street Square',
              city: 'Birmingham',
              temperature: '19°C',
              weather: 'Rain Shower',
              feelsLike: '11°C',
              aqi: 3,
              weatherIcon: Icons.cloud,
              aqiIcon: Icons.sentiment_satisfied,
              forecast: currentStateForecast,
            ),
            const SizedBox(height: 16),

            // Các địa điểm đã thêm
            AddPlacesCard(places: addPlaces),
            const SizedBox(height: 16),

            // Thanh cuộn địa điểm
            LocationsSlider(locations: locations),
            const SizedBox(height: 16),

            // Nút điều hướng sang màn AQI
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.info_outline, color: Colors.white),
                label: const Text(
                  'Detail Air Quality',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const AqiScaleScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
