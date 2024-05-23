import 'package:flutter/material.dart';
import 'package:signgolos/app_colors.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final double toolbarHeight;
  final String fontFamily;

  AppHeader({
    required this.title,
    this.backgroundColor = lightogrance,
    this.titleColor = Colors.white,
    this.toolbarHeight = 80,
    this.fontFamily = 'Poppins-SemiBold',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
        color: titleColor,
        fontFamily: fontFamily,
        fontSize: 18.0, // Kích thước font chữ
        ),
    ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}