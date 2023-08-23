import 'package:flutter/material.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/size_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';

class SearchTile extends StatelessWidget {
  final String name;
  final String chef;
  const SearchTile({required this.name, required this.chef, super.key});

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Container(
      height: 118,
      margin: const EdgeInsets.only(
        bottom: list_item_space,
        left: list_item_margin,
        right: list_item_margin,
        top: list_item_margin,
      ),
      padding: const EdgeInsets.all(list_item_padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(small_radius),
          color: btn_text_color,
          boxShadow: const [
            BoxShadow(
              color: Color(0xffeeeeee),
              offset: Offset(0, 0),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
          SizedBox(
            width: w * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  style: form_title_style,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  chef,
                  style: sub_text_style,
                )
              ],
            ),
          ),
          const Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
                color: primary_color,
                borderRadius: BorderRadius.circular(small_radius)),
            child: const Padding(
              padding: EdgeInsets.all(arrow_padding),
              child: Icon(
                Icons.arrow_forward,
                color: btn_text_color,
                size: arrow_size,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
