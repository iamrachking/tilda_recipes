class Recipe {
  final String? recipeId;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final String categoryId;
  final String chefId;
  final String duration;
  final int likesCount;
  final int commentsCount;
  // final int favoritesCount;
  final int rating;
  final DateTime createdAt;
  final DateTime updateAt;

  Recipe({
    this.recipeId,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.categoryId,
    required this.chefId,
    required this.duration,
    required this.likesCount,
    required this.commentsCount,
    // required this.favoritesCount,
    required this.rating,
    required this.createdAt,
    required this.updateAt,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      title: map['title'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      ingredients: map['ingredients'],
      steps: map['steps'],
      categoryId: map['categoryId'],
      chefId: map['chefId'],
      duration: map['duration'],
      likesCount: map['likesCount'],
      commentsCount: map['commentsCount'],
      rating: map['rating'],
      createdAt: map['createdAt'],
      updateAt: map['updateAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
      'categoryId': categoryId,
      'chefId': chefId,
      'duration': duration,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'rating': rating,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }
}
