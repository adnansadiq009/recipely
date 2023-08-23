import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipely/provider/search_provider.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/size_constant.dart';
import 'package:recipely/views/constants/string_constant.dart';
import 'package:recipely/views/screens/search_screen/bottom_sheet.dart';
import 'package:recipely/views/screens/search_screen/search_tile.dart';
import 'package:recipely/views/widgets/custom_appbar.dart';
import 'package:recipely/views/widgets/custom_textform_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final ref = FirebaseDatabase.instance.ref('Dishes');

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
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
                        controller: _searchController,
                        prefixIcon: const Icon(Icons.search),
                        validationText: please_enter_mail,
                        obscureText: false,
                        hintText: search,
                        onChanged: (String value) {
                          searchProvider.setSearchText(value);
                        },
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => openBottomSheet(context),
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child:
                    Consumer<SearchProvider>(builder: (context, value, child) {
                  return FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: ((context, snapshot, animation, index) {
                      final name = snapshot.child('Name').value.toString();
                      final category =
                          snapshot.child('Category').value.toString();
                      final recipeType =
                          snapshot.child('Recipe').value.toString();
                      if ((searchProvider.searchText.isEmpty) &&
                          (value.selectedCategoryFilter == '1' ||
                              value.selectedCategoryFilter == category) &&
                          (value.selectedRecipeFilter == '1' ||
                              value.selectedRecipeFilter == recipeType)) {
                        return SearchTile(
                          name: snapshot.child('Name').value.toString(),
                          chef: snapshot.child('Chef').value.toString(),
                        );
                      } else if ((searchProvider.searchText.isEmpty) &&
                          (value.selectedCategoryFilter == '1') &&
                          (value.selectedCategoryFilter == '1')) {
                        return SearchTile(
                          name: snapshot.child('Name').value.toString(),
                          chef: snapshot.child('Chef').value.toString(),
                        );
                      } else if ((searchProvider.searchText.isNotEmpty) &&
                          (name.toLowerCase().contains(
                              searchProvider.searchText.toLowerCase()))) {
                        return SearchTile(
                          name: snapshot.child('Name').value.toString(),
                          chef: snapshot.child('Chef').value.toString(),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
