import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/presentation/home_presenter.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
import 'package:example/providers.dart';
import 'package:flutter/material.dart';

class HomeUI extends UI<HomeViewModel> {
  HomeUI({super.key,});

  @override
  Presenter create(PresenterBuilder<HomeViewModel> builder) {
    return HomePresenter(
      builder: builder,
      provider: homeUseCaseProvider,
    );
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Text('viewModel.title'),
        ),
      ),
    );
  }
}
