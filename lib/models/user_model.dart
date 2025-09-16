import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String avatarUrl;
  final String email;
  final String bio;
  final DateTime createdAt;

  UserModel({
    this.uid,
    required this.avatarUrl,
    required this.email,
    required this.bio,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, uid) {
    return UserModel(
      uid: map['uid'],
      avatarUrl: map['avatarUrl'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'avatarUrl': avatarUrl,
      'email': email,
      'bio': bio,
      'createdAt': createdAt,
    };
  }
}
