import 'package:flutter/material.dart';

class ActionListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final double height;
  final double iconSize;

  const ActionListTile({
    super.key,  
    required this.icon, 
    required this.title,
    this.onTap,
    this.height = 56.0,
    this.iconSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: 12.0),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 10.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14.0),
          onTap: onTap,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Container(
                  width: iconSize + 14,
                  height: iconSize + 14,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 6, 68, 255),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: iconSize,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),

                const SizedBox(width: 18.0),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(17, 24, 39, 1.0),
                    ),
                  ),
                ),

                const Icon(
                  Icons.chevron_right,
                  color: Color.fromARGB(255, 0, 128, 255),
                  size: 30.0,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}