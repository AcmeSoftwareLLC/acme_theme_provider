import 'package:clean_framework/clean_framework_providers.dart';

class HomeUIOutput extends Output {
  final List<String> noteTitles;
  final String title;
  final String noteDate;

  HomeUIOutput(this.noteTitles, {required this.title, required this.noteDate});

  @override
  List<Object?> get props {
    return [noteTitles, title, noteDate,];
  }
}
