import 'package:clean_framework/clean_framework_providers.dart';
import 'package:acme_theme_example/features/home/domain/home_ui_output.dart';
import 'package:acme_theme_example/features/home/domain/home_use_case.dart';
import 'package:acme_theme_example/features/home/presentation/home_view_model.dart';
import 'package:flutter/material.dart';

class HomePresenter
    extends Presenter<HomeViewModel, HomeUIOutput, HomeUseCase> {
  const HomePresenter({
    super.key,
    required super.provider,
    required super.builder,
  });

  @override
  void onLayoutReady(BuildContext context, HomeUseCase useCase) {
    useCase.refresh();
    useCase.init();
  }

  @override
  HomeViewModel createViewModel(HomeUseCase useCase, HomeUIOutput output) {
    return HomeViewModel(
      tweets: output.tweets,
      onTweetSelected: useCase.getSelectedTweet,
      isLoading: output.isLoading,
    );
  }
}
