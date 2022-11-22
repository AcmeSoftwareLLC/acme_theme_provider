import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_gateway.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_response.dart';

import 'package:example/providers.dart';

class NoteImagePickerGateway extends ImageUtilGateway<
    NoteImagePickerGatewayOutput,
    ImagePickerRequest,
    NoteImagePickerGatewaySuccessInput> {
  NoteImagePickerGateway({
    ProvidersContext? context,
    UseCaseProvider? provider,
  }) : super(
          context: context ?? providersContext,
          provider: provider ?? noteUseCaseProvider,
        );

  @override
  ImagePickerRequest buildRequest(
    NoteImagePickerGatewayOutput output,
  ) {
    return NoteCameraImagePickerRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: failureResponse.message);
  }

  @override
  NoteImagePickerGatewaySuccessInput onSuccess(
    covariant ImageUtilSuccessResponse response,
  ) {
    return NoteImagePickerGatewaySuccessInput(imagePath: response.path);
  }
}

class NoteCameraImagePickerRequest extends CameraImagePickerRequest {
  NoteCameraImagePickerRequest()
      : super(
          maxHeight: 1000,
          maxWidth: 1000,
        );
}

class NoteImagePickerGatewayOutput extends Output {
  NoteImagePickerGatewayOutput();

  @override
  List<Object?> get props => [];
}

class NoteImagePickerGatewaySuccessInput extends SuccessInput {
  NoteImagePickerGatewaySuccessInput({required this.imagePath});
  final String? imagePath;
}
