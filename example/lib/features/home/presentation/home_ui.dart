import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/presentation/home_presenter.dart';
import 'package:example/features/home/presentation/home_view_model.dart';
import 'package:example/providers.dart';
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
            children: [
              Expanded(child: _NoteItem(viewModel: viewModel,)),
              Expanded(
                child: _NoteItem2(viewModel: viewModel,),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddNoteButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _NoteItem extends StatelessWidget{

  final HomeViewModel viewModel;

  const _NoteItem({required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      if (index.isEven) {
        return  NoteCard.squared(
          title: viewModel.noteTitles.first,
          content: 'New idea',
        );
      }
      else return  NoteCard.rectangular(
        title: viewModel.noteTitles.last,
        content: 'New idea',
      );
    },
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

}


class _NoteItem2 extends StatelessWidget{

  final HomeViewModel viewModel;

  const _NoteItem2({required this.viewModel});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      if (index.isOdd) {
        return  NoteCard.squared(
          title: viewModel.noteTitles.first,
          content: 'New idea',
        );
      }
      else return  NoteCard.rectangular(
        title: viewModel.noteTitles.last,
        content: 'New idea',
      );
    },
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

}