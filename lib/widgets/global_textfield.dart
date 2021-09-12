import 'package:flutter/material.dart';

enum InputBorderType { outline, underline }

class GlobalTextField extends StatelessWidget {
  final bool obscure;
  final String hint;
  final TextEditingController controller;
  final Widget suffixIcon;
  final String suffix;
  final IconData prefixIcon;
  final Color fillColor;
  final Color prefixIconColor;
  final double borderRadius;
  final int maxLines;
  final Function validator;
  final Function onSaved;
  final InputBorderType inputBorderType;
  final String label;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color borderColor;
  final TextStyle hintStyle;
  final FocusNode focusNode;

  const GlobalTextField.outlineBorder({
    Key key,
    this.obscure,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.prefixIconColor,
    this.controller,
    this.validator,
    this.onSaved,
    this.suffix,
    this.focusNode,
    this.maxLines,
    this.borderRadius = 60,
    this.inputBorderType = InputBorderType.outline,
    this.label,
    this.textInputAction,
    this.textInputType,
    this.borderColor,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        controller: controller ?? null,
        obscureText: obscure ?? false,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: textInputType ?? TextInputType.text,
        focusNode: focusNode ?? null,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          hintText: hint,
          hintStyle: hintStyle ?? const TextStyle(color: Colors.grey),
          labelText: label,
          filled: true,
          fillColor: fillColor,
          suffixText: (suffix == null) ? null : suffix,
          suffixStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          prefixIcon: (prefixIcon == null)
              ? null
              : Icon(prefixIcon, color: prefixIconColor),
          suffixIcon: suffixIcon ?? const SizedBox(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1.3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor, width: 1.3),
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
