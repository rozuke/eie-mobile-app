import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.library_books ), label: 'Books'),
        BottomNavigationBarItem(icon: Icon(Icons.library_books, color: Colors.white),label: 'Courses'),
        BottomNavigationBarItem(icon: Icon(Icons.library_books, color: Colors.white), label: 'Profile'),
      ],
      // backgroundColor: Colors.white
      currentIndex: 0,
      backgroundColor: ThemeApp.primaryBlueColor,
      selectedItemColor: ThemeApp.primaryYellowColor);
  }
}