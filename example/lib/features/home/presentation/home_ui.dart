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
          'My Notes',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: SizedBox.shrink(),
      ),
      body: viewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : viewModel.notes.isEmpty
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/no_data.png',
                      ),
                      Text('You have no notes. Tap on Add Note to add one'),
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
                        child: _NoteItem(
                          viewModel: viewModel,
                        )),
                  ),
                ),
      floatingActionButton: AddNoteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _NoteItem extends StatelessWidget {
  final HomeViewModel viewModel;

  const _NoteItem({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemCount: viewModel.notes.length,
      itemBuilder: (BuildContext ctx, index) {
        if (index.isEven) {
          return GestureDetector(
            onTap: () {
              viewModel.onNoteSelected(
                viewModel.notes[index].title,
              );
              context.router.go(Routes.note);
            },
            child: NoteCard.surface(
              title: viewModel.notes[index].title,
              content: viewModel.notes[index].content,
              imagePath: viewModel.notes[index].imagePath,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              viewModel.onNoteSelected(
                viewModel.notes[index].title,
              );
              context.router.push(Routes.note);
            },
            child: NoteCard.surfaceVariant(
              title: viewModel.notes[index].title,
              content: viewModel.notes[index].content,
              imagePath: viewModel.notes[index].imagePath,
            ),
          );
        }
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
