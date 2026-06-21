import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_detail/location_detail_bloc.dart';
import 'package:flutter_training/bloc/location_detail/location_detail_event.dart';
import 'package:flutter_training/bloc/location_detail/location_detail_state.dart';

import '../widgets/location_detail/air_quality_detail_card.dart';
import '../widgets/location_detail/aqi_forecast_chart_card.dart';
import '../widgets/location_detail/daily_weather_forecast.dart';
import '../widgets/location_detail/hourly_weather_detail.dart';
import '../widgets/location_detail/recommendation_carousel.dart';

class LocationDetailScreen extends StatelessWidget {
  const LocationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black, size: 20.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
      
        title: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Current Location',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),
          
              const SizedBox(width: 4.0),
          
              const Icon(
                Icons.gps_fixed_outlined,
                size: 18.0,
                color: Color.fromRGBO(9, 9, 9, 1),
              ),
            ],
          ),
        )
      ),

      body: BlocBuilder<LocationDetailBloc, LocationDetailState>(
        builder: (context, state) {
          if (state is LocationDetailInitial ) {
            context.read<LocationDetailBloc>().add(LoadLocationDetailEvent(cityName: 'Shanghai'));
            return const Center(child: CircularProgressIndicator());
          } 
          else if (state is LocationDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is LocationDetailError) {
            return Center(
              child: 
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message,
                        style: const TextStyle(
                          fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(164, 13, 13, 1),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          context.read<LocationDetailBloc>().add(LoadLocationDetailEvent(cityName: 'Shanghai'));
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
              ),
            );
          } 
          else if (state is LocationDetailLoaded) {
            final locationDetailData = state.locationDetailData;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const[
                        BoxShadow(
                          color:  Color.fromRGBO(0, 0, 0, 0.08),
                          blurRadius: 12.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationDetailData.location.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(17, 24, 39, 1.0),
                          ),
                        ),

                        const SizedBox(height: 4.0),

                        Text(
                          locationDetailData.location.city,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(17, 24, 39, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12.0),

                  AirQualityDetailCard(aqi: locationDetailData.location.aqi, pollutants: locationDetailData.pollutants),

                  const SizedBox(height: 12.0),

                  HourlyWeatherDetail(currentLocation: locationDetailData.location, hourlyForecasts: locationDetailData.hourlyForecasts),

                  const SizedBox(height: 12.0),

                  AqiForecastChartCard(aqiForecasts: locationDetailData.dailyAqiForecasts),

                  const SizedBox(height: 12.0),

                  DailyWeatherForecast(dailyForecasts: locationDetailData.dailyWeatherForecasts),

                  const SizedBox(height: 12.0),

                  RecommendationCarousel(),
                
                  const SizedBox(height: 30.0),
                ],
              ),
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
                      context.read<LocationDetailBloc>().add(LoadLocationDetailEvent(cityName: 'Shanghai'));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
        },
      )
    );
  }
}