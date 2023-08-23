// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  int id;
  String name;
  CategoryModel({
    required this.id,
    required this.name,
  });
}

List<CategoryModel> categories = [
  CategoryModel(id: 0, name: 'Breakfast'),
  CategoryModel(id: 1, name: 'Lunch'),
  CategoryModel(id: 2, name: 'Dinner'),
];
List<CategoryModel> recipies = [
  CategoryModel(id: 0, name: 'Salad'),
  CategoryModel(id: 1, name: 'Egg'),
  CategoryModel(id: 2, name: 'Cakes'),
  CategoryModel(id: 3, name: 'Chicken'),
  CategoryModel(id: 4, name: 'Meals'),
  CategoryModel(id: 5, name: 'Vegetables'),
];
