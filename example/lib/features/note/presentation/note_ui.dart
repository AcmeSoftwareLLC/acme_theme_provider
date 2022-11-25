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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 200,
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
                        height: 300,
                        width: 500,
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
          Text('Title'),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(),
            ),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onChanged: (val) => viewModel.enterTitle(val),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Description'),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(),
            ),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Type something.....',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onChanged: (val) => viewModel.enterContent(val),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Center(
          //   child: GestureDetector(
          //     onTap: () => viewModel.openGallery,
          //     child: Container(
          //       height: 50,
          //       width: 100,
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).colorScheme.primaryContainer,
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //       child: Center(
          //         child: Text(
          //           'Add image',
          //           style: Theme.of(context).textTheme.labelMedium,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Center(
            child: GestureDetector(
              onTap: () {
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
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Add note',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddNoteButton extends StatelessWidget {
  AddNoteButton({
    required this.titleText,
    required this.contentText,
    required this.viewModel,
  });

  final NoteViewModel viewModel;
  final String titleText;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(titleText);
        print(contentText);
        if (titleText.isEmpty && contentText.isEmpty) {
          showErrorSnackBar(
            context,
            'Both the title and description are empty...',
          );
        } else if (titleText.isEmpty) {
          showErrorSnackBar(
            context,
            'The title text is empty',
          );
        } else if (contentText.isEmpty) {
          showErrorSnackBar(
            context,
            'The content text is empty',
          );
        } else {
          showOKDialog(
              context: context,
              title: 'Are you sure you wanna add to the notes?',
              content: 'This will add to your note',
              onOk: () {
                viewModel.enterTitle(titleText);
                viewModel.enterContent(contentText);
                viewModel.addNote();
              });
        }
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'Add note',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
