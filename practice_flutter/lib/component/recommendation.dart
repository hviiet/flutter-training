// File: component/recommendation_card.dart
import 'package:flutter/material.dart';

class RecommendationCard extends StatefulWidget {
  const RecommendationCard({super.key});

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<Map<String, dynamic>> _recommendations = const [
    {
      'title': 'General',
      'icon': Icons.sentiment_satisfied_alt,
      'color': Colors.green,
      'description':
          'With this level of air quality, you have no limitations. Enjoy the...!',
      'showMore': 'Show More',
    },
    {
      'title': 'Asthma',
      'icon': Icons.sentiment_neutral,
      'color': Colors.green,
      'description':
          'If you start to feel respiratory discomfort such as coughing or shortness of breath, reduce outdoor activities.',
      'showMore': 'Show More',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() => _currentPage = next);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Recommendations",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 97, 
              child: PageView.builder(
                controller: _pageController,
                itemCount: _recommendations.length,
                itemBuilder: (context, index) {
                  final item = _recommendations[index];
                  final bool isActive = index == _currentPage;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isActive ? item['color'] : Colors.grey.shade200,
                        width: isActive ? 1.5 : 0.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: item['color'].withOpacity(0.15),
                          child: Icon(
                            item['icon'],
                            color: item['color'],
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: item['color'],
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['description'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  height: 1.25,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['showMore'],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.blue.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _recommendations.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: _currentPage == index ? 9 : 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blue.shade600
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}