import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/add_post/domain/add_post_ui_output.dart';
import 'package:example/features/add_post/presentation/add_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:example/features/add_post/domain/add_post_use_case.dart';

class AddPostPresenter
    extends Presenter<AddPostViewModel, AddPostUIOutput, AddPostUseCase> {
  const AddPostPresenter({
    super.key,
    required super.provider,
    required super.builder,
  });

  @override
  void onLayoutReady(BuildContext context, AddPostUseCase useCase) {}

  @override
  AddPostViewModel createViewModel(
    AddPostUseCase useCase,
    AddPostUIOutput output,
  ) {
    final tweetList = output.tweets
        .map(
          (note) => AddPostList(
            userName: note.userName,
            imagePath: note.imagePath,
          ),
        )
        .toList();
    return AddPostViewModel(
      userName: output.userName,
      imagePath: output.imagePath,
      tweets: tweetList,
      getRandomUser: useCase.getRandomUser,
      addTweet: useCase.addTweet,
      openGallery: useCase.pickImage,
      enterUserName: (String title) => useCase.onUserNameEntered(
        userName: title,
      ),
      refresh: useCase.refresh,
    );
  }
}
