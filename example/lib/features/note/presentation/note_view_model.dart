import 'package:clean_framework/clean_framework_providers.dart';

class NoteViewModel extends ViewModel {

  const NoteViewModel(this.title, this.content);

  final String title;
  final String content;


  @override
  List<Object?> get props { return [title, content]; }

}