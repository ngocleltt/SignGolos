import 'package:flutter/material.dart';
import 'package:signgolos/Design_screen/app_header.dart';
import 'package:signgolos/app_colors.dart';

class TextTranslateScreen extends StatefulWidget {
  @override
  _TextTranslateScreenState createState() => _TextTranslateScreenState();
}

class _TextTranslateScreenState extends State<TextTranslateScreen> {
  final TextEditingController _textController = TextEditingController();
  String _translatedText = '';

  void _translateText() {
    setState(() {
      // Chuyển tất cả chữ cái thành chữ thường
      _translatedText = _textController.text.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: 'Text to Sign Language',
        backgroundColor: appblue,
        titleColor: Colors.white,
        toolbarHeight: 80.0,
        fontFamily: 'Poppins-Light',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text to translate',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _translateText,
              child: Text('Translate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: appblue,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                textStyle: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                child: _translatedText.isNotEmpty
                    ? _buildImageDisplay()
                    : Center(
                  child: Text(
                    'Translation will appear here',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageDisplay() {
    List<Widget> imageWidgets = _translatedText.split('').map((char) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/sign_language/$char.png',
          height: 100.0,
        ),
      );
    }).toList();

    List<Widget> rows = [];
    for (var i = 0; i < imageWidgets.length; i += 3) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageWidgets.sublist(
            i, i + 3 > imageWidgets.length ? imageWidgets.length : i + 3),
      ));
    }

    return Column(
      children: rows,
    );
  }
}
