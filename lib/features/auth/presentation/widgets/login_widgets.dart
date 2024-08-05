import 'package:flutter/material.dart';

class OutlinedTextFormField extends StatelessWidget {
  final String label;
  final String regularExpression;

  const OutlinedTextFormField(
      {super.key, required this.label, required this.regularExpression});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return 'Введите свой E-mail';
        }
        RegExp emailRegEx = RegExp(
            regularExpression);
        if (emailRegEx.hasMatch(value)) return null;
        return 'Проверьте введенный E-mail';
      },
      minLines: null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
