import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_ui_output.dart';
import 'package:acme_theme_example/features/add_post/presentation/add_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_use_case.dart';

class AddPostPresenter
    extends Presenter<AddPostViewModel, AddPostUIOutput, AddPostUseCase> {
  const AddPostPresenter({
    super.key,
    required super.provider,
    required super.builder,
  });

  @override
  void onLayoutReady(BuildContext context, AddPostUseCase useCase) {
    useCase.getRandomUser();
  }

  @override
  AddPostViewModel createViewModel(
    AddPostUseCase useCase,
    AddPostUIOutput output,
  ) {
    return AddPostViewModel(
      post: output.post,
      imagePath: output.imagePath,
      addTweet: useCase.addTweet,
      openGallery: useCase.pickImage,
      enterPost: (String post) => useCase.onPostEntered(
        post: post,
      ),
      refresh: useCase.refresh,
    );
  }
}
