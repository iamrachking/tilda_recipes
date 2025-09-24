class Like {
  final String userId;
  final DateTime createdAt;

  Like({required this.userId, required this.createdAt});

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      userId: json['userId'] ?? "",
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'createdAt': createdAt.toIso8601String()};
  }
}
