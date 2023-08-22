import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipely/data/utils/utils.dart';
import 'package:recipely/views/constants/string_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';
import 'package:recipely/views/screens/auth_screen/sign_up_screen.dart';
import 'package:recipely/views/screens/search_screen/search_screen.dart';
import 'package:recipely/views/widgets/app_button.dart';
import 'package:recipely/views/widgets/custom_appbar.dart';
import 'package:recipely/views/widgets/custom_textform_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(
          isLeading: false,
          title: login,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  email_address,
                  style: form_title_style,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    contentPaddingHorizontal: 5,
                    validateEmail: true,
                    controller: _emailController,
                    prefixIcon: const Icon(Icons.mail_outline),
                    validationText: please_enter_mail,
                    obscureText: false,
                    hintText: enter_mail),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  password,
                  style: form_title_style,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  contentPaddingHorizontal: 5,
                  controller: _passwordController,
                  isPasswordField: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validationText: please_enter_mail,
                  obscureText: _obscureText,
                  hintText: enter_mail,
                  onPressed: _togglePasswordVisibility,
                ),
                const SizedBox(
                  height: 22,
                ),
                AppButton(
                  isLoading: _isLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      _auth
                          .signInWithEmailAndPassword(
                        email: _emailController.text.toString(),
                        password: _passwordController.text.toString(),
                      )
                          .then((value) {
                        setState(() {
                          _isLoading = false;
                        });
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
                          extractedMessage =
                              errorMessage.substring(startIndex).trim();
                        } else {
                          extractedMessage = errorMessage;
                        }
                        Utils().snackMessage(extractedMessage);
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    }
                  },
                  btnText: login,
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      not_have_account,
                      style: form_title_style,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      ),
                      child: const Text(
                        signup,
                        style: signup_btn_style,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
