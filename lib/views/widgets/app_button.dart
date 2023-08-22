import 'package:flutter/material.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/size_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? isLoading;
  final String btnText;
  final void Function()? onTap;
  const AppButton({
    required this.btnText,
    this.onTap,
    this.width,
    this.height,
    this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? w,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: primary_color,
          borderRadius: BorderRadius.circular(small_radius),
        ),
        child: Center(
          child: isLoading == true
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  btnText,
                  style: btn_text_style,
                ),
        ),
      ),
    );
  }
}
