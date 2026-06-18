import 'package:flutter/material.dart';
import 'package:weather_app/utils/air_quality_painter.dart';
import 'package:weather_app/utils/utils.dart';

class AirQualityWidget extends StatelessWidget {
  final aqiValue = 12; // Giá trị AQI mẫu, bạn có thể thay đổi hoặc lấy từ dữ liệu thực tế
  const AirQualityWidget({super.key});



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
        children: [
          //title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Air Quality",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 16),

          //aqi value
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //background circle
                Positioned.fill(child: CustomPaint(painter: AirQualityPainter(progress: aqiValue / 500),)),
                //aqi value
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$aqiValue', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                        Text(' AQI', style: TextStyle(fontSize: 16, color: Colors.grey),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils().mapAQIToIcon('$aqiValue'),
                        Text("Low", style: TextStyle(fontSize: 16, color: Colors.green),),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 16),

          // Air Quality Items
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: AirAQualityItem(title: "O3", value: "52")),
                  Expanded(child: AirAQualityItem(title: "PM10", value: "25")),
                  Expanded(child: AirAQualityItem(title: "NO", value: "22")),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: AirAQualityItem(title: "NO2", value: "12")),
                  Expanded(child: AirAQualityItem(title: "PM1", value: "16")),
                  Expanded(child: AirAQualityItem(title: "PM2.5", value: "2.2")),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AirAQualityItem extends StatelessWidget {
  final String title;
  final String value;
  const AirAQualityItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    //chiều rộng của mỗi item sẽ là 1/3 chiều rộng của Row cha, trừ đi khoảng cách giữa các item
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          //progress indicator
          Container(
            width: 8,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
    
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.6, // Tỷ lệ chiều cao của thanh tiến trình (0.0 đến 1.0)
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title (ug/m3)", 
                  style: TextStyle(fontSize: 12,),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 4,),
                Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}