import 'package:flutter/material.dart';

@immutable
class Tweet {
  const Tweet({
    required this.userName,
    required this.imagePath,
  });

  final String userName;

  final String imagePath;

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'imagePath': imagePath,
    };
  }

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      userName: json['userName'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
