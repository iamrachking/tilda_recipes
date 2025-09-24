class Category {
  final String? categoryId;
  final String name;
  final String imageUrl;

  Category({this.categoryId, required this.name, required this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'],
      name: json['name'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {name: name, imageUrl: imageUrl};
  }
}
