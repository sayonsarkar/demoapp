import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final bool? validate;
  final String labelText;
  final Icon icon;
  final TextEditingController controller;
  const LoginTextField(
      {Key? key,
      required this.labelText,
      required this.icon,
      required this.validate,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        errorText: validate ?? true ? null : 'invalid',
        prefixIcon: icon,
        label: Text(labelText),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
