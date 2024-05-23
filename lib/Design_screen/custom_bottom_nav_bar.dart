import 'package:flutter/material.dart';
import 'package:signgolos/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../login_screen.dart';
import '../profile.dart';
import '../Scan_screen/scan_choose.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Scan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_fields),
          label: 'Translate',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Lesson',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: appblue,
      unselectedItemColor: Colors.grey,
      backgroundColor: appblue,
      onTap: onItemTapped,
    );
  }
}
