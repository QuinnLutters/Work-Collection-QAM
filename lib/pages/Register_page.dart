import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_buddy_app_design/components/my_button.dart';
import 'package:virtual_buddy_app_design/components/my_textfield.dart';
import 'package:virtual_buddy_app_design/helper/helper_function.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  String? selectedUserType;

  void registerUser(BuildContext context) async {
    // Show loading indicator
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Ensure passwords match
    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context); // Close loading indicator
      displayMessageToUser("Passwords don't match!", context);
      return;
    }

    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Optional: You can do something with userCredential if needed
      print('User registered: ${userCredential.user!.email}');

      // Close loading indicator
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Close loading indicator
      Navigator.pop(context);
      displayMessageToUser(e.message ?? 'Unknown error occurred', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 255, 1),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Transform.translate(
              offset: const Offset(90, -30),
              child: Transform.rotate(
                angle: -32 * 3.14159 / 180,
                child: SvgPicture.asset(
                  'assets/VB-GameBoy.svg',
                  width: 240,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 160),
                  // app Description
                  const SizedBox(
                    width: 260,
                    child: Text.rich(
                      TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: 'Virtual ',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: 'Buddy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(241, 208, 10, 1),
                            ),
                          ),
                          TextSpan(
                            text: ', where we make your stress go away',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 12),
                          ),
                      ),
                      MyTextField(
                        hintText: "example@email.com",
                        obsecureText: false,
                        controller: emailController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Password text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          "Password", 
                          style: TextStyle(fontSize: 12),
                          ),
                      ),
                      MyTextField(
                        hintText: "*************",
                        obsecureText: true,
                        controller: passwordController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Confirm Password text field
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(fontSize: 12),
                          ),
                      ),
                      MyTextField(
                        hintText: "*************",
                        obsecureText: true,
                        controller: confirmPasswordController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                   // Already have an account? Login Here text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          " Sign in Here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(33, 50, 94, 1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Register button
                  MyButton(
                    text: "Register",
                    onTap: () => registerUser(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
