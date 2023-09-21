import 'Categories.dart';

class FoodModel {
  List<Categories> categories; // List of categories

  FoodModel({required this.categories});
  factory FoodModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      final List<dynamic> categoryList = json['categories'];
      final List<Categories> categories =
      categoryList.map((category) => Categories.fromJson(category)).toList();

      return FoodModel(categories: categories);
    } else {
      throw Exception("Failed to parse JSON for FoodModel");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories.map((category) => category.toJson()).toList();
    }
    return data;
  }
}
