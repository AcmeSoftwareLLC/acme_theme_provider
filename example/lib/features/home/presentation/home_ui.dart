import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/home_presenter.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:example/widgets/add_note_button.dart';
import 'package:example/widgets/note_card.dart';
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
        title: Text(
          'My Tweet',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: SizedBox.shrink(),
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
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Hero(
                        tag: 'cardImage',
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: viewModel.tweets.length,
                          itemBuilder: (BuildContext ctx, index) {
                            if (index.isEven) {
                              return GestureDetector(
                                onTap: () {
                                  viewModel.onTweetSelected(
                                    viewModel.tweets[index].userName,
                                  );
                                  context.router.go(Routes.addTweet);
                                },
                                child: NoteCard.surface(
                                  title: viewModel.tweets[index].userName,
                                  content: '',
                                  imagePath: viewModel.tweets[index].imagePath,
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  viewModel.onTweetSelected(
                                    viewModel.tweets[index].userName,
                                  );
                                  context.router.push(Routes.addTweet);
                                },
                                child: NoteCard.surfaceVariant(
                                  title: viewModel.tweets[index].userName,
                                  content: '',
                                  imagePath: viewModel.tweets[index].imagePath,
                                ),
                              );
                            }
                          },
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      )),
                ),
              );
  }
}
