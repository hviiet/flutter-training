import 'package:flutter/material.dart';
import 'package:flutter_application_1/event/fetch_weather.dart';
import 'package:flutter_application_1/pages/aqi_scale/aqi_scale_item.dart';
import 'package:flutter_application_1/pages/home/widgets/live_location.dart';
import 'package:flutter_application_1/pages/location_detail/location_detail.dart';
import 'package:flutter_application_1/providers_and_state/weather_state.dart';
import 'package:flutter_application_1/services/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AqiScale extends StatelessWidget {
  const AqiScale({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {"icon": Icons.emoji_emotions,"title": "Low", "subTitle": "Air Quality Index: 1 to 3", "text": "Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically affect air quality forecasts within hours or even minutes..."},
      {"icon": Icons.emoji_emotions,"title": "Moderate", "subTitle": "Air Quality Index: 4 to 6", "text": "Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically..."},
      {"icon": Icons.emoji_emotions,"title": "High", "subTitle": "Air Quality Index: 7 to 8", "text": "Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically..."},
      {"icon": Icons.emoji_emotions,"title": "Very High", "subTitle": "Air Quality Index: 9 to 10", "text": "Air quality can change quickly due to both weather and human activity. Air quality forecasts are often adjusted based on weather patterns. But pollution from human activity can drastically..."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("AQI Scale"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size: 24,),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_)=> LocationDetail())
            );
          },
        ),
        titleSpacing: 60,
        leadingWidth: 100,
        titleTextStyle: TextStyle(
          fontFamily: "SF Pro Display",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: Color(0xFF111827)
        ),
      ),
      body: BlocBuilder<WeatherBloc,WeatherState>(
        builder: (context, state) {
          if(state is WeatherInitial){
            context.read<WeatherBloc>().add(FetchWeatherAndAirQuality());
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is WeatherLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is WeatherLoaded){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white
                      ),
                      child: LiveLocation(
                        aqi: state.airQuality.index!,
                        feelLike: state.weather.feelsLike!,
                        title: state.weather.name!,
                        subtitle: state.weather.country!,
                        temp: state.weather.temp!,
                        text: state.weather.description!,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white
                      ),
                      child: Column(
                        spacing: 16,
                        children: data.map((e) {
                          return AqiScaleItem(icon: e["icon"], title: e["title"], subTitle: e["subTitle"], text: e["text"]);
                        },).toList()
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else if(state is WeatherError){
            return Center(child: Text(state.message),);
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}