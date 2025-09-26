import 'package:flutter/material.dart';
import 'package:flutter_application_1/event/fetch_weather.dart';
import 'package:flutter_application_1/pages/location_detail/air_quality.dart';
import 'package:flutter_application_1/pages/location_detail/aq_forecast.dart';
import 'package:flutter_application_1/pages/location_detail/recommendations.dart';
import 'package:flutter_application_1/pages/location_detail/weather.dart';
import 'package:flutter_application_1/pages/location_detail/weather_forecast.dart';
import 'package:flutter_application_1/pages/login/navigate.dart';
import 'package:flutter_application_1/providers_and_state/weather_state.dart';
import 'package:flutter_application_1/services/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationDetail extends StatelessWidget {
  const LocationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc,WeatherState>(
      builder: (context, state) {
        if(state is WeatherInitial){
          context.read<WeatherBloc>().add(FetchWeatherAndAirQuality());
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is WeatherLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is WeatherLoaded){
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new,color: Color(0xFF111827)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_)=> Navigate())
                  );
                },
                
              ),
              actions: [
                Text("Current Location",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.my_location,color: Color(0xFF111827),),
                )
              ],
              toolbarHeight: 100,
              actionsPadding: EdgeInsets.only(right: 32),
              leadingWidth: 72,
              backgroundColor: Colors.grey[200],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 2,
                          children: [
                            Text("Church Street Square",
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5
                              ),
                            ),
                            Text("Birmingham",
                              style: TextStyle(
                                fontFamily: "ABeeZee",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    AirQuality(
                      aqi: state.airQuality.index, 
                      o3: state.airQuality.o3, 
                      pm10: state.airQuality.pm10, 
                      co: state.airQuality.co, 
                      no2: state.airQuality.no2, 
                      so2: state.airQuality.so2, 
                      pm2_5: state.airQuality.pm2_5
                    ),
                    Weather(
                      weatherData: state.weather.forecastHours,
                      description: state.weather.description,
                      feelsLike: state.weather.feelsLike,
                    ),
                    AqForecast(chartData: state.airQuality.aqiDays!,),
                    WeatherForecast(weatherData: state.weather.forecast,),
                    Recommendations(),
                    SizedBox(height: 34,)
                  ],
                ),
              ),
            ),
          );
        }
        else if(state is WeatherError){
          return Center(child: Text(state.message),);
        }
        else{
          return Center(child: Text("Something went wrong!"),);
        }
      },
    );
  }
}