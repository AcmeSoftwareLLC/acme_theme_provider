import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:clean_framework_rest/clean_framework_rest_legacy.dart';
import 'package:acme_theme_example/providers.dart';

class GetRandomUserGateway extends RestGateway<GetRandomUserGatewayOutput,
    RandomUserGatewayRequest, GetRandomUserSuccessInput> {
  GetRandomUserGateway({
    ProvidersContext? context,
    UseCaseProvider? provider,
  }) : super(
          context: context ?? providersContext,
          provider: provider ?? addPostUseCaseProvider,
        );

  @override
  RandomUserGatewayRequest buildRequest(
    GetRandomUserGatewayOutput output,
  ) {
    return const RandomUserGatewayRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    if (failureResponse is HttpFailureResponse) {
      if (failureResponse.statusCode == 401) return InvalidTokenFailureInput();
      return FailureInput(message: failureResponse.error.toString());
    }
    return FailureInput(message: failureResponse.message);
  }

  @override
  GetRandomUserSuccessInput onSuccess(
    RestSuccessResponse response,
  ) {
    final deserializer = Deserializer(response.data);
    final results = deserializer.getList('results', converter: (v) => v).first;
    final name = results.deserialize('name');
    final picture = results.deserialize('picture');
    final login = results.deserialize('login');
    return GetRandomUserSuccessInput(
      firstName: name.getString('first'),
      lastName: name.getString('last'),
      userName: login.getString('username'),
      userImage: picture.getString('large'),
    );
  }
}

class GetRandomUserGatewayOutput extends Output {
  const GetRandomUserGatewayOutput();

  @override
  List<Object?> get props => [];
}

class GetRandomUserSuccessInput extends SuccessInput {
  const GetRandomUserSuccessInput({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userImage,
  });

  final String firstName;
  final String lastName;
  final String userName;
  final String userImage;
}

class RandomUserGatewayRequest extends GetRestRequest {
  const RandomUserGatewayRequest();

  @override
  String get path => '?nat=us&randomapi';
}

class InvalidTokenFailureInput extends FailureInput {}
