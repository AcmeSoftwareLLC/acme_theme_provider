import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class NoteEntity extends Entity {
  final String title;
  final String content;
  final String imagePath;
  final Map<String, Note> notes;

  NoteEntity({
    this.title = '',
    this.content = '',
    this.imagePath = '',
    this.notes = const {},
  });

  NoteEntity merge({
    String? title,
    String? content,
    String? imagePath,
    Map<String, Note>? notes,
  }) {
    return NoteEntity(
      title: title ?? this.title,
      content: content ?? this.content,
      imagePath: imagePath ?? this.imagePath,
      notes: notes ?? this.notes,
    );
  }

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
