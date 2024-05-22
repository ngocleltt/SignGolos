import 'package:flutter/material.dart';
import 'package:signgolos/login_screen.dart';
import 'package:signgolos/profile.dart';
import 'package:signgolos/Scan_screen/scan_choose.dart';
import 'package:signgolos/Scan_screen/camera.dart';
import 'package:signgolos/Scan_screen/library_image.dart';
import 'Design_screen/app_header.dart';
import 'package:signgolos/text_translate.dart';
import 'package:signgolos/app_colors.dart';

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
        titleColor: Colors.white,
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
              color: lightogrance,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Light',
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
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
      height: 250.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            "Tapping into sign language is not just about what's seen, but what's felt from the heart.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins-Light',
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
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
          title: 'Text Translate',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextTranslateScreen()),
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
                color: appblue,
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
