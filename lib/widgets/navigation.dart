import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:virtual_buddy_app_design/pages/calendar_page.dart';
import 'package:virtual_buddy_app_design/pages/chat_page.dart';
import 'package:virtual_buddy_app_design/pages/home_page.dart';
import 'package:virtual_buddy_app_design/pages/settings_page.dart';
import 'package:virtual_buddy_app_design/pages/summary_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
      HomePage(),
      ChatPage(),
      SummaryPage(),
      CalendarPage(),
      SettingsPage(),
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(253, 253, 255, 1),
      body: Center(
      child: _pages.elementAt(selectedIndex),
      ),
    bottomNavigationBar: Container(
      // set margin to make the nav bar float
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      // wrap widget with clipRRect in order to set a borderradius 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        // create container for the blue border around the nav bar
        child: Container(
          color: const Color.fromRGBO(33, 50, 94, 1),
          // use padding to set determine the size of the border
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // use google nav bar package for the nav bar
            child: GNav(
              // use padding to change the size of the navigation bar
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              // set the color of the nav bar
              backgroundColor: const Color.fromRGBO(33, 50, 94, 1),
              // set the color of the text and icons
              color: const Color.fromRGBO(253, 253, 255, 1),
              // set color of the text and icons, while active
              activeColor: const Color.fromRGBO(253, 253, 255, 1),
              // set color for the active page indicator
              tabBackgroundColor: const Color.fromRGBO(31, 31, 31, 1),
              // create the amount of icons you need for the navigation bar
              tabs: const [
                GButton(
                  // set icon
                  icon: Icons.home_outlined,
                  // set text
                  text: 'Home',
                ),
                GButton(
                  // set icon
                  icon: Icons.emoji_emotions_outlined,
                  // set text
                  text: 'Chat',
                ),
                GButton(
                  // set icon
                  icon: Icons.analytics_outlined,
                  // set text
                  text: 'Summary',
                ),
                GButton(
                  // set icon
                  icon: Icons.calendar_month_outlined,
                  // set text
                  text: 'Calendar',
                ),
                GButton(
                  // set icon
                  icon: Icons.settings_outlined,
                  // set text
                  text: 'Settings',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) => setState((){ 
              selectedIndex = index;
              }),
            ),
          ),
        ),
      ),
    )
    );
  }
}
