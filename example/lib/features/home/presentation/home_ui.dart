import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/presentation/home_presenter.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/widgets/add_note_button.dart';
import 'package:example/widgets/profile_icon.dart';
import 'package:example/widgets/show_tweet.dart';
import 'package:flutter/material.dart';

class HomeUI extends UI<HomeViewModel> {
  HomeUI({
    super.key,
  });

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Tweets'),
        centerTitle: true,
        leading: ProfileIcon.small(
          imagePath:
              'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: _NoteItem(
        viewModel: viewModel,
      ),
      floatingActionButton: AddTweetButton(),
    );
  }
}

class _NoteItem extends StatelessWidget {
  final HomeViewModel viewModel;

  const _NoteItem({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return viewModel.isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          )
        : viewModel.tweets.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/no_data.png',
                    ),
                    Text(
                      'You have no tweets. Tap on \'Add Tweets\' to add one',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ShowTweet(
                      post: viewModel.tweets[index].post,
                      imagePath: viewModel.tweets[index].imagePath,
                      firstName: viewModel.tweets[index].firstName,
                      lastName: viewModel.tweets[index].lastName,
                      userName: viewModel.tweets[index].userName,
                      userImage: viewModel.tweets[index].userImage,
                    );
                  },
                  itemCount: viewModel.tweets.length,
                ),
              );
  }
}
