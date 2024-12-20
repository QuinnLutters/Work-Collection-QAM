import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final Color cursorColor;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obsecureText,
    required this.controller,
    this.cursorColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: controller,
        cursorColor: const Color.fromRGBO(31, 31, 31, 1),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(229, 229, 229, 1),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(253, 253, 255, 1),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(229, 229, 229, 1),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(229, 229, 229, 1),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        obscureText: obsecureText,
      ),
    );
  }
}
