import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
import 'package:example/providers.dart';

class HomeGetAllNotesGateway extends DbGateway<HomeGetAllNotesGatewayOutput,
    HomeGetAllNotesSuccessResponse, HomeGetAllNotesSuccessInput> {
  HomeGetAllNotesGateway({
    required super.provider,
  }) : super(context: providersContext);

  @override
  DbRequest buildRequest(HomeGetAllNotesGatewayOutput output) {
    return HomeGetAllNotesRequest();
  }

  @override
  HomeGetAllNotesSuccessInput onSuccess(
    HomeGetAllNotesSuccessResponse response,
  ) {
    return HomeGetAllNotesSuccessInput(
      notes: response.notes.map(_getNoteData).toList(growable: false)
    );

  }

  NoteData _getNoteData(Map<String, dynamic> mapData){
    final deserializer = Deserializer(mapData);
    final noteItem = deserializer ('value');
    return NoteData(title: deserializer.getString('key'), content: noteItem.getString('content'), imagePath: noteItem.getString('imagePath'));
  }
}

class HomeGetAllNotesRequest extends DbRequest {}

class HomeGetAllNotesSuccessResponse extends DbSuccessResponse {
  HomeGetAllNotesSuccessResponse({required this.notes});

  final List<Map<String, dynamic>> notes;
}

class HomeGetAllNotesGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class HomeGetAllNotesSuccessInput extends SuccessInput {
  HomeGetAllNotesSuccessInput({required this.notes});

  final List<NoteData> notes;
}

class NoteData {
  final String title;
  final String content;
  final String imagePath;

  const NoteData({required this.title, required this.content, required this.imagePath,});
}
