import 'package:flutter/material.dart';

@immutable
class Note {
  const Note({
    required this.title,
    required this.content,
    required this.noteID,
  });

  final String title;
  final String content;
  final String noteID;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'noteID': noteID,
    };
  }
}
