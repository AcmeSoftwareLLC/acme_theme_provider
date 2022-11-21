import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/note/presentation/note_presenter.dart';
import 'package:example/features/note/presentation/note_view_model.dart';
import 'package:example/providers.dart';
import 'package:flutter/material.dart';

class NoteUI extends UI<NoteViewModel> {
  NoteUI({
    super.key,
    super.create,
  });

  @override
  Presenter create(PresenterBuilder<NoteViewModel> builder) {
    return NotePresenter(
      builder: builder,
      provider: noteUseCaseProvider,
    );
  }

  @override
  Widget build(BuildContext context, NoteViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Text('welcome to main note app'),
      ),
    );
  }
}
