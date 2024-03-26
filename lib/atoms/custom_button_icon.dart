import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  final Color color;
  final String size;
  final bool disabled;

  const CustomButtonIcon({
    super.key,
    required this.color,
    required this.size,
    required this.disabled,
  });

  IconData get icon =>
      Icons.android; // Ícono del muñequito de Android (botón de "home")

  double getButtonSize() {
    switch (size) {
      case 's':
        return 32.0;
      case 'm':
        return 48.0;
      case 'l':
        return 64.0;
      case 'xl':
        return 80.0;
      default:
        return 48.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : () => print("Button pressed"),
      child: Container(
        width: getButtonSize(),
        height: getButtonSize(),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: getButtonSize() * 0.6,
          ),
        ),
      ),
    );
  }
}
