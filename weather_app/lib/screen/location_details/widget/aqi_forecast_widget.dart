import 'package:flutter/material.dart';
import 'package:weather_app/screen/aqi_scale/aqi_scale.dart';

class AQIForeCastWidget extends StatelessWidget {
  AQIForeCastWidget({super.key});
  final List<Map<String, dynamic>> forecastData = [
    {'day': 'SAT', 'aqi': 2, 'color': Colors.green},
    {'day': 'SUN', 'aqi': 5, 'color': Colors.green},
    {'day': 'MON', 'aqi': 7, 'color': Colors.yellow},
    {'day': 'TUE', 'aqi': 4, 'color': Colors.green},
    {'day': 'WED', 'aqi': 3, 'color': Colors.green},
    {'day': 'THU', 'aqi': 8, 'color': Colors.yellow},
    {'day': 'FRI', 'aqi': 2, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("AQI Forecast", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Next ${forecastData.length} Days",),
                ],
              ),
              Spacer(),
              Text("AQI", 
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blue
                ),
              ),
              
              IconButton(
                onPressed: (){
                  // Handle button press
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AQIScale()));
                }, 
                icon: Icon(
                  Icons.arrow_drop_down, 
                  color: Colors.blue, size: 50,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

          // AQI Value
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 35,
                  bottom: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return Container(
                        height: 1,
                        color: Colors.grey.shade300,
                      );
                    }),
                  ),
                ),

                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: forecastData.map((data) {
                        return AQIBarItem(
                          day: data['day'],
                          aqi: data['aqi'],
                          color: data['color'],
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AQIBarItem extends StatelessWidget {
  final String day;
  final int aqi;
  final Color color;
  const AQIBarItem({
    super.key,
    required this.day,
    required this.aqi,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    final double maxBarHeight = 120.0; // Chiều cao tối đa của thanh
    final double barHeight = (aqi / 10) * maxBarHeight; // Chiều cao của thanh dựa trên giá trị AQI
    return SizedBox(
      width: 30,
      height: maxBarHeight + 38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 30,
            height: maxBarHeight + 8,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: barHeight,
                    decoration: BoxDecoration(
                      color: color.withAlpha(100), // Màu nền nhạt hơn
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                Positioned(
                  bottom: barHeight > 15 ? barHeight - 15 : 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "$aqi",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            day,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),  
          )
        ],
      ),
    );
  }
}