import 'package:flutter/material.dart';
import 'package:flutter_application_1/atoms/colors.dart';

class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({
    super.key,
    required this.content,
    this.direction = Axis.vertical,
    this.scrollPadding,
    this.scrollController,
  });

  final Widget content;
  final Axis direction;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? scrollPadding;

  @override
  Widget build(BuildContext context) {
    final activeController = scrollController ?? ScrollController();
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return RawScrollbar(
      controller: activeController,
      thumbColor: isDarkMode
          ? CustomColors.primaryFixedDim
          : CustomColors.primaryColor.withOpacity(0.7),
      trackColor: isDarkMode
          ? CustomColors.surfaceContainerHigh
          : CustomColors.surfaceContainerLow,
      trackBorderColor: Colors.transparent, 
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 8.0,
      radius: const Radius.circular(10),
      child: SingleChildScrollView(
        controller: activeController,
        scrollDirection: direction,
        padding: scrollPadding,
        child: content,
      ),
    );
  }
}
