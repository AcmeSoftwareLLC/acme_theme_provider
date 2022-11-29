import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/post_image/domain/post_image_ui_output.dart';
import 'package:example/features/post_image/domain/post_image_use_case.dart';
import 'package:example/features/post_image/presentation/post_image_view_model.dart';
import 'package:flutter/material.dart';

class PostImagePresenter
    extends Presenter<PostImageViewModel, PostImageUIOutput, PostImageUseCase> {
  const PostImagePresenter({
    super.key,
    required super.provider,
    required super.builder,
  });

  @override
  void onLayoutReady(BuildContext context, PostImageUseCase useCase) {
    useCase.init();
  }

  @override
  PostImageViewModel createViewModel(
    PostImageUseCase useCase,
    PostImageUIOutput output,
  ) {
    print('The imageurl is: ${output.imageUrl}');
    return PostImageViewModel(
      imageUrl: output.imageUrl,
    );
  }
}
