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
      backgroundColor: const Color(0xFF003566),
      selectedItemColor: const Color(0xffFFC300));
  }
}