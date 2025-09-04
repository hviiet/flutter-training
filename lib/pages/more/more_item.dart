import 'package:flutter/material.dart';

class MoreItem extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final VoidCallback onPressed;

  const MoreItem({super.key, required this.text, required this.prefixIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(prefixIcon,color: Color(0xFF245DD8),),
        trailing: Icon(Icons.chevron_right,color: Color(0xFF1882FF),),
        title: Text(text,
          style: TextStyle(
            fontFamily: "ABeeZee",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            letterSpacing: 0.15
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}