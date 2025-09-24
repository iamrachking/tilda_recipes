import 'package:dio/dio.dart';
import 'package:tilda_recipes/models/category_model.dart';
import 'package:tilda_recipes/utils/global_variable.dart';

class CategoryService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      headers: {'Content-Type': "application/json"},
    ),
  );
  Future<List<Category>> getAllCategories() async {
    try {
      final response = await _dio.get("categories");
      if (response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true) {
          final List categories = data['data'];
          return categories
              .map((category) => Category.fromJson(category))
              .toList()
              .cast<Category>();
        } else {
          throw Exception("Donnee inacessible");
        }
      }
      throw Exception("Erreur Https : ${response.statusCode}");
    } catch (e) {
      throw Exception("Erreur lors de la récupération des catégories: $e");
    }
  }
}
