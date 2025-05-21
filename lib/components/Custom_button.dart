import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Text to be displayed on the button
  final VoidCallback onPressed; // Callback for the button press

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,  // Fixed width for the button
      child: ElevatedButton(
        onPressed: onPressed,  // The onPressed function passed from the parent
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff02D185), // Fixed background color
          minimumSize: const Size(double.infinity, 56), // Fixed height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Fixed border radius
          ),
        ),
        child: Text(
          text,  // Display dynamic text
          style: const TextStyle(fontSize: 18, color: Colors.white), // Fixed text color
        ),
      ),
    );
  }
}
