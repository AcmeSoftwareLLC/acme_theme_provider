import 'package:clean_framework/clean_framework_providers.dart';

class HomeViewModel extends ViewModel {
  final List<String> noteTitles;
  final List<String> noteContent;

  const HomeViewModel(
    this.noteTitles,
      this.noteContent,
  );

  @override
  List<Object?> get props => [
        noteTitles,
    noteContent,
      ];
}
