import 'package:acme_theme_example/core/dependency/dependency_providers.dart';
import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_failure_response.dart';
import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_request.dart';
import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_success_response.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:dio/dio.dart';

class RandomUserExternalInterface
    extends ExternalInterface<RandomUserRequest, RandomUserSuccessResponse> {
  @override
  void handleRequest() {
    final client = locate(restClientProvider);

    on<GetRandomUserRequest>(
      (request, send) async {
        final response = await client.get<Map<String, dynamic>>(
          request.resource,
          queryParameters: request.queryParams,
        );

        final data = response.data!;

        send(
          RandomUserSuccessResponse(data: data),
        );
      },
    );
  }

  @override
  FailureResponse onError(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.badResponse:
          final response = error.response!;
          return switch (response.statusCode) {
            401 => RandomUserFailureResponse(
                type: RandomUserFailureType.invalidToken,
                message: 'The request was not authorized.',
                errorData: response.data ?? {},
              ),
            _ => RandomUserFailureResponse(
                type: RandomUserFailureType.unknown,
                message: 'An unknown error occurred.',
                errorData: response.data ?? {},
              ),
          };
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return RandomUserFailureResponse(
            type: RandomUserFailureType.unknown,
            message: error.message ?? '',
          );
      }
    }

    return RandomUserFailureResponse(
      type: RandomUserFailureType.unknown,
      message: error.toString(),
    );
  }
}
