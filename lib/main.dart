import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:virtual_buddy_app_design/auth/auth.dart';
import 'package:virtual_buddy_app_design/auth/login_or_register.dart';
import 'package:virtual_buddy_app_design/firebase_options.dart';
import 'package:virtual_buddy_app_design/widgets/navigation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        'login_register_page':(context) => const LoginOrRegister(),
        'home_page':(context) =>  const NavBar(),
      },
    );
  }
}   