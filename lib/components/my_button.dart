import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70, 
        decoration: BoxDecoration(
          color: const Color.fromRGBO(241, 208, 10, 1),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Color.fromRGBO(253, 253, 255, 1),
            ),
          ),
        ),
      ),
    );
  }
}
