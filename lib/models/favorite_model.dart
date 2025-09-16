import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  final String recipeId;
  final DateTime createdAt;

  Favorite({required this.recipeId, required this.createdAt});

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      recipeId: map['recipeId'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'recipeId': recipeId, 'createdAt': createdAt};
  }
}
