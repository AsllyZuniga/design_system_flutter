import 'package:flutter/material.dart';

class RadioButtonOption {
  final String id;
  final String label;
  final bool? disabled;
  final String? value;
  final bool? checked;

  RadioButtonOption({
    required this.id,
    required this.label,
    this.disabled,
    this.value,
    this.checked,
  });
}

class CustomRadioButton extends StatefulWidget {
  final Axis direction;
  final double spacing;
  final List<RadioButtonOption> options;
  final VoidCallback? onPressed;

  const CustomRadioButton({
    super.key,
    this.direction = Axis.vertical,
    this.spacing = 15.0,
    required this.options,
    this.onPressed,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return widget.direction == Axis.vertical
        ? Column(children: _buildRadioButtons())
        : Row(children: _buildRadioButtons());
  }

  List<Widget> _buildRadioButtons() {
    List<Widget> radioButtons = [];

    for (var option in widget.options) {
      radioButtons.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(
            value: option.id,
            groupValue: _selectedOption,
            onChanged: (value) {
             widget.onPressed;
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          Text(option.label),
        ],
      ));
    }
    return radioButtons;
  }
}
