import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/aqi_scale/aqi_scale_bloc.dart';
import 'package:flutter_training/bloc/aqi_scale/aqi_scale_event.dart';
import 'package:flutter_training/bloc/aqi_scale/aqi_scale_state.dart';
import 'package:flutter_training/models/weather_location.dart';
import 'package:flutter_training/widgets/common/aqi_status_icon.dart';

import '../widgets/aqi_scale/aqi_info_card.dart';

class AqiScaleScreen extends StatelessWidget {

  const AqiScaleScreen({super.key});

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
        centerTitle: true,
        title: Text(
          'Air Scale',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(17, 24, 39, 1.0),
          ),
        ),
      ),

      body: BlocBuilder<AqiScaleBloc, AqiScaleState>(
        builder: (context, state) {
          if (state is AqiScaleInitial) {
            context.read<AqiScaleBloc>().add(LoadAqiScale(cityName: 'Shanghai'));
            return const Center(child: CircularProgressIndicator());
          } 
          if (state is AqiScaleLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if(state is AqiScaleLoaded){
            WeatherLocation location = state.weatherLocation;
            return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
                child: Column(
                  children: [

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.08),
                            blurRadius: 10.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.gps_fixed_outlined,
                                size: 25.0,
                                color: Colors.blue[700],
                              ), 

                              const SizedBox(width: 4.0),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    location.name,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(17, 24, 39, 1.0),
                                    ),
                                  ),

                                  Text(
                                    location.city,
                                    style: const TextStyle(
                                      fontSize: 13.0,
                                      color: Color.fromRGBO(91, 91, 91, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 8.0),

                          Row(
                            children: [
                              Image.network(
                                location.conditionIcon,
                                width: 25.0,
                                height: 25.0,
                              ),

                              const SizedBox(width: 4.0),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${location.temp}°C',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(17, 24, 39, 1.0),
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        location.conditionText,
                                        style: const TextStyle(
                                          fontSize: 13.0,
                                          color: Color.fromRGBO(91, 91, 91, 1),
                                        ),
                                      ),

                                      const SizedBox(width: 2.0),

                                      Text(
                                        'Feels like ${location.feelsLike}°C',
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Color.fromRGBO(91, 91, 91, 1),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),

                              const Spacer(),

                              Text(
                                '${location.aqi}',
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(17, 24, 39, 1.0),
                                ),
                              ),

                              Text(
                                ' AQI',
                                style: const TextStyle(
                                  fontSize: 13.0,
                                  color: Color.fromRGBO(91, 91, 91, 1),
                                ),
                              ),
                              
                              const SizedBox(width: 6.0),

                              AqiStatusIcon(aqi: location.aqi, size: 25.0),
                            ],
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 12.0),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.08),
                            blurRadius: 10.0,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          AqiInfoCard(
                            level: 'Low',
                            minValue: 0,
                            maxValue: 50,
                            description: 'Air quality is considered satisfactory, and air pollution poses little or no risk.',
                            icon: Icons.sentiment_very_satisfied_outlined,
                            iconColor: Colors.green,
                          ),

                          const SizedBox(height: 12),

                          AqiInfoCard(
                            level: 'Moderate',
                            minValue: 51,
                            maxValue: 100,
                            description: 'Air quality is acceptable; however, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.',
                            icon: Icons.sentiment_neutral,
                            iconColor: Colors.yellow[700]!,
                          ),

                          const SizedBox(height: 12),

                          AqiInfoCard(
                            level: 'High',
                            minValue: 101,
                            maxValue: 150,
                            description: 'Members of sensitive groups may experience health effects. The general public is less likely to be affected.',
                            icon: Icons.sentiment_very_dissatisfied,
                            iconColor: Colors.red[700]!,
                          ),

                          const SizedBox(height: 12),

                          AqiInfoCard(
                            level: 'Very High',
                            minValue: 151,
                            maxValue: 200,
                            description: 'Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.',
                            icon: Icons.mood_bad_outlined,
                            iconColor: Colors.purple[700]!,
                          ),
                        ],  
                      ),
                    ),
                  ],
                ),
              );
          }
          else if (state is AqiScaleError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AqiScaleBloc>().add(LoadAqiScale(cityName: 'Shanghai'));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              )
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
                      context.read<AqiScaleBloc>().add(LoadAqiScale(cityName: 'Shanghai'));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              )
            );
          }
        }
      )
    );
  }
  
}