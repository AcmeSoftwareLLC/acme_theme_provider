import 'dart:io';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/add_post/presentation/add_post_presenter.dart';
import 'package:example/features/add_post/presentation/add_post_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class AddPostUI extends UI<AddPostViewModel> {
  AddPostUI({
    super.key,
    super.create,
  });

  @override
  Presenter create(PresenterBuilder<AddPostViewModel> builder) {
    return AddPostPresenter(
      builder: builder,
      provider: addPostUseCaseProvider,
    );
  }

  @override
  Widget build(BuildContext context, AddPostViewModel viewModel) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leadingWidth: screenWidth / 5.5,
        leading: TextButton(
          onPressed: () {
            viewModel.refresh();
            context.router.go(Routes.home);
          },
          child: Text(
            'Cancel',
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                if (viewModel.post.isEmpty) {
                  showErrorSnackBar(
                    context,
                    'Write Your thought to post...',
                  );
                } else if (viewModel.imagePath.isEmpty) {
                  showOKDialog(
                    context: context,
                    title:
                        'Are you sure you wanna add to tweet without an image?',
                    content: 'This will add to your post without an image',
                    onOk: () {
                      context.router.pop();
                      viewModel.addTweet();
                      context.router.push(Routes.home);
                      viewModel.refresh();
                    },
                  );
                } else {
                  showOKDialog(
                    context: context,
                    title: 'Are you sure you wanna add to the post?',
                    content:
                        'This will add to your post, you can see in the feed',
                    onOk: () {
                      context.router.pop();
                      viewModel.addTweet();
                      context.router.push(Routes.home);
                      viewModel.refresh();
                    },
                  );
                }
              },
              child: Text(
                'Tweet',
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          viewModel.openGallery();
        },
        icon: Icon(Icons.add),
        label: Text(
          viewModel.imagePath.isEmpty ? 'Add image' : 'Change image',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: AddPostUIBody(
          viewModel: viewModel,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
      ),
    );
  }
}

class AddPostUIBody extends StatelessWidget {
  AddPostUIBody({
    required this.viewModel,
    required this.screenHeight,
    required this.screenWidth,
  });

  final AddPostViewModel viewModel;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Theme.of(context).primaryColor,
              hintText: 'Write your thought',
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            onChanged: (val) => viewModel.enterPost(val),
          ),
          SizedBox(
            height: 10,
          ),
          viewModel.imagePath.isNotEmpty
              ? Image.file(
                  File(viewModel.imagePath),
                  height: screenHeight / 3.2,
                  fit: BoxFit.contain,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
