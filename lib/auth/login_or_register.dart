import 'package:flutter/material.dart';
import 'package:virtual_buddy_app_design/pages/Register_page.dart';
import 'package:virtual_buddy_app_design/pages/login_page.dart';


class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  // Initialy, show login page
  bool showLoginPage = true;

  // toogle between login and register
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }

    
  }
}