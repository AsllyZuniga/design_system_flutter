import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String type;
  final String label;
  final String? align;
  final String? errorMessage;
  final bool? disabled;
  final bool? required;
  final num? minLength;
  final num? maxLength;

  const CustomInput({
    super.key,
    required this.type,
    required this.label,
    this.align,
    this.errorMessage,
    this.disabled,
    this.required,
    this.minLength,
    this.maxLength,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          keyboardType: _getKeyboardType(),
          obscureText: widget.type.toLowerCase() ==
              'password', // Ocultar texto si el tipo es contraseña
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: _getErrorText(),
            border: InputBorder.none,
          ),
          textAlign: _getTextAlign(),
          enabled: widget.disabled ?? true,
          validator: (value) {
            if ((widget.required ?? false) && (value?.isEmpty ?? true)) {
              return 'Este campo es requerido';
            }
            if (widget.minLength != null &&
                (value!.length < widget.minLength!)) {
              return 'Debe contener al menos ${widget.minLength} caracteres';
            }
            if (widget.maxLength != null &&
                (value!.length > widget.maxLength!)) {
              return 'Debe contener como máximo ${widget.maxLength} caracteres';
            }
            return null;
          },
        ),
      ),
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type.toLowerCase()) {
      case 'decimal':
        return const TextInputType.numberWithOptions(decimal: true);
      case 'text':
        return TextInputType.text;
      case 'number':
        return TextInputType.number;
      case 'password':
        return TextInputType.visiblePassword;
      case 'integer':
        return const TextInputType.numberWithOptions(
            signed: true, decimal: false);
      case 'email':
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  TextAlign _getTextAlign() {
    switch (widget.align?.toLowerCase()) {
      case 'left':
        return TextAlign.left;
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      default:
        return TextAlign.start;
    }
  }

  String? _getErrorText() {
    if ((widget.errorMessage != null && widget.errorMessage!.isNotEmpty) &&
        (widget.required ??
            false || widget.minLength != null || widget.maxLength != null)) {
      return widget.errorMessage;
    }
    return null;
  }
}
