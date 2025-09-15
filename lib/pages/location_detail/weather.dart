import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/location_detail/weather_item.dart';
import 'package:flutter_application_1/widgets/degree.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int groupPage = 0;
  PageController pg = PageController(viewportFraction: 0.15);

  List<Map<String,dynamic>> weatherData = [
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
      {"icon":Icons.cloud,"degree":15, "time":"08:00" },
    ];

  @override
  void initState() {
    super.initState();
    pg.addListener(() {
        final currentPage = pg.page ?? 0;
        final newGroupPage = (currentPage/6).ceil();
          if(newGroupPage != groupPage){
            setState(() {
              groupPage = newGroupPage;
            });
          }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
      ),
      height: 224,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Weather",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: "SF Pro Display",
                letterSpacing: 0
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NOW",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        letterSpacing: 1.5,
                        color: Color(0xB8000000)
                      ),
                    ),
                    Text("Rain Shower",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SF Pro Display",
                        letterSpacing: 0
                      ),
                    ),
                    Text("Feel like 11°C",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        letterSpacing: 0,
                        color: Color(0xB8000000)
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 4,
                  children: [
                    Degree(degree: 15, degreeSize: 24, textSize: 10),
                    Icon(Icons.cloud,color: Color(0xFF5D5FEF),)
                  ],
                )
              ],
            ),
            Expanded(
              child: PageView(
                padEnds: false,
                controller: pg,
                children: weatherData.map((e) {
                  return WeatherItem(icon: e["icon"],degree: e["degree"],time: e["time"],);
                },).toList()
              ),
            ),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: groupPage,
                count: (weatherData.length/6).ceil(),
                effect: ExpandingDotsEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  expansionFactor: 3,
                  spacing: 6,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}