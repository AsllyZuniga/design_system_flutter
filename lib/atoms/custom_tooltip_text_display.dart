import 'package:flutter/material.dart';

class TooltipTextDisplay extends StatelessWidget {
  final bool showTooltip;
  final String tooltipMessage;
  final int maxLines;
  final TextStyle? textStyle;

  const TooltipTextDisplay({
    super.key,
    required this.showTooltip,
    required this.tooltipMessage,
    this.maxLines = 1,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      tooltipMessage,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );

    return showTooltip
        ? Tooltip(
            message: tooltipMessage,
            child: textWidget,
          )
        : textWidget;
  }
}
