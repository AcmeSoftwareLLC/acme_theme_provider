import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class HomeUIOutput extends Output {
  final List<Note> notes;
  final bool isLoading;

  HomeUIOutput({
    required this.notes,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [
        notes,
        isLoading,
      ];
}
