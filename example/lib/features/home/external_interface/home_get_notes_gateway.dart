import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
import 'package:example/features/theme/note.dart';
import 'package:example/providers.dart';

class HomeGetNotesGateway extends DbGateway<HomeGetNotesGatewayOutput,
    HomeGetNotesSuccessResponse, HomeGetNotesSuccessInput> {
  HomeGetNotesGateway({
    required super.provider,
  }) : super(context: providersContext);

  @override
  DbRequest buildRequest(HomeGetNotesGatewayOutput output) {
    return HomeGetNotesRequest();
  }

  @override
  HomeGetNotesSuccessInput onSuccess(
    HomeGetNotesSuccessResponse response,
  ) {
    return HomeGetNotesSuccessInput(
      notes: response.notes.map(_getNoteData).toList(growable: false)
    );

  }

  NoteData _getNoteData(Map<String, dynamic> mapData){
    final deserializer = Deserializer(mapData);
    final noteItem = deserializer ('value');
    return NoteData(title: deserializer.getString('key'), content: noteItem.getString('content'), imagePath: noteItem.getString('imagePath'));
  }
}

class HomeGetNotesRequest extends DbRequest {}

class HomeGetNotesSuccessResponse extends DbSuccessResponse {
  HomeGetNotesSuccessResponse({required this.notes});

  final List<Map<String, dynamic>> notes;
}

class HomeGetNotesGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class HomeGetNotesSuccessInput extends SuccessInput {
  HomeGetNotesSuccessInput({required this.notes});

  final List<NoteData> notes;
}

class NoteData {
  final String title;
  final String content;
  final String imagePath;

  const NoteData({required this.title, required this.content, required this.imagePath,});
}
