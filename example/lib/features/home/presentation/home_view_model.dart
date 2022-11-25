import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ViewModel {
  final List<Note> notes;
  final ValueChanged<String> onNoteSelected;
  final bool isLoading;

  const HomeViewModel({
    required this.notes,
    required this.onNoteSelected,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [
        notes,
        isLoading,
      ];
}
