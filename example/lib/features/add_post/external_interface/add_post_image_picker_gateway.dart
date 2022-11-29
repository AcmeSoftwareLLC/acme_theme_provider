import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_gateway.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_response.dart';

import 'package:example/providers.dart';

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
  AddPostPickerGatewayOutput();

  @override
  List<Object?> get props => [];
}

class AddPostPickerGatewaySuccessInput extends SuccessInput {
  AddPostPickerGatewaySuccessInput({required this.imagePath});

  final String? imagePath;
}
