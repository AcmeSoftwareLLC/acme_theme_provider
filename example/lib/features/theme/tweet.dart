import 'package:flutter/material.dart';

@immutable
class Tweet {
  const Tweet({
    required this.userName,
    required this.post,
    required this.imagePath,
  });

  final String userName;
  final String post;
  final String imagePath;

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'post': post,
      'imagePath': imagePath,
    };
  }

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      userName: json['userName'] ?? '',
      post: json['post'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
