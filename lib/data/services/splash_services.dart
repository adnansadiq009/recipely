import 'package:flutter/material.dart';
import 'package:recipely/views/screens/auth_screen/login_screen.dart';

class SplashServices {
  static void navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }
}
