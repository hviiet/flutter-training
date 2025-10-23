// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RecommendationsItem extends StatelessWidget {
  final String title;
  final String text;

  const RecommendationsItem({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white
        ),
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12,right: 12,left: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.emoji_emotions,color: Color(0xFF30B502),),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: TextStyle(
                        fontFamily: "SF Pro Display",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0,
                        color: Color(0xB8000000)
                      ),
                    ),
                    Text.rich(
                      softWrap: true,
                      TextSpan(
                        text: text,
                        style: TextStyle(
                          fontFamily: "SF Pro Display",
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          letterSpacing: 0,
                          color: Color(0xB8000000)
                        ),
                        children: [
                          WidgetSpan(child: Text("Show More",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                letterSpacing: 0,
                              ),
                            )
                          ),
                        ]
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
