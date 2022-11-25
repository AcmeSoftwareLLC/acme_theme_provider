import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class NoteViewModel extends ViewModel {
  const NoteViewModel({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.notes,
    required this.addNote,
    required this.enterTitle,
    required this.enterContent,
    required this.openGallery,
    required this.refresh,
  });

  final String title;
  final String content;
  final String imagePath;
  final List<NoteList> notes;
  final VoidCallback addNote;
  final VoidCallback openGallery;
  final ValueChanged<String> enterTitle;
  final ValueChanged<String> enterContent;
  final VoidCallback refresh;

  @override
  List<Object?> get props {
    return [
      title,
      content,
      imagePath,
      notes,
    ];
  }
}

class NoteList extends ViewModel {
  NoteList({
    required this.title,
    required this.content,
    required this.imagePath,
  });

  final String title;
  final String content;
  final String imagePath;

  @override
  List<Object?> get props => [
        title,
        content,
        imagePath,
      ];
}
