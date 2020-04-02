import 'package:flutter/material.dart';

class VFTextInput extends StatelessWidget {
  /// Placeholder to be used when presenting
  final String placeholder;

  /// Autofocus property
  final bool autofocus;

  /// Input field validator
  final FormFieldValidator<String> validator;

  /// Input field controller
  final TextEditingController controller;

  VFTextInput(this.placeholder, this.autofocus, this.controller, this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(15.0),
          ),
        ),
        hintText: placeholder,
      ),
    );
  }
}
