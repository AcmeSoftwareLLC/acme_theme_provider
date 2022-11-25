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
      'title': title,
      'content': content,
      'imagePath': imagePath,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {

    return Note(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
