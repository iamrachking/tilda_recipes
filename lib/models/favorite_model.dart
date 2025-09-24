class Favorite {
  final String recipeId;
  final DateTime createdAt;

  Favorite({required this.recipeId, required this.createdAt});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      recipeId: json['recipeId'] ?? "",
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'recipeId': recipeId, 'createdAt': createdAt.toIso8601String()};
  }
}
