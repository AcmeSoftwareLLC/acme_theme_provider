import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:acme_theme_example/features/home/presentation/home_presenter.dart';
import 'package:acme_theme_example/features/home/presentation/home_view_model.dart';
import 'package:acme_theme_example/main.dart';
import 'package:acme_theme_example/providers.dart';
import 'package:acme_theme_example/routes.dart';
import 'package:acme_theme_example/widgets/app_icons.dart';
import 'package:acme_theme_example/widgets/profile_icon.dart';
import 'package:acme_theme_example/widgets/show_tweet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        title: Text(
          'Tweets',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        leading: const ProfileIcon.small(
          imagePath:
              'https://xsgames.co/randomusers/assets/avatars/female/40.jpg',
        ),
        actions: [
          IconButton(
            onPressed: () {
              SampleAppListenerScope.of(context).isOnThemeBuilder
                  ? SampleAppListenerScope.of(context).onIconPressed()
                  : context.router.go(Routes.settings);
            },
            icon: Icon(
              SampleAppListenerScope.of(context).isOnThemeBuilder
                  ? Icons.switch_right
                  : Icons.settings,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _TweetItem(
        viewModel: viewModel,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => context.router.push(Routes.addTweet),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _TweetItem extends StatelessWidget {
  final HomeViewModel viewModel;

  const _TweetItem({
    required this.viewModel,
  });

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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                  const ShowTweet(
                      post: 'You can see all the typography in this tweet',
                      imagePath: '',
                      firstName: 'James',
                      lastName: 'Smith',
                      userName: 'haribahadur1992',
                      userImage:
                          'https://xsgames.co/randomusers/assets/avatars/female/40.jpg'),
                  const ShowTweet(
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
