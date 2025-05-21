import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final String labelText;
  final EdgeInsetsGeometry imagePadding;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.labelText,
    required this.imagePadding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 400,  // Width of the container
        height: 50,  // Height of the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),  // Border around the container
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,  // Center content horizontally
          crossAxisAlignment: CrossAxisAlignment.center,  // Ensure vertical alignment
          children: [
            Padding(
              padding: imagePadding,  // Customizable padding for the image
              child: Image.asset(
                imagePath,  // Use the passed image path for logos
                width: 30,   // Adjust logo width
                height: 30,  // Adjust logo height
              ),
            ),
            const SizedBox(width: 10),  // Space between logo and text
            Text(
              labelText,  // Display the passed text label
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
