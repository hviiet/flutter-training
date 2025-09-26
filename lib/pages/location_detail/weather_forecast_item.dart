import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/degree.dart';
import 'package:intl/intl.dart';

class WeatherForecastItem extends StatelessWidget {
  final String date;
  final bool isToday;
  final bool isTomorrow;
  final double maxTemp;
  final double minTemp;
  final String icon;

  const WeatherForecastItem({
    super.key,
    required this.date,
    required this.isToday,
    required this.isTomorrow,
    required this.maxTemp,
    required this.minTemp,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      DateTime dt = DateTime.parse(dateString);
      DateFormat formatter = DateFormat('EEE dd MMM yy');
      return formatter.format(dt).toUpperCase(); 
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0x0F000000),
              offset: Offset(0, 4),                
              blurRadius: 30,                       
              spreadRadius: 0,   
            )
        ]
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formatDate(date),
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0
                  ),
                ),
                (isToday)?Text("T O D A Y",
                            style: TextStyle(
                              fontFamily: "ABeeZee",
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              color: Color(0x66000000)
                  ))
                  :(isTomorrow)?Text("T O M O R R O W",
                                  style: TextStyle(
                                    fontFamily: "ABeeZee",
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    color: Color(0x66000000)
                  )):const SizedBox.shrink()
              ],
            ),
            Row(
              children: [
                Degree(degree: maxTemp, degreeSize: 16, textSize: 8),
                Icon(Icons.arrow_upward,color: Color(0xFF56BF30),size: 6,),
                SizedBox(width: 8,),
                Degree(degree: minTemp, degreeSize: 16, textSize: 8),
                Icon(Icons.arrow_downward,color: Color(0xFFFF3A2C),size: 6,),
                SizedBox(width: 8,),
                Image.network("https:$icon", color:Color(0xFF5D5FEF) , height: 20,width: 20,fit: BoxFit.contain,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
