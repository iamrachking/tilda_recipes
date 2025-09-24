class Comment {
  final String? commentId;
  final String userId;
  final String text;
  final int likes;
  final DateTime createdAt;

  Comment({
    this.commentId,
    required this.userId,
    required this.text,
    required this.likes,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'] ?? "",
      userId: json['userId'] ?? "",
      text: json['text'] ?? "",
      likes: json['likes'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'text': text,
      'likes': likes,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
