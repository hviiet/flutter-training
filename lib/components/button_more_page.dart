import 'package:flutter/material.dart';

// Button for 'More' page.
class ReusableArrowButton extends StatelessWidget {
  const ReusableArrowButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leading,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1),
    this.textColor = const Color.fromRGBO(0, 0, 0, 0.96),
    this.borderRadius = 8,
    this.height = 54,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final String label;
  final VoidCallback onPressed;
  final Widget? leading;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.08),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: SizedBox(
            height: height,
            child: Padding(
              padding: padding,
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: leading ?? const SizedBox.shrink(),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'ABeeZee',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        letterSpacing: 0.15,
                        color: textColor,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/images/right_arrow.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
