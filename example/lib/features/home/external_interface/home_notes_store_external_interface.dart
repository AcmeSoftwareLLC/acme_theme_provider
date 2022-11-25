import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/acme_database.dart';
import 'package:example/core/database/db_external_interface.dart';
import 'package:example/features/home/external_interface/home_get_all_notes_gateway.dart';
import 'package:example/features/home/external_interface/home_get_note_gateway.dart';
import 'package:example/features/note/external_interface/note_add_note_gateway.dart';

class HomeNotesStoreExternalInterface extends DbExternalInterface {
  HomeNotesStoreExternalInterface({required super.gatewayConnections});

  MapStoreRef get _noteStore => db.store('note_store');

  @override
  void handleRequest() {
    on<HomeGetAllNotesRequest>((request, send) async {
      final notes = await db.findAll(store: _noteStore);
      send(HomeGetAllNotesSuccessResponse(notes: notes));
    });


    on<HomeGetNoteRequest>((request, send) async {
    final note = await db.findFirst(store: _noteStore, key: request.noteTitle);
    send(HomeGetNoteSuccessResponse(note: note!));
    });

    on<NoteAddNoteRequest>((request, send) async {
      await db.update(
        store: _noteStore,
        key: request.note.title,
        value: request.note.toJson(),
      );
    });
  }

  @override
  FailureResponse onError(Object error) {
    // TODO: implement onError
    throw UnimplementedError();
  }
}
