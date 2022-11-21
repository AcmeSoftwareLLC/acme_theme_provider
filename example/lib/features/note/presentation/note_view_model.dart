import 'dart:ui';

import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class NoteViewModel extends ViewModel {
  const NoteViewModel({
    required this.title,
    required this.content,
    required this.addNote,
    required this.enterTitle,
    required this.enterContent,
  });

  final String title;
  final String content;
  final VoidCallback addNote;
  final ValueChanged<String> enterTitle;
  final ValueChanged<String> enterContent;

  @override
  List<Object?> get props {
    return [title, content];
  }
}
