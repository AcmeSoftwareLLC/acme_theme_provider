import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_response.dart';

class ImageUtilExternalInterface
    extends ExternalInterface<ImageUtilRequest, SuccessResponse> {
  ImageUtilExternalInterface({
    required List<GatewayConnection<Gateway>> gatewayConnections,
    ImageUtil? imageUtil,
  })  : _imageUtil = imageUtil ?? ImageUtil(),
        super(gatewayConnections);
  final ImageUtil _imageUtil;

  @override
  void handleRequest() {
    on<ImageCropperRequest>(_withImageCropperRequest);
    on<CameraImagePickerRequest>(_withImagePickerRequest);
    on<GalleryImagePickerRequest>(_withImagePickerRequest);
  }

  Future<void> _withImageCropperRequest(
    ImageCropperRequest request,
    ResponseSender send,
  ) async {
    try {
      send(
        ImageUtilSuccessResponse(
          await _imageUtil.cropImageInSquare(
            request.imagePath,
          ),
        ),
      );
    } on ImageUtilException catch (e) {
      sendError(
        ImageUtilExceptionFailureResponse(message: e.message),
      );
    }
  }

  Future<void> _withImagePickerRequest(
    ImagePickerRequest request,
    ResponseSender send,
  ) async {
    try {
      send(
        ImageUtilSuccessResponse(
          await _imageUtil.pickImage(
            imagePickerSource: request.imagePickerSource,
            maxWidth: request.maxWidth,
            maxHeight: request.maxHeight,
          ),
        ),
      );
    } on ImageUtilException catch (e) {
      sendError(ImageUtilExceptionFailureResponse(message: e.message));
    }
  }

  @override
  FailureResponse onError(Object error) {
    return error as FailureResponse;
  }
}
