import 'package:flutter/material.dart';
import 'package:signgolos/profile.dart';
import 'package:signgolos/Scan_screen/scan_choose.dart';
import 'package:signgolos/Scan_screen/camera.dart';
import 'package:signgolos/Scan_screen/library_image.dart';
import 'Design_screen/app_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Home',
        backgroundColor: Color.fromRGBO(0, 176, 232, 1),
        titleColor: Colors.white,
        toolbarHeight: 80.0,
        fontFamily: 'Poppins-Light',
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildBanner(),
            _buildSectionTitle('Main Features'),
            _buildFeatureGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 176, 232, 1),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Điều hướng đến trang cài đặt
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 200.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 176, 232, 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          'Đây là câu quotes',
          style: TextStyle(
            fontFamily: 'Poppins-Light',
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontFamily: 'Poppins-Light',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        _buildFeatureCard(
          icon: Icons.camera,
          title: 'Scan',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScanChooseScreen()),
            );
          },
        ),
        _buildFeatureCard(
          icon: Icons.person,
          title: 'Profile',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
        _buildFeatureCard(
          icon: Icons.camera_alt,
          title: 'Camera',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
          },
        ),
        _buildFeatureCard(
          icon: Icons.image,
          title: 'Library',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LibraryImageScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCard({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 50.0,
                color: Color.fromRGBO(0, 176, 232, 1),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins-Light',
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
