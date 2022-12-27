import 'package:clean_framework/clean_framework_providers.dart';
import 'package:acme_theme_example/core/database/db_request.dart';
import 'package:acme_theme_example/core/database/db_success_response.dart';

abstract class DbGateway<O extends Output, R extends DbSuccessResponse,
    S extends SuccessInput> extends Gateway<O, DbRequest, R, S> {
  DbGateway({
    super.context,
    super.provider,
    super.useCase,
  });

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }
}
