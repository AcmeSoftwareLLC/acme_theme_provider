import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/domain/home_ui_output.dart';
import 'package:example/features/home/domain/home_use_case.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
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
    useCase.init();
  }

  @override
  HomeViewModel createViewModel(HomeUseCase useCase, HomeUIOutput output) {
    return HomeViewModel(output.noteTitles, output.noteContent,);
  }
}
