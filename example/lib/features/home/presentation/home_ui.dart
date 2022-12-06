import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/home_presenter.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('Tweets', style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),),
        centerTitle: true,
        leading: ProfileIcon.small(
          imagePath:
              'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
        ),
        actions: [
          GestureDetector(
            onTap: () => context.router.push(
              Routes.settings,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                  AssetImage('assets/icons/settings_stroke_icon.png'),
                  color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
      body: _TweetItem(
        viewModel: viewModel,
      ),
      floatingActionButton: AddTweetButton(),
    );
  }
}

class _TweetItem extends StatelessWidget {
  final HomeViewModel viewModel;

  const _TweetItem({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return viewModel.isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShowTweet(
                      post: 'You can see all the typography in this tweet',
                      imagePath: '',
                      firstName: 'Hari',
                      lastName: 'Bahadur',
                      userName: 'haribahadur1992',
                      userImage:
                          'https://xsgames.co/randomusers/assets/avatars/female/40.jpg'),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ShowTweet(
                            post: viewModel.tweets[index].post,
                            imagePath: viewModel.tweets[index].imagePath,
                            firstName: viewModel.tweets[index].firstName,
                            lastName: viewModel.tweets[index].lastName,
                            userName: viewModel.tweets[index].userName,
                            userImage: viewModel.tweets[index].userImage,
                          ),
                        ],
                      );
                    },
                    itemCount: viewModel.tweets.length,
                  ),
                  ShowTweet(
                    post: 'Welcome to the new age',
                    imagePath: '',
                    firstName: 'Alex',
                    lastName: 'Rachel',
                    userName: 'rachelforalex',
                    userImage:
                        'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
                  ),
                ],
              ),
            ),
          );
  }
}
