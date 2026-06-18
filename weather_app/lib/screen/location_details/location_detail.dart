import 'package:flutter/material.dart';
import 'package:weather_app/screen/location_details/widget/air_quality_widget.dart';
import 'package:weather_app/screen/location_details/widget/aqi_forecast_widget.dart';
import 'package:weather_app/screen/location_details/widget/recommendations_widget.dart';
import 'package:weather_app/screen/location_details/widget/weather_forecast_widget.dart';
import 'package:weather_app/screen/location_details/widget/weather_widget.dart';

class LocationDetail extends StatelessWidget {
  const LocationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Location Details", style: TextStyle(color: Colors.black),),
            SizedBox(width: 8,),
            Icon(Icons.location_on, color: Colors.red,),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //location
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Church Street Square", 
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text("Birmingham",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ), 
      
              AirQualityWidget(),
              SizedBox(height: 16,),
              WeatherWidget(),
              SizedBox(height: 16,),
              AQIForeCastWidget(),
              SizedBox(height: 16,),
              WeatherForecastWidget(),
              SizedBox(height: 16,),
              RecommendationsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}