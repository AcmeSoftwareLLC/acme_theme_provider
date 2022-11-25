import 'dart:io';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/note/presentation/note_presenter.dart';
import 'package:example/features/note/presentation/note_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/dialogs.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          if (viewModel.title.isEmpty && viewModel.content.isEmpty) {
            showErrorSnackBar(
              context,
              'Both the title and description are empty...',
            );
          } else if (viewModel.title.isEmpty) {
            showErrorSnackBar(
              context,
              'The title text is empty',
            );
          } else if (viewModel.content.isEmpty) {
            showErrorSnackBar(
              context,
              'The content text is empty',
            );
          } else if (viewModel.imagePath.isEmpty) {
            showErrorSnackBar(
              context,
              'Please upload image',
            );
          } else {
            showOKDialog(
                context: context,
                title: 'Are you sure you wanna add to the notes?',
                content: 'This will add to your note',
                onOk: () {
                  viewModel.addNote();
                  context.router.push(Routes.home);
                  viewModel.refresh();
                });
          }
        },
        icon: Icon(Icons.add),
        label: Text(
          'Add note',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: screenHeight / 3,
              backgroundColor: Theme.of(context).primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      viewModel.imagePath.isEmpty
                          ? 'Add image'
                          : 'Change image',
                    ),
                    IconButton(
                      onPressed: viewModel.openGallery,
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                      ),
                    ),
                  ],
                ),
                background: viewModel.imagePath.isEmpty
                    ? const SizedBox()
                    : Image.file(
                        File(viewModel.imagePath),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(16),
          child: AddNoteUIBody(
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}

class AddNoteUIBody extends StatelessWidget {
  AddNoteUIBody({required this.viewModel});

  final NoteViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            style: Theme.of(context).textTheme.titleLarge,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Theme.of(context).primaryColor,
              hintText: 'Note title',
            ),
            onChanged: (val) => viewModel.enterTitle(val),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: Theme.of(context).textTheme.labelMedium,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusColor: Theme.of(context).primaryColor,
                hintText: 'Note description'),
            maxLines: 30,
            onChanged: (val) => viewModel.enterContent(val),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
