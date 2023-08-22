import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipely/data/utils/utils.dart';
import 'package:recipely/views/constants/string_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';
import 'package:recipely/views/widgets/app_button.dart';
import 'package:recipely/views/widgets/custom_appbar.dart';
import 'package:recipely/views/widgets/custom_textform_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
        appBar: CustomAppbar(
          isLeading: true,
          onTap: () => Navigator.pop(context),
          title: signup,
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
                          .createUserWithEmailAndPassword(
                        email: _emailController.text.toString(),
                        password: _passwordController.text.toString(),
                      )
                          .then((value) {
                        _emailController.clear();
                        _passwordController.clear();
                        Utils().snackMessage('Account is created');
                        Future.delayed(const Duration(seconds: 1))
                            .then((value) => Navigator.pop(context));

                        setState(() {
                          _isLoading = false;
                        });
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
                  btnText: signup,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
