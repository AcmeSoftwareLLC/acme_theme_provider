import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
import 'package:example/features/theme/note.dart';
import 'package:example/providers.dart';


class NoteAddNoteGateway extends DbGateway<NoteAddNoteGatewayOutput,
    NoteAddNoteSuccessResponse, NoteAddNoteSuccessInput> {
  NoteAddNoteGateway({
    required super.provider,
  }) : super(context: providersContext);

  @override
  DbRequest buildRequest(NoteAddNoteGatewayOutput output) {
    return NoteAddNoteRequest(note: output.note);
  }

  @override
  NoteAddNoteSuccessInput onSuccess(
      NoteAddNoteSuccessResponse response,
      ) {
    return NoteAddNoteSuccessInput();
  }
}

class NoteAddNoteRequest extends DbRequest {
  NoteAddNoteRequest({required this.note});
  final Note note;
}

class NoteAddNoteSuccessResponse extends DbSuccessResponse {
  NoteAddNoteSuccessResponse({required this.title, required this.content, required this.noteId,});

  final String title;
  final String content;
  final String noteId;
}

class NoteAddNoteGatewayOutput extends Output {
  NoteAddNoteGatewayOutput({required this.note,});

  final Note note;

  @override
  List<Object?> get props => [note,];
}

class NoteAddNoteSuccessInput extends SuccessInput {}
