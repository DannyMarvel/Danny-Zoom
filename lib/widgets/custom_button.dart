import 'package:danny_zoom/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({super.key, required this.text,
  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: Size(
            double.infinity - 1,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: buttonColor),
          ),
        ),
      ),
    );
  }
}
