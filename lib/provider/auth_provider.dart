import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _obscureText = true;

  bool get isLoading => _isLoading;
  void setLoading(bool isLoading) {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  bool get obscureText => _obscureText;
  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }
}
