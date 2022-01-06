
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class PinFieldWidget extends StatelessWidget {
  const PinFieldWidget(
    this.controller,
    this.onChanged, {
    Key? key,
    this.onDone,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChanged;
  final void Function(String)? onDone;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      maxLength: 4,
      onTextChanged: onChanged,
      onDone: onDone,
      pinBoxRadius: 16,
      controller: controller,
      pinTextStyle: Theme.of(context).textTheme.headline5,
    );
  }
}