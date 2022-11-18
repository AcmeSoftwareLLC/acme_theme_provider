import 'package:clean_framework/clean_framework_providers.dart';

class NoteUIOutput extends Output {
  final String title;
  final String content;
  final String noteID;

  NoteUIOutput(this.title, this.content, this.noteID);

  @override
  List<Object?> get props {
    return [title, content, noteID];
  }
}
