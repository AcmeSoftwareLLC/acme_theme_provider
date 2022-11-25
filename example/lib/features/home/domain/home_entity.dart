import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class HomeEntity extends Entity {
  final List<Note> notes;
  final String noteTitle;
  final List<String> titles;

  HomeEntity({this.notes = const [], this.noteTitle = '', this.titles = const []});

  HomeEntity copyWith({
    List<Note>? notes,
    String? noteTitle,
    List<String>? titles,
  }) {
    return HomeEntity(
      notes: notes?? this.notes,
      noteTitle: noteTitle?? this.noteTitle,
      titles: titles ?? this.titles,
    );
  }

  @override
  List<Object?> get props => [
    notes,
    noteTitle,
    titles,
      ];
}
