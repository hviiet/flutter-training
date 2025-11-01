import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_event.dart';
import 'package:flutter_training/models/aqi_scale_info.dart';
import 'package:flutter_training/components/location_detail/air_quality_card.dart';
import 'package:flutter_training/components/location_detail/weather_card.dart';
import 'package:flutter_training/components/location_detail/aq_forecast_section.dart';
import 'package:flutter_training/components/location_detail/weather_forecast_section.dart';
import 'package:flutter_training/components/location_detail/recommendations_section.dart';

class LocationDetailPage extends StatefulWidget {
  final String location;

  const LocationDetailPage({
    super.key,
    required this.location,
  });

  @override
  State<LocationDetailPage> createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  @override
  void initState() {
    super.initState();
    _loadDataIfNeeded();
  }

  void _loadDataIfNeeded() {
    final bloc = context.read<LocationDetailsBloc>();
    final currentState = bloc.state;
    
    // Only load if we don't have data for this location
    if (currentState is LocationDetailsInitial) {
      bloc.add(LoadLocationDetails(location: widget.location));
    } else if (currentState is LocationDetailsLoaded) {
      // Check if current data is for a different location
      if (currentState.weatherData.location.toLowerCase() != widget.location.toLowerCase()) {
        bloc.add(LoadLocationDetails(location: widget.location));
      }
    } else if (currentState is LocationDetailsError) {
      bloc.add(LoadLocationDetails(location: widget.location));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Current Location',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[600]),
          ],
        ),
        centerTitle: true,
        actions: const [
          SizedBox(width: 48), // Balance the leading icon
        ],
      ),
      body: BlocBuilder<LocationDetailsBloc, LocationDetailsState>(
        builder: (context, state) {
          if (state is LocationDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LocationDetailsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LocationDetailsBloc>().add(
                              LoadLocationDetails(location: widget.location),
                            );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is LocationDetailsLoaded) {
            final airQuality = state.weatherData.current.airQuality;
            final aqi = airQuality?.aqi ?? 4;  // Use AQI 1-10 scale, default to 4 (moderate)
            final aqiInfo = AQIScaleInfo.fromAQI(aqi);
            final weather = state.weatherData.current;
            final forecast = state.weatherData.forecast;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<LocationDetailsBloc>().add(
                      RefreshLocationDetails(location: widget.location),
                    );
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Location Name
                      Text(
                        state.weatherData.location,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.weatherData.region,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Air Quality Card
                      AirQualityCard(
                        aqi: aqi,
                        aqiInfo: aqiInfo,
                        airQuality: airQuality,
                        location: state.weatherData.location,
                        region: state.weatherData.region,
                        current: weather,
                      ),
                      const SizedBox(height: 16),

                      // Current Weather Card with Hourly Forecast
                      WeatherCard(
                        current: weather,
                        hourlyForecast: forecast.isNotEmpty ? forecast[0].hourly : [],
                      ),
                      const SizedBox(height: 16),

                      // AQ Forecast
                      AQForecastSection(forecast: forecast),
                      const SizedBox(height: 16),

                      // Weather Forecast
                      WeatherForecastSection(forecast: forecast),
                      const SizedBox(height: 16),

                      // Recommendations
                      const RecommendationsSection(),
                    ],
                  ),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
