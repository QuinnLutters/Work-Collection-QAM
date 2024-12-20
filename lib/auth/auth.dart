import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtual_buddy_app_design/auth/login_or_register.dart';
import 'package:virtual_buddy_app_design/widgets/navigation.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const NavBar();
          }

          // user is not logged in

          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}