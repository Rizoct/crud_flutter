import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback navigate;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.navigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 280,
      child: ElevatedButton(
          onPressed: navigate,
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
                width: 1, color: Color(0xFF1F3C88)), //border width and color
            shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(5)),
          ),
          child: Text(
            text,
          )),
    );
  }
}
