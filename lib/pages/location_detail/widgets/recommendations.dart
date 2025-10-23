import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/location_detail/widgets/recommendations_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pg = PageController(viewportFraction: 0.7);

    final List<Map<String, String>> data = [
      {"title":"General", "text":"With this level of air quality, you have no limitations. Enjoy the ... "},
      {"title":"Asthma", "text":"If you start to feel respiratory discomfort such as coughing or ... "},
      {"title":"General", "text":"With this level of air quality, you have no limitations. Enjoy the outdoors..."},
      {"title":"Asthma", "text":"If you start to feel respiratory discomfort such as coughing or breathing... "},
    ];

    return Container(
      height: 128,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recommendations",
            style: TextStyle(
              fontFamily: "ABeeZee",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.5,
              color: Color(0xB8000000)
            ),
          ),
          Expanded(
            child: PageView(
              padEnds: false,
              controller: pg,
              children: data.map((e) {
                return RecommendationsItem(title: e["title"]!, text: e["text"]!);
              },).toList(),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: pg, 
              count: 4,
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
    );
  }
}