import 'package:tilda_recipes/models/ingredient_model.dart';

class Recipe {
  final String recipeId;
  final String title;
  final String? imageUrl;
  final String description;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final String categoryId;
  final String chefId;
  final String duration;
  final int likesCount;
  final int commentsCount;
  final int favoritesCount;
  final double rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  Recipe({
    required this.recipeId,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.categoryId,
    required this.chefId,
    required this.duration,
    required this.likesCount,
    required this.commentsCount,
    required this.favoritesCount,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      recipeId: json['recipeId'] ?? json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? "assets/images/default_recipe.png",
      description: json['description'] ?? '',
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e))
              .toList() ??
          [],
      steps: List<String>.from(json['steps'] ?? []),
      categoryId: json['categoryId'] ?? '',
      chefId: json['chefId'] ?? '',
      duration: json['duration'] ?? '',
      likesCount: json['likesCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
      favoritesCount: json['favoritesCount'] ?? 0,
      rating: (json['rating'] ?? 0.0).toDouble(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipeId': recipeId,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'steps': steps,
      'categoryId': categoryId,
      'chefId': chefId,
      'duration': duration,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'favoritesCount': favoritesCount,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
