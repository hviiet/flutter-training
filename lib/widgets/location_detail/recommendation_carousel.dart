import 'package:flutter/material.dart';

class RecommendationCarousel extends StatefulWidget {
  const RecommendationCarousel({super.key});

  @override
  State<RecommendationCarousel> createState() => _RecommendationCarouselState();
}

class _RecommendationCarouselState extends State<RecommendationCarousel> {
  int _currentRecommendationIndex = 0;
  final PageController _recommendationPageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _recommendationPageController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> recommendations = [
    {'title': 'General', 'message': 'With this level of air quality, you have no limitations. Enjoy the outdoors and open your windows.'},
    {'title': 'Asthma', 'message': 'If you start to feel respiratory symptoms such as coughing or shortness of breath, reduce intensity.'},
    {'title': 'General', 'message': 'With this level of air quality, you have no limitations. Enjoy the outdoors and open your windows.'},
    {'title': 'Asthma', 'message': 'If you start to feel respiratory symptoms such as coughing or shortness of breath, reduce intensity.'},
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Text(
            'Recommendations',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(90, 90, 90, 1.0),
            ),
          ),
        ),
        const SizedBox(height: 12.0),

        SizedBox(
          height: 130.0,
          child: PageView.builder(
            controller: _recommendationPageController,
            itemCount: recommendations.length,
            padEnds: false,
            onPageChanged: (index) {
              setState(() {
                _currentRecommendationIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final recommendation = recommendations[index];
              return _buildRecommendationCard(recommendation);
            },
          ),
        ),

        const SizedBox(height: 8.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(recommendations.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentRecommendationIndex == index ? 24.0 : 6.0,
              height: 6.0,
              decoration: BoxDecoration(
                color: _currentRecommendationIndex == index ? const Color.fromRGBO(15, 95, 255, 1) : const Color.fromRGBO(119, 115, 115, 1),
                borderRadius: BorderRadius.circular(3.0),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildRecommendationCard(Map<String, String> recommendation) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.sentiment_very_satisfied,
            size: 24.0,
            color: const Color.fromARGB(255, 6, 255, 6),
          ),

          const SizedBox(width: 4.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recommendation['title']!,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(17, 24, 39, 1.0),
                ),
              ),

              const SizedBox(height: 4.0),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  recommendation['message']!,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(90, 90, 90, 1.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}