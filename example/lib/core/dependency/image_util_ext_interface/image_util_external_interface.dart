import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_response.dart';

class ImageUtilExternalInterface
    extends ExternalInterface<ImageUtilRequest, ImageUtilSuccessResponse> {
  ImageUtilExternalInterface() : _imageUtil = ImageUtil();
  final ImageUtil _imageUtil;

  @override
  void handleRequest() {
    on<ImageCropperRequest>(_withImageCropperRequest);
    on<CameraImagePickerRequest>(_withImagePickerRequest);
    on<GalleryImagePickerRequest>(_withImagePickerRequest);
  }

  Future<void> _withImageCropperRequest(
    ImageCropperRequest request,
    ResponseSender<ImageUtilSuccessResponse> send,
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
    ResponseSender<ImageUtilSuccessResponse> send,
  ) async {
    try {
      final originalImagePath = await _imageUtil.pickImage(
        imagePickerSource: request.imagePickerSource,
        maxWidth: request.maxWidth,
        maxHeight: request.maxHeight,
      );
      final documentDirectory = await getTemporaryDirectory();
      final sandBoxImagePath = join(
        documentDirectory.path,
        '${DateTime.now().millisecondsSinceEpoch}-${basename(originalImagePath!)}',
      );
      await File(originalImagePath).copy(sandBoxImagePath);

      send(
        ImageUtilSuccessResponse(sandBoxImagePath),
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
