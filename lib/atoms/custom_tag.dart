import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_text.dart';

class CustomTag extends StatelessWidget {
  final String text;
  final String typeTag;
  final String sizeTag;
  final bool isExpandToParent;

  const CustomTag({
    super.key,
    this.text = "",
    required this.typeTag,
    required this.sizeTag,
    required this.isExpandToParent,
  });

  @override
  Widget build(BuildContext context) {
    return isExpandToParent
        ? Tooltip(
            message: '\n' + _buildTooltipMessage(),
            child: Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _getColor(typeTag),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _getText(text)),
          )
        : Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.symmetric(
                vertical: 5), // Añadir margen vertical
            width: isExpandToParent ? double.infinity : null,
            decoration: BoxDecoration(
              color: _getColor(typeTag),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _getText(text));
  }

  Widget _getText(tagText) {
    return CustomText(
      fontSize: 18,
      text: tagText,
      color: Colors.white,
    );
  }

  Color _getColor(colorType) {
    switch (colorType) {
      case 'success':
        return Colors.green;
      case 'warning':
        return Colors.orange;
      case 'error':
        return Colors.red;
      case 'info':
        return Colors.lightBlue;
      case 'completed':
        return Color.fromARGB(255, 210, 206, 205);
      default:
        return Colors.green;
    }
  }
}

String _buildTooltipMessage() {
  final Map<String, IconData> icons = {
    'Success': Icons.check_circle,
    'Warning': Icons.warning,
    'Error': Icons.error,
    'Info': Icons.info,
  };

  String tooltipMessage = '';

  icons.forEach((label, icon) {
    tooltipMessage +=
        '$label: ${icon == Icons.check_circle ? '\u2713' : icon == Icons.warning ? '⚠️' : icon == Icons.error ? '❌' : icon == Icons.info ? 'ℹ️' : icon == Icons.done ? '✔️' : '+'}\n';
  });

  return tooltipMessage;
}
