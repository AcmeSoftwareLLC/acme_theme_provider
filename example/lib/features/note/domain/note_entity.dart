import 'package:clean_framework/clean_framework_providers.dart';

class NoteEntity extends Entity {
  final String title;
  final String content;
  final String noteDate;
  final String category;
  final String imagePath;

  NoteEntity(
      {this.title = '',
      this.content = '',
      this.noteDate = '',
      this.category = '',
      this.imagePath = ''});

  NoteEntity merge({
    String? title,
    String? content,
    String? noteDate,
    String? category,
    String? imagePath,
  }) {
    return NoteEntity(
      title: title ?? this.title,
      content: content ?? this.content,
      noteDate: noteDate ?? this.noteDate,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      content,
      noteDate,
      category,
      imagePath,
    ];
  }
}
