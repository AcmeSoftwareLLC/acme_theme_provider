import 'package:clean_framework/clean_framework_providers.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_picker_source.dart';

abstract class ImageUtilRequest extends Request {}

abstract class ImageCropperRequest extends ImageUtilRequest {
  ImageCropperRequest({
    required this.imagePath,
  });

  final String imagePath;
}

abstract class ImagePickerRequest extends ImageUtilRequest {
  ImagePickerRequest({
    required this.imagePickerSource,
    this.maxHeight,
    this.maxWidth,
  });

  final ImagePickerSource imagePickerSource;
  final double? maxHeight;
  final double? maxWidth;
}

abstract class CameraImagePickerRequest extends ImagePickerRequest {
  CameraImagePickerRequest({
    super.maxHeight,
    super.maxWidth,
  }) : super(imagePickerSource: ImagePickerSource.camera);
}

abstract class GalleryImagePickerRequest extends ImagePickerRequest {
  GalleryImagePickerRequest({
    super.maxHeight,
    super.maxWidth,
  }) : super(imagePickerSource: ImagePickerSource.gallery);
}
