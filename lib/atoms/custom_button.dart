import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String size;
  final bool disabled;
  final bool loading;
  final String? text;
  final IconData? icon;

  const CustomButton({
    super.key,
    this.color = Colors.blue,
    this.size = 'm',
    this.disabled = false,
    this.loading = false,
    this.text,
    this.icon,
  });

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

  Widget showLoading() {
    return const SizedBox(
      width: 24.0,
      height: 24.0,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget showButtonText() {
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            color: Colors.white,
            size: 24.0,
          ),
        if (text != null) const SizedBox(width: 8.0),
        if (text != null)
          Text(
            text ?? '',
            style: const TextStyle(color: Colors.white),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : () => print("Button pressed"),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: disabled ? Colors.grey : color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [loading ? showLoading() : showButtonText()],
        ),
      ),
    );
  }
}F