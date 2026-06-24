import 'package:flutter/material.dart';
import 'package:weather_app/extension/weather_extension.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({super.key, required this.weatherModel});

    final WeatherModel weatherModel;
  

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
          Text(
            "Weather Forecast",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Next ${weatherModel.forecast.length} Days"),
          SizedBox(height: 16),

          //list weather forecast
          Column(
            children: weatherModel.forecast.map((data){
              return WeatherRow(
                day: Utils().mapDayInWeek(data.date.weekday),
                high: data.day.avgtemp_c.toStringAsFixed(0),
                low: data.day.mintemp_c.toStringAsFixed(0),
                label: Utils().mapCurrentDay(data.date),
                iconUrl: data.day.condition.conditionIconUrl,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class WeatherRow extends StatelessWidget {
  final String day;
  final String label;
  final String high;
  final String low;
  final String iconUrl;

  const WeatherRow({
    super.key,
    required this.day,
    required this.label,
    required this.high,
    required this.low,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(day, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              if(label.isNotEmpty)Text(label, style: TextStyle( color: Colors.grey, fontSize: 10),),
            ],
          ),
          Spacer(),
          Text(high, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("°C", style: TextStyle(fontSize: 12, color: Colors.grey),),
          Icon(Icons.arrow_upward, color: Colors.green, size: 12,),

          SizedBox(width: 8,),

          Text(low, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("°C", style: TextStyle(fontSize: 12, color: Colors.grey),),
          Icon(Icons.arrow_downward, color: Colors.red, size: 12,),

          SizedBox(width: 8,),

          Image.network(
            iconUrl,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}