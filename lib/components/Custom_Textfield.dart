import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String labelText;  // The only customizable property

  const CustomTextfield({
    Key? key,
    required this.labelText,  // Receive labelText as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,  // Fixed width for the text field
      child: TextField(
        style: const TextStyle(color: Colors.grey),  // Set the text color to grey
        decoration: InputDecoration(
          labelText: labelText,  // Set labelText passed from the parent widget
          labelStyle: const TextStyle(color: Colors.grey),  // Set label text color to grey
          filled: true,
          fillColor: const Color.fromARGB(255, 255, 255, 255),  // Set the background color of the TextField to white
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),  // Rounded corners for the text field
            borderSide: const BorderSide(color: Color.fromARGB(255, 206, 206, 206)),  // Set the default border color to grey
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 206, 206, 206)),  // Set the focused border color to grey
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 206, 206, 206)),  // Set the enabled border color to grey
          ),
        ),
      ),
    );
  }
}
