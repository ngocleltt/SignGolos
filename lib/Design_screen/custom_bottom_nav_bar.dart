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
          icon: Icon(Icons.login),
          label: 'Login',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Scan',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue, // Màu cho mục được chọn
      unselectedItemColor: Colors.grey, // Màu cho các mục không được chọn
      backgroundColor: Color.fromRGBO(0, 176, 232, 1), // Màu nền của BottomNavigationBar
      onTap: onItemTapped,
    );
  }
}
