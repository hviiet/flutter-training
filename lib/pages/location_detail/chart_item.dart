// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final int number;
  final int maxNumber;
  final String label;

  const ChartItem({
    super.key,
    required this.number,
    required this.label,
    required this.maxNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: maxNumber*10 + 20,
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 32,
                  height: number * 10,
                  decoration: BoxDecoration(
                    color: Color((number>3*maxNumber/4)?0x3DFF6C3E:
                                (number>2*maxNumber/4)?0x3DFEB156:
                                (number>1*maxNumber/4)?0x3DFFDE30:0x3D02DB5C),
                  ),
                ),
                Positioned(
                  top: -16, 
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color((number>3*maxNumber/4)?0xFFFF6C3E:
                                (number>2*maxNumber/4)?0xFFFEB156:
                                (number>1*maxNumber/4)?0xFFFFDE30:0xFF02DB5C),
                    ),
                    child: Center(child: Text(number.toString(),style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ),
            Text(label,
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: Color(0x66000000)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
