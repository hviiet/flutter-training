import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/add_place.dart';
import 'package:flutter_application_1/pages/home/forecast_item.dart';
import 'package:flutter_application_1/pages/home/live_location.dart';
import 'package:flutter_application_1/pages/home/location.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final PageController controller = PageController();
    final PageController controller2 = PageController(viewportFraction: 0.7);

    final List<Map<String, dynamic>> data = [
      {"day": "MON", "aqi": 1, "aqiIcon": Icons.emoji_emotions, "weather": Icons.wb_sunny, "degree": 20},
      {"day": "TUE", "aqi": 2, "aqiIcon": Icons.emoji_emotions, "weather": Icons.cloud, "degree": 21},
      {"day": "WED", "aqi": 3, "aqiIcon": Icons.emoji_emotions, "weather": Icons.thunderstorm, "degree": 22},
      {"day": "THU", "aqi": 2, "aqiIcon": Icons.emoji_emotions, "weather": Icons.wb_sunny, "degree": 21},
      {"day": "FRI", "aqi": 1, "aqiIcon": Icons.emoji_emotions, "weather": Icons.wb_sunny, "degree": 20},
      {"day": "SAT", "aqi": 2, "aqiIcon": Icons.emoji_emotions, "weather": Icons.thunderstorm, "degree": 20},
      {"day": "SUN", "aqi": 3, "aqiIcon": Icons.emoji_emotions, "weather": Icons.cloud, "degree": 22},
      {"day": "MON", "aqi": 1, "aqiIcon": Icons.emoji_emotions, "weather": Icons.wb_sunny, "degree": 20},
      {"day": "TUE", "aqi": 2, "aqiIcon": Icons.emoji_emotions, "weather": Icons.cloud, "degree": 21},
      {"day": "WED", "aqi": 3, "aqiIcon": Icons.emoji_emotions, "weather": Icons.thunderstorm, "degree": 22},
      {"day": "THU", "aqi": 2, "aqiIcon": Icons.emoji_emotions, "weather": Icons.wb_sunny, "degree": 21},
      {"day": "FRI", "aqi": 1, "aqiIcon": Icons.emoji_emotions, "weather": Icons.wb_sunny, "degree": 20},
    ];

    final List<Map<String, dynamic>> locations = [
      {"street": "Edmun Street", "location": "Birmingham", "cardIcon": Icons.bookmark_outline, "aqi": 3, "aqiIcon": Icons.emoji_emotions, "degree": 25, "weatherIcon": Icons.cloud},
      {"street": "Berkley Street", "location": "Birmingham", "cardIcon": Icons.bookmark_outline, "aqi": 3, "aqiIcon": Icons.emoji_emotions, "degree": 25, "weatherIcon": Icons.cloud},
      {"street": "Edmun Street", "location": "Birmingham", "cardIcon": Icons.bookmark_outline, "aqi": 3, "aqiIcon": Icons.emoji_emotions, "degree": 25, "weatherIcon": Icons.cloud},
      {"street": "Berkley Street", "location": "Birmingham", "cardIcon": Icons.bookmark_outline, "aqi": 3, "aqiIcon": Icons.emoji_emotions, "degree": 25, "weatherIcon": Icons.cloud},
    ];


    final chunks = List.generate(
      (data.length / 6).ceil(),
      (i) => data.skip(i * 6).take(6).toList(),
    );

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only( top: 45, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SizedBox(
                height: 80,
                width: 360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back 👋",
                      style: TextStyle(
                        fontFamily: "ABeeZee",
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text("Anamoul",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "SF Pro Display",
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LiveLocation(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 211,
                        child: Column(  
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Forcast",
                              style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Expanded(
                              child: PageView.builder(
                                controller: controller,
                                itemCount: chunks.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: chunks[index].map((item)=>
                                      ForecastItem(day: item["day"], aqiIcon: item["aqiIcon"], aqi: item["aqi"], weatherIcon: item["weather"], degree: item["degree"]),
                                    ).toList()
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: SmoothPageIndicator(
                                  controller: controller, 
                                  count: (data.length/6).ceil(),
                                  effect: ExpandingDotsEffect(   
                                    dotHeight: 6,
                                    dotWidth: 6,
                                    expansionFactor: 3,
                                    spacing: 6,
                                    activeDotColor: Colors.blue,
                                    dotColor: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                spacing: 16,
                children: [
                  AddPlace(title: "Work",location: "Conventry ST, Birmingham", aqi: 3, aqiIcon: Icons.emoji_emotions, degree: 25, weatherIcon: Icons.cloud),
                  AddPlace(title: "Home",location: "Conventry ST, Birmingham", aqi: 3, aqiIcon: Icons.emoji_emotions, degree: 25, weatherIcon: Icons.cloud),
                ],
              ),
              SizedBox(
                height: 100,
                child: PageView(
                  padEnds: false,
                  controller: controller2,
                  children: locations.map((loc) {
                    return Location(
                      street: loc["street"],
                      location: loc["location"],
                      cardIcon: loc["cardIcon"],
                      aqi: loc["aqi"],
                      aqiIcon: loc["aqiIcon"],
                      degree: loc["degree"],
                      weatherIcon: loc["weatherIcon"],
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: controller2, 
                  count: locations.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    expansionFactor: 3,
                    spacing: 6,
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey.shade300,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  maximumSize: Size.fromHeight(54)
                ), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        Icon(Icons.info, color: Color(0xFF1882FF),),
                        Text("Detail Air Quality",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0,
                            color: Color(0xF5000000),
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF1882FF)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

