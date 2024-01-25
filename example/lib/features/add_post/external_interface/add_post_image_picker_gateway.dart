import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_gateway.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_response.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_domain_inputs.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_domain_models.dart';

import 'package:clean_framework/clean_framework.dart';

class AddPostPickerGateway extends ImageUtilGateway<
    AddPostPickerDomainToGatewayModel,
    ImagePickerRequest,
    AddPostPickerGatewaySuccessDomainInput> {
  @override
  ImagePickerRequest buildRequest(
    AddPostPickerDomainToGatewayModel domainModel,
  ) {
    return AddPostImagePickerRequest();
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    return FailureDomainInput(message: failureResponse.message);
  }

  @override
  AddPostPickerGatewaySuccessDomainInput onSuccess(
    covariant ImageUtilSuccessResponse response,
  ) {
    return AddPostPickerGatewaySuccessDomainInput(imagePath: response.path);
  }
}

class AddPostImagePickerRequest extends GalleryImagePickerRequest {
  AddPostImagePickerRequest()
      : super(
          maxHeight: 1000,
          maxWidth: 1000,
        );
}
