// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AqiScaleItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final String text;
  
  const AqiScaleItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon,size: 24,
              color: (title=="Low")?Color(0xFF30B502)
              :(title=="Moderate")?Color(0xFFEC8B1A)
              :(title=="High")?Color(0xFFFF0000)
              :Color(0xFFCE0395)
            ),
          ),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 0.5,
                    color: Color(0xFF111827)
                  ),
                ),
                Text(subTitle,
                  style: TextStyle(
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    letterSpacing: 0.5,
                    color: Color(0xB81C1C1E)
                  ),
                ),
                Text(text,softWrap: true,
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    letterSpacing: 0,
                    color: Color(0xB8000000)
                  ),
                ),
                Text("Show More",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    letterSpacing: 0,
                    color: Color(0xFF1882FF)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
