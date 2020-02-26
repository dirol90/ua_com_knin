import 'package:ua_com_knin/models/Category.dart';

class ListCategory {
  final List<Category> categories;

  ListCategory({
    this.categories,
  });

  factory ListCategory.fromJson(List<dynamic> parsedJson) {
    List<Category> categories = new List<Category>();
    categories = parsedJson.map((i) => Category.fromJson(i)).toList();
    return new ListCategory(
      categories: categories,
    );
  }
}