import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final Icon icon;
  const LoginTextField({Key? key, required this.labelText, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
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
