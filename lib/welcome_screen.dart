import 'package:flutter/material.dart';
import 'package:signgolos/app_colors.dart';
import 'package:signgolos/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 165.0, // Đặt vị trí top của logo
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset('assets/logo/logo.png', width: 260, height: 260),
                  ),
                ),
                PageView(
                  controller: _pageController,
                  children: <Widget>[
                    _buildPageContent(
                      text: 'Empowering voices, transforming communication',
                      color: Colors.transparent,
                    ),
                    _buildPageContent(
                      text: 'SIGN В ГОЛОС',
                      color: Colors.transparent,
                      showButton: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: WormEffect(
                dotHeight: 12.0,
                dotWidth: 12.0,
                activeDotColor: appblue,
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildPageContent({
    required Color color,
    required String text,
    bool isCoverImage = false,
    bool showButton = false,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 250),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins-Light',
              fontSize: 16,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          if (showButton) ...[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appblue,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins-Light',
                ),
              ),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Poppins-Light',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
