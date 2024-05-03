import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String label;
  final String direction;
  final List<String> options;

  const CustomCheckbox({
    super.key,
    required this.label,
    this.direction = '',
    required this.options,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late List<bool> _checkedList;

  @override
  void initState() {
    super.initState();
    _checkedList = List<bool>.filled(widget.options.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Wrap(
          direction: widget.direction == 'row' ? Axis.horizontal : Axis.vertical,
          spacing: 10, // Espacio entre los elementos
          children: List.generate(
            widget.options.length,
            (index) => _buildOptionCheckbox(index),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionCheckbox(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _checkedList[index],
          onChanged: (newValue) {
            setState(() {
              _checkedList[index] = newValue ?? false;
            });
          },
        ),
        Text(widget.options[index]),
      ],
    );
  }
}