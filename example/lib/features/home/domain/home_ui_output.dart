import 'package:clean_framework/clean_framework_providers.dart';

class HomeUIOutput extends Output {
  final List<String> noteTitles;
  final List<String> noteContent;
  HomeUIOutput({required this.noteTitles, required this.noteContent});

  @override
  List<Object?> get props => [noteTitles, noteContent,];

}
