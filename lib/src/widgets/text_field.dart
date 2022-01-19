import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration( 
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
