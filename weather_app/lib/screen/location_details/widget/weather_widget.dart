import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({super.key, required this.weatherData});
  final WeatherModel weatherData;
  final int currentHour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Text("Weather", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height: 6,),
          //weather now
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Now",),
                  Text(weatherData.conditionText,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("Feels Like ${weatherData.feelslike_c.toStringAsFixed(0)}°C",),
                ],
              ),
              Spacer(),
              Text("${weatherData.temp_c.toStringAsFixed(0)}°C", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(width: 8,),
              // Icon(Icons.cloud, color: Colors.blue, size: 32,),
                Image.network(weatherData.conditionIcon, width: 32, height: 32,),
            ],
          ),
          SizedBox(height: 6,),

          //list weather hourly
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: weatherData.hourlyForecast.length - currentHour,
              itemBuilder: (context, index) {
                final item = weatherData.hourlyForecast[index + currentHour];
                return HourlyItem(time: item.time.hour.toString(), temp: item.temp_c.toStringAsFixed(0), iconUrl: item.conditionIcon);
              },
            ),
          ),

          //navigation dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(weatherData.hourlyForecast.length > 6? 6 : weatherData.hourlyForecast.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.blue : Colors.grey.shade300,
                ),
              );
            }),
          ),


        ],
      ),
    );
  }
}


class HourlyItem extends StatelessWidget {
  final String time;
  final String temp;
  final String iconUrl;
  const HourlyItem({super.key, required this.time, required this.temp, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: EdgeInsets.only(right: 4,),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(iconUrl, width: 24, height: 24,),
          SizedBox(height: 4,),
          Text('$temp°C', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          SizedBox(height: 4,),
          Text('$time:00', style: TextStyle(fontSize: 14, color: Colors.grey),),
        ],
      ),
    );
  }
}