import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtual_buddy_app_design/components/my_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  // Logout user
  void logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Navigate back to login screen or any other route
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 255, 1),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            // Logout button in top left
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => logout(context),
                  child: const Icon(Icons.logout, size: 35,),
                ),
              ),
            ),

            // Profile picture and edit text
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              child: const Column(
                children: [
                  // Circle for profile picture
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
                    backgroundImage: NetworkImage(
                        'https://example.com/profile-image.jpg'), // Replace with actual image URL
                  ),
                  SizedBox(height: 10),
                  // Text for editing profile image
                  Text(
                    'Edit Profile Image',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Username
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  child: Text(
                    "Username",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 300,
                      color: const Color.fromRGBO(229, 229, 229, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: const Text('John Doe'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  child: Text(
                    "email",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 300,
                      color: const Color.fromRGBO(229, 229, 229, 1),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: const Text('example@email.com'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

             const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Delete Account button
            MyButton(
              text: 'Delete Account',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
