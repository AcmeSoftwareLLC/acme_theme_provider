import 'package:clean_framework/clean_framework_providers.dart';

class NoteEntity extends Entity {
  final String title;
  final String content;
  final String noteID;
  final String noteDate;
  final String category;

  NoteEntity({
    this.title = '',
    this.content = '',
    this.noteID = '',
    this.noteDate = '',
    this.category = '',
  });

  NoteEntity copyWith({
    String? title,
    String? content,
    String? noteID,
    String? noteDate,
    String? category,
  }) {
    return NoteEntity(
      title: title ?? this.title,
      content: content ?? this.content,
      noteID: noteID ?? this.noteID,
      noteDate: noteDate ?? this.noteDate,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      content,
      noteID,
      noteDate,
      category,
    ];
  }
}
