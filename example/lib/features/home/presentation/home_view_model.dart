import 'package:clean_framework/clean_framework_providers.dart';

class HomeViewModel extends ViewModel {
  final List<String> noteTitles;
  final String noteDate;

  const HomeViewModel(
    this.noteTitles,
    this.noteDate,
  );

  @override
  List<Object?> get props => [
        noteTitles,
        noteDate,
      ];
}
