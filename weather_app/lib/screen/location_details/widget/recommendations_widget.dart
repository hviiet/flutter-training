import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class RecommendationsWidget extends StatefulWidget {
  RecommendationsWidget({super.key});
  final List<Map<String, String>> recommendations = [
    {'title': 'Wear a mask', 'description': 'Due to high pollution levels, it is recommended to wear a mask when going outside. Due to high pollution levels, it is recommended to wear a mask when going outside.'},
    {'title': 'Limit outdoor activities', 'description': 'Try to limit outdoor activities, especially for children and the elderly.'},
    {'title': 'Use air purifiers', 'description': 'Consider using air purifiers indoors to improve air quality fgkljfgklfgjkldfglkfdglgf.'},
  ];

  
  @override
  State<StatefulWidget> createState() => _RecommendationsWidgetState();
}

class _RecommendationsWidgetState extends State<RecommendationsWidget> {
  final PageController pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    totalPages = widget.recommendations.length;
    pageController.addListener(() {
      int nextPage = pageController.page?.round() ?? 0;
      if (currentPage != nextPage) {
        setState(() {
          double page = pageController.page ?? 0;
          currentPage = (page).round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommendations",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          //list recommendations
          SizedBox(
            height: 200, // Chiều cao cố định cho ListView ngang
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ListView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: widget.recommendations.length,
                itemBuilder: (context, index){
                  return Container(
                    width: 280, // Chiều rộng cố định cho mỗi card
                    margin: EdgeInsets.only(right: 8),
                    child: DataCard(
                      title: widget.recommendations[index]['title']!,
                      description: widget.recommendations[index]['description']!,
                    ),
                  );
                }
              ),
            ),
          ),
          SizedBox(height: 8),

          //list dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.recommendations.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentPage ? Colors.blue : Colors.grey.shade300,
                ),
              );
            }),
          )
        ],
      ),
    );
  }

}

class DataCard extends StatelessWidget {
  final String title;
  final String description;
  const DataCard({
    super.key,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.mood, color: Colors.green, size: 24),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  title, 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ReadMoreText(
            description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: ' Show less',
            moreStyle: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold, 
              color: Colors.blue
            ), 
            lessStyle: TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.bold, 
              color: Colors.blue
            ),
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }
}