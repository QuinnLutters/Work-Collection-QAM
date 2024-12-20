import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_buddy_app_design/components/my_button.dart';
import 'package:virtual_buddy_app_design/components/my_textfield.dart';
import 'package:virtual_buddy_app_design/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login
  void login() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) Navigator.pop(context);
    }

    // display error
    on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200),
                  // app description
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
                  const SizedBox(height: 50),

                  // email
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

                  // password
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
                  const SizedBox(height: 15),

                 // sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          " Register Here",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(33, 50, 94, 1),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    text: "Sign in",
                    onTap: login,
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
