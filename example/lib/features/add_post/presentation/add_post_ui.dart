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
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: () {
          if (viewModel.userName.isEmpty && viewModel.post.isEmpty) {
            showErrorSnackBar(
              context,
              'Both fields are empty...',
            );
          } else if (viewModel.userName.isEmpty) {
            showErrorSnackBar(
              context,
              'Please enter user name',
            );
          } else if (viewModel.post.isEmpty) {
            showErrorSnackBar(
              context,
              'Please enter post',
            );
          } else if (viewModel.imagePath.isEmpty) {
            showErrorSnackBar(
              context,
              'Please upload image',
            );
          } else {
            showOKDialog(
                context: context,
                title: 'Are you sure you wanna add to the post?',
                content: 'This will add to your post, you can see in the feed',
                onOk: () {
                  viewModel.addPost();
                  viewModel.refresh();
                  context.router.push(Routes.home);
                });
          }
        },
        icon: Icon(Icons.add),
        label: Text(
          'Add post',
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
                    IconButton(
                      onPressed: () {
                        context.router.push(Routes.home);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                    Text(
                      viewModel.userName.isEmpty
                          ? 'Add image'
                          : viewModel.userName,
                    ),
                    IconButton(
                      onPressed: viewModel.openGallery,
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Theme.of(context).colorScheme.primaryContainer,
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
          child: AddPostUIBody(
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}

class AddPostUIBody extends StatelessWidget {
  AddPostUIBody({required this.viewModel});

  final AddPostViewModel viewModel;

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
              hintText: 'User Name',
            ),
            onChanged: (val) => viewModel.enterUserName(val),
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
                hintText: 'your post'),
            maxLines: 30,
            onChanged: (val) => viewModel.enterPost(val),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
