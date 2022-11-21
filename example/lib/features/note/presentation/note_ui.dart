import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/note/presentation/note_presenter.dart';
import 'package:example/features/note/presentation/note_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.router.go(Routes.home);
          },
        ),
        title: Text('Add note'),
      ),
      body: AddNoteUI(
        viewModel: viewModel,
      ),
    );
  }
}

class AddNoteUI extends StatelessWidget {
  AddNoteUI({required this.viewModel});

  final NoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleText = TextEditingController();
    TextEditingController contentText = TextEditingController();
    return Column(
      children: [
        TextField(
          controller: titleText,
          decoration: InputDecoration(labelText: 'title'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: contentText,
          decoration: InputDecoration(labelText: 'content'),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              viewModel.enterTitle(titleText.text);
              viewModel.enterContent(contentText.text);
              viewModel.addNote();
            },
            child: Text('Add Note'))
      ],
    );
  }
}
