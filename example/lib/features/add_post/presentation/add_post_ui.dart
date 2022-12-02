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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          screenHeight / 12,
        ),
        child: AppBar(
          leadingWidth: screenWidth / 1.5,
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    viewModel.refresh();
                    context.router.push(Routes.home);
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
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
                      viewModel.addTweet();
                      viewModel.refresh();
                      context.router.go(Routes.home);
                    },
                  );
                } else {
                  showOKDialog(
                    context: context,
                    title: 'Are you sure you wanna add to the post?',
                    content:
                        'This will add to your post, you can see in the feed',
                    onOk: () {
                      viewModel.addTweet();
                      viewModel.refresh();
                      context.router.push(Routes.home);
                    },
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Tweet',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
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
      body: viewModel.showLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(16),
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
          SizedBox(
            height: 10,
          ),
          TextField(
            maxLines: 4,
            style: Theme.of(context).textTheme.titleLarge,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Theme.of(context).primaryColor,
              hintText: 'Write your thought',
            ),
            onChanged: (val) => viewModel.enterPost(val),
          ),
          SizedBox(
            height: 10,
          ),
          viewModel.imagePath.isNotEmpty
              ? Image.file(
                  File(viewModel.imagePath),
                  height: screenHeight / 3,
                  width: screenWidth,
                  fit: BoxFit.fill,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
