import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String searchText = '';
  String _selectedCategory = '1';
  String _selectedRecipe = '1';
  String _selectedCategoryFilter = '1';
  String _selectedRecipeFilter = '1';

  void setSearchText(String text) {
    searchText = text;
    notifyListeners();
  }

  String get selectedCategory => _selectedCategory;
  void setSelectedCategory(String value) {
    _selectedCategory = value;
    notifyListeners();
  }

  String get selectedRecipe => _selectedRecipe;
  void setSelectedRecipe(String value) {
    _selectedRecipe = value;
    notifyListeners();
  }

  String get selectedCategoryFilter => _selectedCategoryFilter;
  void setSelectedCategoryFilter(String value) {
    _selectedCategoryFilter = value;
    notifyListeners();
  }

  String get selectedRecipeFilter => _selectedRecipeFilter;
  void setSelectedRecipeFilter(String value) {
    _selectedRecipeFilter = value;
    notifyListeners();
  }
}
