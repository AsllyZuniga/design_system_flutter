import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({
    super.key,
    required this.content,
    this.direction = Axis.vertical,
    this.scrollPadding,
    this.scrollController,
  });

  final Widget content; // Cambiado de `child` a `content`
  final Axis direction; // Cambiado de `scrollDirection` a `direction`
  final ScrollController?
      scrollController; // Cambiado de `controller` a `scrollController`
  final EdgeInsetsGeometry?
      scrollPadding; // Cambiado de `padding` a `scrollPadding`

  @override
  Widget build(BuildContext context) {
    final activeController = scrollController ?? ScrollController();

    return RawScrollbar(
      controller: activeController,
      thumbColor: Theme.of(context)
          .primaryColor, // Usando `Theme.of(context)` directamente
      thumbVisibility: true,
      trackColor: Theme.of(context).colorScheme.outline,
      trackVisibility: true,
      thickness: 9.8,
      radius: const Radius.circular(4),
      child: SingleChildScrollView(
        controller: activeController,
        scrollDirection: direction,
        padding: scrollPadding,
        child: content,
      ),
    );
  }
}
