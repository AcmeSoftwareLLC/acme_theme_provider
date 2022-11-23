import 'package:clean_framework/clean_framework_providers.dart';

class NoteUIOutput extends Output {
  NoteUIOutput({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.notes,
  });

  final String title;
  final String content;
  final String imagePath;
  final List<NoteListOutput> notes;

  @override
  List<Object?> get props {
    return [title, content, imagePath, notes];
  }
}

class NoteListOutput extends Output {
  NoteListOutput({
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
