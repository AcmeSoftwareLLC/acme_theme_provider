import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/note/domain/note_entity.dart';
import 'package:example/features/note/domain/note_ui_output.dart';
import 'package:example/features/note/external_interface/note_add_note_gateway.dart';
import 'package:example/features/theme/note.dart';

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

  void onTitleEntered({required String title}) {
    entity = entity.merge(title: title);
  }

  void onContentEntered({required String content}) {
    entity = entity.merge(content: content);
  }

  Future<void> addNote() async {
    await request<NoteAddNoteGatewayOutput, NoteAddNoteSuccessInput>(
      NoteAddNoteGatewayOutput(
          note: Note(
        title: entity.title,
        content: entity.content,
        noteDate: DateTime.now().toString(),
        noteID: entity.noteID,
      )),
      onSuccess: (input) {
        return entity.merge(
            title: input.note.title,
            content: input.note.content,
            noteDate: input.note.noteDate.toString(),
            noteID: '${input.note.noteDate.toString()}-${input.note.title}');
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
  }
}

