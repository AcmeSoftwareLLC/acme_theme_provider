import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_failure_response.dart';
import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_request.dart';
import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_success_response.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_domain_inputs.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_domain_models.dart';
import 'package:clean_framework/clean_framework.dart';

class GetRandomUserGateway extends Gateway<
    GetRandomUserDomainToGatewayModel,
    RandomUserGatewayRequest,
    RandomUserSuccessResponse,
    GetRandomUserSuccessDomainInput> {
  @override
  RandomUserGatewayRequest buildRequest(
    GetRandomUserDomainToGatewayModel domainModel,
  ) {
    return RandomUserGatewayRequest();
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    if (failureResponse is RandomUserFailureResponse) {
      if (failureResponse.type == RandomUserFailureType.invalidToken) {
        return InvalidTokenFailureDomainInput();
      }
      return FailureDomainInput(
        message: failureResponse.errorData.toString(),
      );
    }
    return FailureDomainInput(message: failureResponse.message);
  }

  @override
  GetRandomUserSuccessDomainInput onSuccess(
    RandomUserSuccessResponse response,
  ) {
    final deserializer = Deserializer(response.data);
    final results = deserializer.getList('results', converter: (v) => v).first;
    final name = results.deserialize('name');
    final picture = results.deserialize('picture');
    final login = results.deserialize('login');
    return GetRandomUserSuccessDomainInput(
      firstName: name.getString('first'),
      lastName: name.getString('last'),
      userName: login.getString('username'),
      userImage: picture.getString('large'),
    );
  }
}

class RandomUserGatewayRequest extends GetRandomUserRequest {
  @override
  String get resource => '?nat=us&randomapi';
}
