import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            // Container for the chatbot subtitles
            Container(
              //sets size of the box
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(229,229,229, 1),
                borderRadius: BorderRadius.circular(80),
              ),
              // text is inputted and controlled here
              child: const Text(
                'Hello, why are you feeling stressed?',
                style: TextStyle(
                  color: Color.fromRGBO(31, 31, 31, 1),
                  fontSize: 16,
                ),
                // aligns tezt to the center
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 80),
            // SVG image
            SvgPicture.asset(
              'assets/VB-GameBoy.svg',
              width: 260,
            ),
            const SizedBox(height: 40), 
            // Button with mic icon
            ElevatedButton(
              onPressed: () {
                // place function to use the microphone here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(241, 208, 10, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.all(20),
              ),
              child: const Icon(Icons.mic, size: 35, color: Color.fromRGBO(253, 253, 255, 1),),
            ),
          ],
        ),
      ),
    );
  }
}
