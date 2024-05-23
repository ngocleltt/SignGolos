import 'package:flutter/material.dart';
import 'package:signgolos/Design_screen/app_header.dart';
import 'package:signgolos/Design_screen/custom_bottom_nav_bar.dart';
import 'package:signgolos/Scan_screen/scan_choose.dart';
import 'package:signgolos/app_colors.dart';
import 'package:signgolos/home_screen.dart';
import 'package:signgolos/login_screen.dart';
import 'package:signgolos/profile.dart';
import 'package:signgolos/text_translate.dart';

class LessonScreen extends StatefulWidget {
  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  List<String> lessons = List.generate(20, (index) => 'Lesson ${index + 1}');
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ScanChooseScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TextTranslateScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LessonScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Lessons',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Tăng số cột để làm nút nhỏ hơn
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0, // Tỷ lệ khung hình để nút vuông
          ),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonDetailScreen(lesson: lessons[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: lightogrance,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.book, size: 40, color: Colors.white),
                      SizedBox(height: 5),
                      Text(
                        lessons[index],
                        style: TextStyle(
                          fontFamily: 'Poppins-Light',
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  final String lesson;

  LessonDetailScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: lesson,
      ),
      body: Center(
        child: Text(
          'Content for $lesson',
          style: TextStyle(
            fontFamily: 'Poppins-Light',
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
