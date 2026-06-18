import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AQIScale extends StatelessWidget {
  AQIScale({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'title': 'Low',
      'subtitle': '0-50',
      'description': 'Air quality is considered satisfactory, and air pollution poses little or no risk.',
      'icon': Icon(Icons.mood, color: Colors.green, size: 24,),
    },
    {
      'title': 'Moderate',
      'subtitle': '51-100',
      'description': 'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.',
      'icon': Icon(Icons.mood, color: Colors.yellow, size: 24,),
    },
    {
      'title': 'Unhealthy for Sensitive Groups',
      'subtitle': '101-150',
      'description': 'Members of sensitive groups may experience health effects. The general public is not likely to be affected.',
      'icon': Icon(Icons.mood_bad, color: Colors.orange, size: 24,),
    },
    {
      'title': 'Unhealthy',
      'subtitle': '151-200',
      'description': 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects.',
      'icon': Icon(Icons.mood_bad, color: Colors.red, size: 24,),
    },
    {
      'title': 'Very Unhealthy',
      'subtitle': '201-300',
      'description': 'Health alert: everyone may experience more serious health effects.',
      'icon': Icon(Icons.sentiment_very_dissatisfied, color: Colors.purple, size: 24,),
    },
    {
      'title': 'Hazardous',
      'subtitle': '>300',
      'description': "Health warnings of emergency conditions. The entire population is more likely to be affected.",
      'icon': Icon(Icons.sentiment_very_dissatisfied, color: Colors.brown, size: 24,),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AQI Scale"),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                MainWeatherCard(),
                SizedBox(height: 16,),

                //list scale
                Column(
                  children: data.map( (item) => ScaleCard(
                    title: item['title'], 
                    subtitle: item['subtitle'], 
                    description: item['description'], 
                    icon: item['icon'],
                  )).toList(),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),),
      child: Column(
        children: [
          //header
          Row(
            children: [
              Icon(Icons.gps_fixed, color: Colors.blue,),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text("Church Street Square", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Bimingham", style: TextStyle(color: Colors.grey),),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.cloud),
              SizedBox(width: 8,),
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text("19°C", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Rain Shower", style: TextStyle(color: Colors.grey),),
                ],
              ),
              Spacer(),
              Text("3", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23,),),
              Text("AQI", style: TextStyle(color: Colors.grey),),
              SizedBox(width: 8,),
              Icon(Icons.mood, color: Colors.green,),
            ],
          ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }
}


class ScaleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final Icon icon;
  const ScaleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Text(subtitle, style: TextStyle(color: Colors.grey),),
                SizedBox(height: 4,),
                ReadMoreText(
                  description,
                  trimLines: 2, // so dong toi da hien thi trong trang thai rut gon
                  trimMode: TrimMode.Line, // chinh sach cat noi dung
                  trimCollapsedText: 'Show more', // text hien khi noi dung bi cat
                  trimExpandedText: ' Show less', // text hien khi noi dung duoc mo rong
                  moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87), 
                  lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87), 
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}