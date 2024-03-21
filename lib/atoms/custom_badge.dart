import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_text.dart';

class CustomBadge extends StatelessWidget {
  final String text;
  final Color color;
  final String size;

  const CustomBadge({
    super.key,
    this.text = "",
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (size == "xs") {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        height: 15,
        width: 15,
      );
    }

    return Container(
      height: size == "s" ? 24 : 30,
      padding: EdgeInsets.all(size == "s" ? 3 : 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText(
        fontSize: size == "s" ? 12 : 16,
        text: text,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
