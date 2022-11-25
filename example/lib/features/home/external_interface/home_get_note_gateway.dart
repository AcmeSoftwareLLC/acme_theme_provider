import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
import 'package:example/features/theme/note.dart';
import 'package:example/providers.dart';

class HomeGetNoteGateway extends DbGateway<HomeGetNoteGatewayOutput,
    HomeGetNoteSuccessResponse, HomeGetNoteSuccessInput> {
  HomeGetNoteGateway({
    required super.provider,
  }) : super(context: providersContext);

  @override
  DbRequest buildRequest(HomeGetNoteGatewayOutput output) {
    return HomeGetNoteRequest(noteTitle: output.title);
  }

  @override
  HomeGetNoteSuccessInput onSuccess(
    HomeGetNoteSuccessResponse response,
  ) {
    return HomeGetNoteSuccessInput(note: Note.fromJson(response.note));
  }
}

class HomeGetNoteRequest extends DbRequest {
  HomeGetNoteRequest({required this.noteTitle});

  final String noteTitle;
}

class HomeGetNoteSuccessResponse extends DbSuccessResponse {
  HomeGetNoteSuccessResponse({required this.note});

  final Map<String, dynamic> note;
}

class HomeGetNoteGatewayOutput extends Output {
  HomeGetNoteGatewayOutput({required this.title});

  final String title;

  @override
  List<Object?> get props => [title];
}

class HomeGetNoteSuccessInput extends SuccessInput {
  HomeGetNoteSuccessInput({required this.note});

  final Note note;
}
