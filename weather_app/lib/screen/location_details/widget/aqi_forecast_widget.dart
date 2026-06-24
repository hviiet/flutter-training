import 'package:flutter/material.dart';
import 'package:weather_app/models/air_quality_model.dart';
import 'package:weather_app/screen/aqi_scale/aqi_scale.dart';
import 'package:weather_app/utils/utils.dart';

class AQIForeCastWidget extends StatelessWidget {
  const AQIForeCastWidget({super.key, required this.airQualityModel});

  final AirQualityModel airQualityModel;

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
                  Text("Next ${airQualityModel.forecast.length} Days",),
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
                      children: airQualityModel.forecast.map((data) {
                        return AQIBarItem(
                          day: Utils().mapDayInWeek(data.day.weekday),
                          aqi: data.avg.toInt(),
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
  const AQIBarItem({
    super.key,
    required this.day,
    required this.aqi,
  });

  @override
  Widget build(BuildContext context) {
    final double maxBarHeight = 120.0; // Chiều cao tối đa của thanh
    final double barHeight = (aqi / 150) * maxBarHeight; // Chiều cao của thanh dựa trên giá trị AQI
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
                      color: Utils().mapAQIToColor(aqi.toString()).withAlpha(100), // Màu nền nhạt hơn
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
                      color: Utils().mapAQIToColor(aqi.toString()),
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