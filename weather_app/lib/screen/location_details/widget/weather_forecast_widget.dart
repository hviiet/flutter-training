import 'package:flutter/material.dart';

class WeatherForecastWidget extends StatelessWidget {
  WeatherForecastWidget({super.key});
  // Dữ liệu 7 ngày
    final List<Map<String, dynamic>> forecastData = [
      {'day': 'THU 11 NOV 21', 'label': 'TODAY', 'high': '25°C', 'low': '20°C', 'icon': Icons.cloudy_snowing},
      {'day': 'FRI 12 NOV 21', 'label': 'TOMORROW', 'high': '25°C', 'low': '20°C', 'icon': Icons.wb_cloudy_outlined},
      {'day': 'SAT 13 NOV 21', 'label': '', 'high': '25°C', 'low': '20°C', 'icon': Icons.wb_sunny_outlined},
      {'day': 'SAT 14 NOV 21', 'label': '', 'high': '25°C', 'low': '20°C', 'icon': Icons.cloudy_snowing},
      {'day': 'FRI 15 NOV 21', 'label': '', 'high': '25°C', 'low': '20°C', 'icon': Icons.cloud_outlined},
      {'day': 'SAT 16 NOV 21', 'label': '', 'high': '25°C', 'low': '20°C', 'icon': Icons.thunderstorm_outlined},
      {'day': 'FRI 17 NOV 21', 'label': '', 'high': '25°C', 'low': '20°C', 'icon': Icons.wind_power_outlined},
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weather Forecast",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Next ${forecastData.length} Days"),
          SizedBox(height: 16),

          //list weather forecast
          Column(
            children: forecastData.map((data){
              return WeatherRow(
                day: data['day'],
                high: data['high'],
                low: data['low'],
                label: data['label'],
                icon: data['icon'],
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
  final IconData icon;

  const WeatherRow({
    super.key,
    required this.day,
    required this.label,
    required this.high,
    required this.low,
    required this.icon
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
          Text("$high", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("°C", style: TextStyle(fontSize: 12, color: Colors.grey),),
          Icon(Icons.arrow_upward, color: Colors.green, size: 12,),

          SizedBox(width: 8,),

          Text("$low", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("°C", style: TextStyle(fontSize: 12, color: Colors.grey),),
          Icon(Icons.arrow_downward, color: Colors.red, size: 12,),

          SizedBox(width: 8,),

          Icon(icon, color: Colors.blue, size: 24,),
        ],
      ),
    );
  }
}