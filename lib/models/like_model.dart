import 'package:cloud_firestore/cloud_firestore.dart';

class Like {
  final String userId;
  final DateTime createdAt;

  Like({required this.userId, required this.createdAt});

  factory Like.fromMap(Map<String, dynamic> map) {
    return Like(
      userId: map['userId'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'createdAt': createdAt};
  }
}
