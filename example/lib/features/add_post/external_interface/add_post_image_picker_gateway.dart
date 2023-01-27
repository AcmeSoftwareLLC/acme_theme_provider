import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_gateway.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_response.dart';

import 'package:acme_theme_example/providers.dart';

class AddPostPickerGateway extends ImageUtilGateway<AddPostPickerGatewayOutput,
    ImagePickerRequest, AddPostPickerGatewaySuccessInput> {
  AddPostPickerGateway({
    ProvidersContext? context,
    UseCaseProvider? provider,
  }) : super(
          context: context ?? providersContext,
          provider: provider ?? addPostUseCaseProvider,
        );

  @override
  ImagePickerRequest buildRequest(
    AddPostPickerGatewayOutput output,
  ) {
    return AddPostImagePickerRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }

  @override
  AddPostPickerGatewaySuccessInput onSuccess(
    covariant ImageUtilSuccessResponse response,
  ) {
    return AddPostPickerGatewaySuccessInput(imagePath: response.path);
  }
}

class AddPostImagePickerRequest extends GalleryImagePickerRequest {
  AddPostImagePickerRequest()
      : super(
          maxHeight: 1000,
          maxWidth: 1000,
        );
}

class AddPostPickerGatewayOutput extends Output {
  const AddPostPickerGatewayOutput();

  @override
  List<Object?> get props => [];
}

class AddPostPickerGatewaySuccessInput extends SuccessInput {
  const AddPostPickerGatewaySuccessInput({
    required this.imagePath,
  });

  final String? imagePath;
}
