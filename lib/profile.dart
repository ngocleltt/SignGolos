import 'package:flutter/material.dart';
import 'package:signgolos/app_colors.dart';
import 'package:signgolos/home_screen.dart';
import 'package:signgolos/lesson.dart';
import 'package:signgolos/text_translate.dart';
import 'Design_screen/custom_bottom_nav_bar.dart';
import 'Design_screen/app_header.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'Scan_screen/scan_choose.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        title: 'Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Logic cho nút chỉnh sửa thông tin
                    },
                    child: Text(
                      'Update Information',
                      style: TextStyle(fontFamily: 'Poppins-Light'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildProfileItem(Icons.person, "Name", "Le Nhu Ngoc"),
            _buildProfileItem(Icons.female, "Gender", "Female"),
            _buildProfileItem(Icons.hearing, "Hearing Impaired", "No"),
            _buildProfileItem(Icons.email, "Email", "ngocleltt@gmail.com"),
            _buildProfileItem(Icons.language, "Language", "English"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: appblue),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            fontFamily: 'Poppins-Light',
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Poppins-Light',
          ),
        ),
      ),
    );
  }
}
