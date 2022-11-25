import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class HomeEntity extends Entity {
  final List<Note> notes;
  final String noteTitle;
  final bool isLoading;

  HomeEntity({
    this.notes = const [],
    this.noteTitle = '',
    this.isLoading = true,
  });

  HomeEntity copyWith({
    List<Note>? notes,
    String? noteTitle,
    bool? isLoading,
  }) {
    return HomeEntity(
      notes: notes ?? this.notes,
      noteTitle: noteTitle ?? this.noteTitle,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        notes,
        noteTitle,
        isLoading,
      ];
}
