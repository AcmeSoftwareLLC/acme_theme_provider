import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/note/domain/note_ui_output.dart';
import 'package:example/features/note/presentation/note_view_model.dart';
import 'package:flutter/material.dart';
import 'package:example/features/note/domain/note_use_case.dart';

class NotePresenter
    extends Presenter<NoteViewModel, NoteUIOutput, NoteUseCase> {
  const NotePresenter({
    super.key,
    required super.provider,
    required super.builder,
  });

  @override
  void onLayoutReady(BuildContext context, NoteUseCase useCase) {}

  @override
  NoteViewModel createViewModel(
    NoteUseCase useCase,
    NoteUIOutput output,
  ) {
    final noteList = output.notes
        .map(
          (note) => NoteList(
            title: note.title,
            content: note.content,
            imagePath: note.imagePath,
          ),
        )
        .toList();
    return NoteViewModel(
      title: output.title,
      content: output.content,
      imagePath: output.imagePath,
      notes: noteList,
      addNote: useCase.addNote,
      openGallery: useCase.pickImage,
      enterTitle: (String title) => useCase.onTitleEntered(
        title: title,
      ),
      enterContent: (String content) => useCase.onContentEntered(
        content: content,
      ),
    );
  }
}
