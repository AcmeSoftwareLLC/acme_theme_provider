import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/note.dart';

class HomeViewModel extends ViewModel {

  final List<Note> notes;

  const HomeViewModel({
    required this.notes,
  });

  @override
  List<Object?> get props => [
        notes,
      ];
}
