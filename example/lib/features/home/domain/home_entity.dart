import 'package:clean_framework/clean_framework_providers.dart';

class HomeEntity extends Entity {
  final List<String> noteTitles;
  final List<String> noteContent;

  HomeEntity({required this.noteTitles , required this.noteContent });

  HomeEntity copyWith({
    List<String>? noteTitles,
    List<String>? noteContent,
  }) {
    return HomeEntity(
      noteTitles: noteTitles ?? this.noteTitles,
      noteContent: noteContent?? this.noteContent,
    );
  }

  @override
  List<Object?> get props => [
        noteTitles,
      ];
}
