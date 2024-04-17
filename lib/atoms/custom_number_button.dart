import 'package:flutter/material.dart';
import 'package:flutter_application_test/atoms/custom_button_icon.dart';

class CustomNumber extends StatefulWidget {
  final bool disabled;
  final bool showLabel;
  final String label;
  final num minValue;
  final num maxValue;

  const CustomNumber({
    super.key,
    required this.disabled,
    required this.showLabel,
    required this.label,
    required this.minValue,
    required this.maxValue,
  });

  @override
  State<CustomNumber> createState() => _CustomNumberState();
}

class _CustomNumberState extends State<CustomNumber> {
  late num _currentNumber;

  @override
  void initState() {
    super.initState();
    _currentNumber = widget.minValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showLabel ? Text(widget.label) : const SizedBox.shrink(),
        Row(
          children: [
            CustomButtonIcon(
              icon: Icons.remove,
              color: Colors.blue.shade300,
              size: 's',
              disabled: false,
              onPressed: widget.disabled ? null : _decrementNumber,
            ),
            Text('$_currentNumber'),
            CustomButtonIcon(
              icon: Icons.add,
              color: Colors.blue.shade300,
              size: 's',
              disabled: false,
              onPressed: widget.disabled ? null : _incrementNumber,
            ),
          ],
        ),
      ],
    );
  }

  void _incrementNumber() {
    if (_currentNumber < widget.maxValue) {
      setState(() {
        _currentNumber++;
      });
    }
  }

  void _decrementNumber() {
    if (_currentNumber > widget.minValue) {
      setState(() {
        _currentNumber--;
      });
    }
  }
}
