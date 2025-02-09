import 'package:flutter/material.dart';

enum NotificationType { error, warning, info, success, none }

class NotificationSticky extends StatelessWidget {
  const NotificationSticky({
    super.key,
    required this.message,
    required this.type,
  });

  final Widget message;
  final NotificationType type;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color lightBackgroundColor;
    IconData icon;
    final theme = Theme.of(context);

    switch (type) {
      case NotificationType.error:
        backgroundColor = theme.colorScheme.error;
        lightBackgroundColor = theme.colorScheme.errorContainer;
        icon = Icons.cancel;
        break;
      case NotificationType.warning:
        backgroundColor = Colors.orange;
        lightBackgroundColor = Colors.orange.shade100;
        icon = Icons.warning;
        break;
      case NotificationType.info:
        backgroundColor = theme.primaryColor;
        lightBackgroundColor = theme.colorScheme.onPrimaryContainer;
        icon = Icons.info;
        break;
      case NotificationType.success:
        backgroundColor = Colors.green;
        lightBackgroundColor = Colors.green.shade100;
        icon = Icons.check;
        break;
      case NotificationType.none:
        backgroundColor = Colors.grey;
        lightBackgroundColor = Colors.grey.shade300;
        icon = Icons.check;
        break;
    }

    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: lightBackgroundColor,
          border: Border.all(color: backgroundColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(icon, color: backgroundColor),
            const SizedBox(width: 10),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
