import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/note/domain/note_entity.dart';
import 'package:example/features/note/domain/note_ui_output.dart';
import 'package:example/features/note/external_interface/note_add_note_gateway.dart';
import 'package:example/features/note/external_interface/note_image_picker_gateway.dart';
import 'package:example/features/theme/note.dart';

class NoteUseCase extends UseCase<NoteEntity> {
  NoteUseCase()
      : super(
          entity: NoteEntity(),
          outputFilters: {
            NoteUIOutput: (NoteEntity entity) {
              final noteListOutput = entity.notes.values
                  .map(
                    (note) => NoteListOutput(
                      title: note.title,
                      content: note.content,
                      imagePath: note.imagePath,
                    ),
                  )
                  .toList();
              return NoteUIOutput(
                title: entity.title,
                content: entity.content,
                imagePath: entity.imagePath,
                notes: noteListOutput,
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

  Future<void> pickImage() async {
    await request<NoteImagePickerGatewayOutput,
        NoteImagePickerGatewaySuccessInput>(
      NoteImagePickerGatewayOutput(),
      onSuccess: (NoteImagePickerGatewaySuccessInput input) {
        return entity.merge(
          imagePath: input.imagePath,
        );
      },
      onFailure: (failure) => entity,
    );
  }

  Future<void> addNote() async {
    await request<NoteAddNoteGatewayOutput, NoteAddNoteSuccessInput>(
      NoteAddNoteGatewayOutput(
        note: Note(
          title: entity.title,
          content: entity.content,
          imagePath: entity.imagePath,
        ),
      ),
      onSuccess: (input) {
        final notes = <String, Note>{};
        for (final note in input.notes) {
          notes[note.title] = Note(
            title: note.title,
            content: note.content,
            imagePath: note.imagePath,
          );
        }
        return entity.merge(
          notes: notes,
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
    await refresh();
  }

  Future<void> refresh() async {
    entity = NoteEntity();
  }
}
