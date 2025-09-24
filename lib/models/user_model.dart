class UserModel {
  final String? userId;
  final String avatarUrl;
  final String email;
  final String bio;
  final DateTime createdAt;

  UserModel({
    this.userId,
    required this.avatarUrl,
    required this.email,
    required this.bio,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, uid) {
    return UserModel(
      userId: json['uid'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      email: json['email'] ?? '',
      bio: json['bio'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'avatarUrl': avatarUrl,
      'email': email,
      'bio': bio,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
