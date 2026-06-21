import 'package:flutter/material.dart';
import 'package:flutter_training/bloc/home/home_bloc.dart';
import 'package:flutter_training/bloc/home/home_event.dart';
import 'package:flutter_training/bloc/home/home_state.dart';
import 'package:flutter_training/providers/auth_provider.dart';
import 'package:flutter_training/screens/location_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home/location_card.dart';
import '../widgets/common/action_list_tile.dart';
import '../widgets/home/weather_summary_card.dart';
import '../widgets/home/large_locations_carousel.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if( state is HomeInitial) {
            context.read<HomeBloc>().add(LoadHomeDataEvent());
            return const Center(child: CircularProgressIndicator());
          } 
          else if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is HomeError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Failed to load data.'),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(LoadHomeDataEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } 
          else if (state is HomeLoaded) {
            final data = state.homeData;

            return LayoutBuilder(
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

                      WeatherSummaryCard(location: data.mainLocation, forecasts: data.forecasts),

                      const SizedBox(height: 15.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LocationCard(location: data.smallLocations[0], type: LocationCardType.small),
                          LocationCard(location: data.smallLocations[1], type: LocationCardType.small),
                        ],
                      ),

                      const SizedBox(height: 15.0),

                      LargeLocationsCarousel(locations: data.largeLocations),

                      const SizedBox(height: 18.0),

                      ActionListTile(
                        title: 'Detail Air Quality',
                        icon: Icons.info_outline,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } 
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Error: Unknown state'),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(LoadHomeDataEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
          );
          }
        },
      ),
    );
  }
}
