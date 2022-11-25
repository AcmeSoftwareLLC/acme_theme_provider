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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TileCard(),
                  MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: _NoteItem(
                        viewModel: viewModel,
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: AddNoteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _TileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: SizedBox(
          height: screenHeight / 10,
          width: screenWidth / 2,
          child: Center(
              child: Text(
            'My Notes',
            style: Theme.of(context).textTheme.headlineMedium,
          ))),
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
    );
  }
}

class _NoteItem extends StatelessWidget {
  final HomeViewModel viewModel;

  const _NoteItem({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (viewModel.notes.isEmpty) {
          return NoteCard.squared(
            title: 'Tap\nto\nstart\nnoting',
            content: '',
            imagePath: '',
          );
        } else if (index.isEven) {
          return GestureDetector(
            onTap: () {
              viewModel.onNoteSelected(
                viewModel.notes[index].title,
              );
              context.router.go(Routes.note);
            },
            child: NoteCard.squared(
              title: viewModel.notes[index].title,
              content: viewModel.notes[index].content,
              imagePath: viewModel.notes[index].imagePath,
            ),
          );
        } else
          return GestureDetector(
            onTap: () {
              viewModel.onNoteSelected(
                viewModel.notes[index].title,
              );
              context.router.go(Routes.note);
            },
            child: NoteCard.rectangular(
              title: viewModel.notes[index].title,
              content: viewModel.notes[index].content,
              imagePath: viewModel.notes[index].imagePath,
            ),
          );
      },
      itemCount: viewModel.notes.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
