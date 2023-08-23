import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipely/models/categories_model.dart';
import 'package:recipely/provider/search_provider.dart';
import 'package:recipely/views/constants/color_constants.dart';
import 'package:recipely/views/constants/size_constant.dart';
import 'package:recipely/views/constants/string_constant.dart';
import 'package:recipely/views/constants/text_styles.dart';
import 'package:recipely/views/widgets/app_button.dart';

void openBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Consumer<SearchProvider>(builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(bottom_sheet_padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  filter,
                  style: appbar_textstyle,
                ),
              ),
              const Text(
                category,
                style: bottom_sheet_heading_style,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        value.setSelectedCategory(categories[index].name);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(bottom_sheet_padding),
                        decoration: BoxDecoration(
                            color:
                                value.selectedCategory == categories[index].name
                                    ? primary_color
                                    : filter_container_color,
                            borderRadius: BorderRadius.circular(large_radius)),
                        child: Text(
                          categories[index].name,
                          style:
                              value.selectedCategory == categories[index].name
                                  ? filter_container_text_style_selected
                                  : filter_container_text_style,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                recipe_type,
                style: bottom_sheet_heading_style,
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: recipies.asMap().entries.map((entry) {
                  final index = entry.key;
                  final recipe = entry.value;
                  return GestureDetector(
                    onTap: () {
                      value.setSelectedRecipe(recipies[index].name);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(bottom_sheet_padding),
                      decoration: BoxDecoration(
                        color: value.selectedRecipe == recipe.name
                            ? primary_color
                            : filter_container_color,
                        borderRadius: BorderRadius.circular(large_radius),
                      ),
                      child: Text(
                        recipe.name,
                        style: value.selectedRecipe == recipe.name
                            ? filter_container_text_style_selected
                            : filter_container_text_style,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                  onTap: () {
                    value.setSelectedCategoryFilter(value.selectedCategory);
                    value.setSelectedRecipeFilter(value.selectedRecipe);
                    Navigator.pop(context);
                  },
                  btnText: apply_filter),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    value.setSelectedCategory('1');
                    value.setSelectedCategoryFilter('1');
                    value.setSelectedRecipe('1');
                    value.setSelectedRecipeFilter('1');
                  },
                  child: const Text(
                    clear_filter,
                    style: clear_filter_text_style,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      });
    },
  );
}
