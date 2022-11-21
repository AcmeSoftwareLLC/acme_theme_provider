import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/note/domain/note_entity.dart';
import 'package:example/features/note/domain/note_ui_output.dart';

class NoteUseCase extends UseCase<NoteEntity> {
  NoteUseCase()
      : super(
          entity: NoteEntity(),
          outputFilters: {
            NoteUIOutput: (NoteEntity entity) {
              return NoteUIOutput(
                title: entity.title,
                content: entity.content,
                noteID: entity.noteID,
              );
            },
          },
        );
}
