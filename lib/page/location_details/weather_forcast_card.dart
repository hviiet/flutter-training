import 'package:flutter/material.dart';

class WeatherForcastCard extends StatelessWidget {
  final String day;
  final String todayOrTomorrow;
  final int high;
  final int low;
  final String iconPath;
  const WeatherForcastCard({
    super.key,
    required this.day,
    required this.high,
    required this.low,
    required this.iconPath,
    required this.todayOrTomorrow,
  });

  String _changeDayFormat(String raw) {
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw.toUpperCase();
    const wds = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    const mos = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    final wd = wds[(dt.weekday - 1) % 7];
    final dd = dt.day.toString().padLeft(2, '0');
    final mon = mos[dt.month - 1];
    final yy = (dt.year % 100).toString().padLeft(2, '0');
    return '$wd $dd $mon $yy';
  }

  @override
  Widget build(BuildContext context) {
    final dayLabel = _changeDayFormat(day);

    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.06),
            offset: const Offset(0, 4),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dayLabel,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.0,
                  letterSpacing: 0.0,
                  color: Color.fromRGBO(0, 0, 0, 0.96),
                ),
              ),
              if (todayOrTomorrow.isNotEmpty) ...[
                SizedBox(height: 4),
                Text(
                  todayOrTomorrow.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                    height: 1.0,
                    letterSpacing: 1.5,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
              ],
            ],
          ),
          Spacer(),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    '$high',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  Text(
                    '°C'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                  SizedBox(width: 4),
                  Image.asset('assets/images/locationdetails/high.png'),
                ],
              ),
              SizedBox(width: 8),
              Row(
                children: [
                  Text(
                    '$low',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  Text(
                    '°C'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                  SizedBox(width: 4),
                  Image.asset('assets/images/locationdetails/low.png'),
                ],
              ),
              SizedBox(width: 8),
              Image.asset(iconPath, width: 24, height: 24, fit: BoxFit.cover),
            ],
          ),
        ],
      ),
    );
  }
}
