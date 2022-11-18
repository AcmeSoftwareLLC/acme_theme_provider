import 'package:clean_framework/clean_framework_providers.dart';

class NoteEntity extends Entity {
  final String? title;
  final String? content;
  final String? noteID;
  final DateTime? noteDate;

  NoteEntity({this.title, this.content, this.noteID, this.noteDate});

  NoteEntity copyWith({
    String? title,
    String? content,
    String? noteID,
    DateTime? noteDate,
  }) {
    return NoteEntity(
      title: title ?? this.title,
      content: content ?? this.content,
      noteID: noteID ?? this.noteID,
      noteDate: noteDate ?? this.noteDate,
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      content,
      noteID,
      noteDate,
    ];
  }
}
