import 'package:clean_framework/clean_framework_providers.dart';

class NoteUIOutput extends Output {
  NoteUIOutput({
    required this.title,
    required this.content,
    required this.noteID,
  });

  final String title;
  final String content;
  final String noteID;

  @override
  List<Object?> get props {
    return [title, content, noteID];
  }
}
