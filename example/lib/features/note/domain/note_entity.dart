import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class NoteEntity extends Entity {
  final String title;
  final String content;
  final String imagePath;
  final String noteID;
  final Map<String, Note> notes;

  NoteEntity({
    this.title = '',
    this.content = '',
    this.imagePath = '',
    this.noteID = '',
    this.notes = const {},
  });

  NoteEntity merge({
    String? title,
    String? content,
    String? imagePath,
    String? noteID,
    Map<String, Note>? notes,
  }) {
    return NoteEntity(
      title: title ?? this.title,
      content: content ?? this.content,
      imagePath: imagePath ?? this.imagePath,
      noteID: noteID ?? this.noteID,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      content,
      imagePath,
      noteID,
      notes,
    ];
  }
}
