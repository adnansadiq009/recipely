import 'package:flutter/material.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/text_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLeading;
  final List<Widget>? actions;
  const CustomAppbar(
      {super.key,
      required this.isLeading,
      required this.title,
      this.onTap,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: btn_text_color,
        centerTitle: true,
        leadingWidth: 80,
        leading: isLeading
            ? InkWell(onTap: onTap, child: const Icon(Icons.arrow_back_ios))
            : const SizedBox(),
        title: Text(title, style: appbar_textstyle),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
