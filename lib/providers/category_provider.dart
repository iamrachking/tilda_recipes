import 'package:flutter/material.dart';
import 'package:tilda_recipes/models/category_model.dart';
import 'package:tilda_recipes/services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  bool isloading = true;
  List<Category> categories = [];

  final CategoryService _service = CategoryService();

  CategoryProvider() {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isloading = true;
      notifyListeners();

      categories = await _service.getAllCategories();

      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
      throw Exception("Erreur fetchCategories: $e");
    }
  }
}
