import 'package:acme_theme_example/features/home/domain/home_domain_models.dart';
import 'package:acme_theme_example/features/home/domain/home_use_case.dart';
import 'package:acme_theme_example/features/home/presentation/home_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HomePresenter
    extends Presenter<HomeViewModel, HomeDomainToUIModel, HomeUseCase> {
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
  HomeViewModel createViewModel(
      HomeUseCase useCase, HomeDomainToUIModel domainModel) {
    return HomeViewModel(
      tweets: domainModel.tweets,
      onTweetSelected: useCase.getSelectedTweet,
      isLoading: domainModel.isLoading,
    );
  }
}
