import 'package:flutter/material.dart';
import 'package:recipely/data/services/splash_services.dart';
import 'package:recipely/views/constants/color_constants.dart';

class SplashSceen extends StatelessWidget {
  const SplashSceen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashServices.navigateToLogin(context);
    return Scaffold(
      backgroundColor: primary_color,
      body: Center(child: Image.asset('assets/images/splash.png')),
    );
  }
}
