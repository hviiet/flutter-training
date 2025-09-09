import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_training/provider/tab_provider.dart';
import 'package:flutter_training/components/current_state.dart';
import 'package:flutter_training/components/navigate_under.dart';
import 'package:flutter_training/components/location.dart';
import 'package:flutter_training/components/place_add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      Location(
        title: 'Edmund Street',
        address: 'Birmingham',
        aqi: 5,
        aqiIcon: Icons.sentiment_satisfied,
        temp: 21,
        weatherIcon: Icons.ac_unit,
        trailingIcon: Icons.wallet,
      ),
      Location(
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
            CurrentState(
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
            AddPlaces(places: addPlaces),
            const SizedBox(height: 16),
            LocationsSlider(locations: locations),
            const SizedBox(height: 16),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.blue),
                title: const Text('Detail Air Quality'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<TabProvider>(
        builder: (context, tabProvider, _) => UnderNavigate(
          currentIndex: tabProvider.currentIndex,
          onTap: (index) => tabProvider.setTab(index, context),
        ),
      ),
    );
  }
}
