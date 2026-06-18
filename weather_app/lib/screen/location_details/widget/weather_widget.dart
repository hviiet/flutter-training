import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({super.key});
  // Dữ liệu cho thanh thời gian
  final List<Map<String, String>> hourlyData = [
    {'time': '08:00', 'temp': '15°C'},
    {'time': '09:00', 'temp': '14°C'},
    {'time': '10:00', 'temp': '13°C'},
    {'time': '11:00', 'temp': '12°C'},
    {'time': '12:00', 'temp': '12°C'},
    {'time': '13:00', 'temp': '11°C'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 16),
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
                  Text("Rain Showers",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("Feels Like 11°C",),
                ],
              ),
              Spacer(),
              Text("15°C", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(width: 8,),
              Icon(Icons.cloud, color: Colors.blue, size: 32,),
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
              itemCount: hourlyData.length,
              itemBuilder: (context, index) {
                final item = hourlyData[index];
                return HourlyItem(time: item['time']!, temp: item['temp']!);
              },
            ),
          ),

          //navigation dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(hourlyData.length > 6? 6 : hourlyData.length, (index) {
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
  const HourlyItem({super.key, required this.time, required this.temp});

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
          Icon(Icons.cloud, color: Colors.blue, size: 24,),
          SizedBox(height: 4,),
          Text("$temp", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          SizedBox(height: 4,),
          Text("$time", style: TextStyle(fontSize: 14, color: Colors.grey),),
        ],
      ),
    );
  }
}