class Category {
  final String categoryId;
  final String name;
  final String imageUrl;

  Category({
    required this.categoryId,
    required this.name,
    required this.imageUrl,
  });

  factory Category.fromMap(Map<String, dynamic> map, documentId) {
    return Category(
      categoryId: documentId,
      name: map['name'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {categoryId: categoryId, name: name, imageUrl: imageUrl};
  }
}
