import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipely/controllers/firebase_controller.dart';
import 'package:recipely/provider/auth_provider.dart';
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
  final _formKey = GlobalKey<FormState>();

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
                Consumer<AuthProvider>(builder: (context, value, child) {
                  return CustomTextFormField(
                    contentPaddingHorizontal: 5,
                    controller: _passwordController,
                    isPasswordField: true,
                    prefixIcon: const Icon(Icons.lock_outline),
                    validationText: please_enter_mail,
                    obscureText: value.obscureText,
                    hintText: enter_mail,
                    onBackPressed: () {
                      value.togglePasswordVisibility();
                    },
                  );
                }),
                const SizedBox(
                  height: 22,
                ),
                Consumer<AuthProvider>(builder: (context, value, child) {
                  return AppButton(
                    isLoading: value.isLoading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseController.signUp(
                            context, _emailController, _passwordController);
                      }
                    },
                    btnText: login,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
