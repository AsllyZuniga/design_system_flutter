import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_text.dart';

class CustomStatusIcon extends StatelessWidget {
  final bool link;
  final String text;
  final String tooltip;
  final String iconType;
  final bool iconRegular;

  const CustomStatusIcon({
    super.key,
    required this.link,
    required this.text,
    required this.tooltip,
    required this.iconType,
    required this.iconRegular,
  });

  IconData _getIcon() {
    switch (iconType) {
      case 'success':
        return iconRegular ? Icons.check_circle_outline : Icons.check_circle;
      case 'info':
        return iconRegular ? Icons.info_outline : Icons.info;
      case 'warning':
        return iconRegular ? Icons.warning_amber_outlined : Icons.warning;
      case 'error':
        return iconRegular ? Icons.cancel_outlined : Icons.cancel;
      default:
        return Icons.info;
    }
  }

  Color _getIconColor() {
    switch (iconType) {
      case 'success':
        return Colors.green; // Color verde para éxito
      case 'info':
        return Colors.blue; // Color azul para información
      case 'warning':
        return Colors.orange; // Color naranja para advertencia
      case 'error':
        return Colors.red; // Color rojo para error
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          _getIcon(),
          color: _getIconColor(),
        ),
        const SizedBox(width: 8),
        Tooltip(
          message: tooltip,
          child: CustomText(
            text: text,
            color: link ? Colors.lightBlue : Colors.grey, // Color del texto
            fontSize: 16.0, // Tamaño de fuente
            fontWeight:
                link ? FontWeight.bold : FontWeight.normal, // Estilo de fuente
          ),
        ),
      ],
    );
  }
}
