import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class HomeUIOutput extends Output {
  final List<Note> notes;

  HomeUIOutput({required this.notes,});

  @override
  List<Object?> get props => [notes,];

}
