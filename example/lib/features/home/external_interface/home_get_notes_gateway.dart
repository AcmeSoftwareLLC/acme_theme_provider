import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
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
    return HomeGetNotesSuccessInput(noteTitles: response.noteTitles);
  }
}

class HomeGetNotesRequest extends DbRequest {}

class HomeGetNotesSuccessResponse extends DbSuccessResponse {
  HomeGetNotesSuccessResponse({required this.noteTitles});

  final List<String> noteTitles;
}

class HomeGetNotesGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class HomeGetNotesSuccessInput extends SuccessInput {
  HomeGetNotesSuccessInput({required this.noteTitles});

  final List<String> noteTitles;
}
