import 'package:flutter/material.dart';
import 'package:weather_app/extension/weather_extension.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherWidget extends StatefulWidget {
  WeatherWidget({super.key, required this.weatherData});
  final WeatherModel weatherData;
  final int currentHour = DateTime.now().hour;
  
  @override
  State<StatefulWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final PageController pageController = PageController(viewportFraction: 0.3);
  int currentPage = 0;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    totalPages = widget.weatherData.hourlyForecast.length > 6 ? 6 : widget.weatherData.hourlyForecast.length;
    pageController.addListener(() {
      int nextPage = pageController.page?.round() ?? 0;
      if (currentPage != nextPage) {
        setState(() {
          double page = pageController.page ?? 0;
          currentPage = (page).round();
        });
      }
    });
  }

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
                  Text(widget.weatherData.conditionText,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("Feels Like ${widget.weatherData.feelslike_c.toStringAsFixed(0)}°C",),
                ],
              ),
              Spacer(),
              Text("${widget.weatherData.temp_c.toStringAsFixed(0)}°C", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(width: 8,),
              // Icon(Icons.cloud, color: Colors.blue, size: 32,),
                Image.network(widget.weatherData.conditionIcon, width: 32, height: 32,),
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
              controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: widget.weatherData.hourlyForecast.length - widget.currentHour,
              itemBuilder: (context, index) {
                final item = widget.weatherData.hourlyForecast[index + widget.currentHour];
                return HourlyItem(time: item.time.hour.toString(), temp: item.temp_c.toStringAsFixed(0), iconUrl: item.condition.conditionIconUrl);
              },
            ),
          ),

          //navigation dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.weatherData.hourlyForecast.length - widget.currentHour - 5 > 6? 6 : widget.weatherData.hourlyForecast.length - widget.currentHour - 5, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentPage ? Colors.blue : Colors.grey.shade300,
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