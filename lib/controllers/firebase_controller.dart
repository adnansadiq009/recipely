import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipely/data/utils/utils.dart';
import 'package:recipely/provider/auth_provider.dart';
import 'package:recipely/views/screens/search_screen/search_screen.dart';

class FirebaseController {
  static void signUp(context, emailController, passwordController) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.setLoading(true);

    auth
        .createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      emailController.clear();
      passwordController.clear();
      Utils().snackMessage('Account is created');
      Future.delayed(const Duration(seconds: 1))
          .then((value) => Navigator.pop(context));

      authProvider.setLoading(false);
    }).onError((error, stackTrace) {
      String errorMessage = error.toString();
      String extractedMessage = '';
      if (errorMessage.contains(']')) {
        int startIndex = errorMessage.indexOf(']') + 1;
        extractedMessage = errorMessage.substring(startIndex).trim();
      } else {
        extractedMessage = errorMessage;
      }
      Utils().snackMessage(extractedMessage);

      authProvider.setLoading(false);
    });
  }

  static void logIn(context, emailController, passwordController) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.setLoading(true);

    auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      authProvider.setLoading(false);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
          (route) => false);
    }).onError((error, stackTrace) {
      String errorMessage = error.toString();
      String extractedMessage = '';
      if (errorMessage.contains(']')) {
        int startIndex = errorMessage.indexOf(']') + 1;
        extractedMessage = errorMessage.substring(startIndex).trim();
      } else {
        extractedMessage = errorMessage;
      }
      Utils().snackMessage(extractedMessage);

      authProvider.setLoading(false);
    });
  }
}
