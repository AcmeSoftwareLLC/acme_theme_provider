import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/home_presenter.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
import 'package:example/features/post_image/presentation/post_image_presenter.dart';
import 'package:example/features/post_image/presentation/post_image_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/add_note_button.dart';
import 'package:example/widgets/note_card.dart';
import 'package:flutter/material.dart';

class PostImageUI extends UI<PostImageViewModel> {
  PostImageUI({
    super.key,
  });

  @override
  Presenter create(PresenterBuilder<PostImageViewModel> builder) {
    return PostImagePresenter(
      builder: builder,
      provider: postImageUseCaseProvider,
    );
  }

  @override
  Widget build(BuildContext context, PostImageViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notes',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: SizedBox.shrink(),
      ),
      body: Center(
        child: Container(
          child: Image.network(viewModel.imageUrl),
        ),
      )
    );
  }
}

