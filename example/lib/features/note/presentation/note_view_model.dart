import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class NoteViewModel extends ViewModel {
  const NoteViewModel({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.addNote,
    required this.enterTitle,
    required this.enterContent,
    required this.openCamera,
  });

  final String title;
  final String content;
  final String imagePath;
  final VoidCallback addNote;
  final VoidCallback openCamera;
  final ValueChanged<String> enterTitle;
  final ValueChanged<String> enterContent;

  @override
  List<Object?> get props {
    return [
      title,
      content,
      imagePath,
    ];
  }
}
