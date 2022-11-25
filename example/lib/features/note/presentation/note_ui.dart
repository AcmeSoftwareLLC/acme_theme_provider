import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/note/presentation/note_presenter.dart';
import 'package:example/features/note/presentation/note_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/dialogs.dart';
import 'package:example/widgets/upload_image.dart';
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
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () {
            context.router.go(Routes.home);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text('Add Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.alarm,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: AddNoteUIBody(
          viewModel: viewModel,
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
          //   child: AddNoteButton(
          //     titleText: titleText.text.toString(),
          //     contentText: contentText.text.toString(),
          //     viewModel: viewModel,
          //   ),
          // ),
          UploadImage(
            imagePath: viewModel.imagePath,
            onOpenCamera: viewModel.openGallery,
          ),
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
