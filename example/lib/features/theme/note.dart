


import 'package:flutter/material.dart';

@immutable
class Note{
  const Note({
    required this.title,
    required this.content,
    required this.noteDate,
    required this.noteID,
});

  final String title;
  final String content;
  final DateTime noteDate;
  final String noteID;

  Map<String, dynamic> toJson(){
    return {
      'title' : title,
      'content' : content,
      'noteDate' : noteDate,
      'noteID' : noteID,
    };
  }
}