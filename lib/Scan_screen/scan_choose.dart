import 'package:flutter/material.dart';
import 'package:signgolos/Design_screen/app_header.dart';
import '../Design_screen/custom_bottom_nav_bar.dart';
import '../login_screen.dart';
import '../home_screen.dart';
import '../profile.dart';
import 'camera.dart';
import 'library_image.dart';

class ScanChooseScreen extends StatefulWidget {
  @override
  _ScanChooseScreenState createState() => _ScanChooseScreenState();
}

class _ScanChooseScreenState extends State<ScanChooseScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Choose Scan Method',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFeatureCard(
                icon: Icons.camera_alt,
                title: 'Camera',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CameraScreen()),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildFeatureCard(
                icon: Icons.photo_library,
                title: 'Library',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LibraryImageScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildFeatureCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Bo tròn các góc
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 150.0, // Đặt chiều rộng cố định cho hình vuông
          height: 150.0, // Đặt chiều cao cố định cho hình vuông
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 80.0,
                  color: Color.fromRGBO(0, 176, 232, 1),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
