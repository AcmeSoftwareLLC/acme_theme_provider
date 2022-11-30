import 'package:flutter/material.dart';

@immutable
class Tweet {
  const Tweet({
    required this.post,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userImage,
    required this.imagePath,
  });

  final String post;
  final String firstName;
  final String lastName;
  final String userName;
  final String userImage;
  final String imagePath;

  Map<String, dynamic> toJson() {
    return {
      'post': post,
      'imagePath': imagePath,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'userImage': userImage,
    };
  }

  factory Tweet.fromJson(Map<String, dynamic> json) {
    return Tweet(
      post: json['post'] ?? '',
      imagePath: json['imagePath'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
    );
  }
}
