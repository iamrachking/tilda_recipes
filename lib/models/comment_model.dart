import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String commentId;
  final String userId;
  final String text;
  final int likes;
  final DateTime createdAt;

  Comment({
    required this.commentId,
    required this.userId,
    required this.text,
    required this.likes,
    required this.createdAt,
  });

  factory Comment.fromMap(Map<String, dynamic> map, commentId) {
    return Comment(
      commentId: map['commentId'],
      userId: map['userId'],
      text: map['text'],
      likes: map['likes'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commentId': commentId,
      'userId': userId,
      'text': text,
      'likes': likes,
      'createdAt': createdAt,
    };
  }
}
