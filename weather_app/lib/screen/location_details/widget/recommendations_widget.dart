import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class RecommendationsWidget extends StatelessWidget {
  RecommendationsWidget({super.key});
  final List<Map<String, String>> recommendations = [
    {'title': 'Wear a mask', 'description': 'Due to high pollution levels, it is recommended to wear a mask when going outside.'},
    {'title': 'Limit outdoor activities', 'description': 'Try to limit outdoor activities, especially for children and the elderly.'},
    {'title': 'Use air purifiers', 'description': 'Consider using air purifiers indoors to improve air quality fgkljfgklfgjkldfglkfdglgf.'},
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
            "Recommendations",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          //list recommendations
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.only(bottom: 4, right: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendations.length,
              itemBuilder: (context, index){
                return SizedBox(
                  width: 260,
                  child: DataCard(
                    title: recommendations[index]['title']!,
                    description: recommendations[index]['description']!,
                  ),
                );
              }
            ),
          ),
          SizedBox(height: 8,),

          //list dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(recommendations.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.blue : Colors.grey.shade300,
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
      margin: EdgeInsets.only(right: 6),
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
          Icon(Icons.mood, color: Colors.green, size: 24,),
          SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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