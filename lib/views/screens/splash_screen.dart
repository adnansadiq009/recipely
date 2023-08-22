import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/screens/login_screen.dart';

class SplashSceen extends StatelessWidget {
  const SplashSceen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
    return Scaffold(
      backgroundColor: primary_color,
      body: Center(child: Image.asset('assets/images/splash.png')),
    );
  }
}
