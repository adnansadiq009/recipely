import 'package:flutter/material.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/size_constant.dart';
import 'package:recipely/views/constants/string_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';
import 'package:recipely/views/widgets/custom_appbar.dart';
import 'package:recipely/views/widgets/custom_textform_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: btn_text_color,
        appBar: const CustomAppbar(
          title: search,
          isLeading: false,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: w * 0.74,
                      child: CustomTextFormField(
                          contentPaddingHorizontal: 5,
                          controller: searchController,
                          prefixIcon: const Icon(Icons.search),
                          validationText: please_enter_mail,
                          obscureText: false,
                          hintText: search),
                    ),
                    const Spacer(),
                    Container(
                      width: w * 0.13,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primary_color,
                          borderRadius: BorderRadius.circular(small_radius)),
                      child: Image.asset(
                        'assets/images/filterIcon.png',
                        scale: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
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
                              width: 120,
                              height: 100,
                            ),
                          ),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          SizedBox(
                            width: w * 0.41,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunny sideup with avocado',
                                  maxLines: 2,
                                  style: form_title_style,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Alica fala',
                                  style: sub_text_style,
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                color: primary_color,
                                borderRadius:
                                    BorderRadius.circular(small_radius)),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
