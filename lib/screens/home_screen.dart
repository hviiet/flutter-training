import 'package:flutter/material.dart';
import 'package:flutter_training/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../data/mock_data.dart';
import '../widgets/location_card.dart';
import '../widgets/action_list_tile.dart';
import '../widgets/weather_summary_card.dart';
import '../widgets/large_locations_carousel.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    
    final mainLocation = MockData.mainLocation;
    final forecasts = MockData.forecasts;
    final smallLocations = MockData.smallLocations;
    final largeLocations = MockData.largeLocations;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(17, 24, 39, 0.6),
                      ),
                    ),

                    const SizedBox(width: 4.0),

                    Icon(
                      Icons.waving_hand_outlined,
                      size: 22.0,
                      color: const Color.fromRGBO(255, 165, 0, 1.0),
                    ),
                  ],
                ),

                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    return Text(
                      authProvider.userProfile != null ? authProvider.userProfile!.name : 'User',
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                        color:  Color.fromRGBO(17, 24, 39, 1.0),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 8.0),

                WeatherSummaryCard(location: mainLocation, forecasts: forecasts),

                const SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LocationCard(location: smallLocations[0], type: LocationCardType.small),
                    const SizedBox(width: 12.0),
                    LocationCard(location: smallLocations[1], type: LocationCardType.small),
                  ],
                ),

                const SizedBox(height: 10.0),

                LargeLocationsCarousel(locations: largeLocations),

                const SizedBox(height: 18.0),

                ActionListTile(
                  title: 'Detail Air Quality',
                  icon: Icons.info_outline,
                  onTap: () {
                    // Handle tap action
                  },
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
