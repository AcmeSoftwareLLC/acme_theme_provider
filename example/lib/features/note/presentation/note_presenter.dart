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
  NoteViewModel createViewModel(NoteUseCase useCase, NoteUIOutput output) {
    return NoteViewModel(
      title: output.title,
      content: output.content,
    );
  }
}
