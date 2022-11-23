import 'package:flutter/material.dart';

@immutable
class Note {
  const Note({
    required this.title,
    required this.content,
    required this.imagePath,
  });

  final String title;
  final String content;
  final String imagePath;

  Map<String, dynamic> toJson() {
    return {
      "data": [
        {
          'title': title,
          'content': content,
          'imagePath': imagePath,
        }
      ]
    };
  }
}
