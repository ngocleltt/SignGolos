import 'package:flutter/material.dart';
import 'package:signgolos/lesson.dart';
import 'package:signgolos/text_translate.dart';
import 'Design_screen/custom_bottom_nav_bar.dart';
import 'Design_screen/app_header.dart';
import 'welcome_screen.dart';
import 'profile.dart';
import 'home_screen.dart';
import 'Scan_screen/scan_choose.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Điều hướng đến trang tương ứng với chỉ mục được chọn
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScanChooseScreen()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TextTranslateScreen()),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LessonScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Login',
      ),
      body: Center(
        child: Text('Login Screen'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
