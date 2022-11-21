import 'package:clean_framework/clean_framework_providers.dart';

class NoteViewModel extends ViewModel {
  const NoteViewModel({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  List<Object?> get props {
    return [title, content];
  }
}
