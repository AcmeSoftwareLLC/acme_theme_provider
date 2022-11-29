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
    int _selectedIndex = 0;

    List<Widget> _widgetOptions = <Widget>[
      _NoteItem(viewModel: viewModel),
      Text(
        'Index 1: Business',
      ),
      Text(
        'Index 2: School',
      ),
    ];

    void _onItemTapped(int index) {
      _selectedIndex = index;
    }

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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: AddNoteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
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
                      'You have no notes. Tap on \'Add Note\' to add one',
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
                                  context.router.go(Routes.note);
                                },
                                child: NoteCard.surface(
                                  title: viewModel.tweets[index].userName,
                                  content: viewModel.tweets[index].post,
                                  imagePath: viewModel.tweets[index].imagePath,
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  viewModel.onTweetSelected(
                                    viewModel.tweets[index].userName,
                                  );
                                  context.router.push(Routes.note);
                                },
                                child: NoteCard.surfaceVariant(
                                  title: viewModel.tweets[index].userName,
                                  content: viewModel.tweets[index].post,
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
