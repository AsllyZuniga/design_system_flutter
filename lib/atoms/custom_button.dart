import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String size;
  final bool disabled;
  final bool loading;
  final String text;

  const CustomButton({
    super.key,
    required this.color,
    required this.size,
    required this.disabled,
    required this.loading,
    required this.text,
  });

  IconData get icon => Icons.wordpress;

  double getButtonSize() {
    switch (size) {
      case 's':
        return 120.0;
      case 'm':
        return 160.0;
      case 'l':
        return 200.0;
      case 'xl':
        return 240.0;
      default:
        return 160.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : () {},
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            loading
                ? const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
            const SizedBox(width: 8.0),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
