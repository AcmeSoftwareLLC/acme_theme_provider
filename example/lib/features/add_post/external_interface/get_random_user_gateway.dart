import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_rest/clean_framework_rest.dart';
import 'package:example/providers.dart';

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

    return GetRandomUserSuccessInput(
      randomUsers: deserializer.getList(
        'results',
        converter: (map) {
          final deserializer = Deserializer(map);
          final name = deserializer('name');
          final picture = deserializer('picture');

          return RandomUsers(
            firstName: name.getString('first'),
            lastName: name.getString('last'),
            userEmail: deserializer.getString('email'),
            userImage: picture.getString('large'),
          );
        },
      ),
    );
  }
}

class GetRandomUserGatewayOutput extends Output {
  GetRandomUserGatewayOutput();

  @override
  List<Object?> get props => [];
}

class GetRandomUserSuccessInput extends SuccessInput {
  GetRandomUserSuccessInput({required this.randomUsers});

  final List<RandomUsers> randomUsers;
}

class RandomUserGatewayRequest extends GetRestRequest {
  const RandomUserGatewayRequest();

  @override
  String get path => '?nat=us&randomapi';
}

class RandomUsers {
  const RandomUsers({
    required this.firstName,
    required this.lastName,
    required this.userImage,
    required this.userEmail,
  });

  final String firstName;
  final String lastName;
  final String userImage;
  final String userEmail;
}

class InvalidTokenFailureInput extends FailureInput {}
