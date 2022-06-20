import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const PrimaryTextfield({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }
}
