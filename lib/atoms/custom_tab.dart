import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.title,
    required this.tabIndex,
    required this.onTabClose,
    this.displayCloseButton = true,
    this.isActive = false,
  });

  final String title;

  final int tabIndex;

  final Function onTabClose;

  final bool displayCloseButton;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),
            if (displayCloseButton) ...[
              const SizedBox(width: 8.0),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () => onTabClose(),
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
