import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_picker_source.dart';

class ImageUtil {
  ImageUtil({
    ImagePicker? imagePicker,
    ThemeProviderImageCropper? walletImageCropper,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _themeProviderImageCropper =
            walletImageCropper ?? ThemeProviderImageCropper();

  final ImagePicker _imagePicker;
  final ThemeProviderImageCropper _themeProviderImageCropper;

  Future<String?> pickImage({
    required ImagePickerSource imagePickerSource,
    double? maxHeight,
    double? maxWidth,
  }) async {
    try {
      final image = await _imagePicker.pickImage(
        source: imagePickerSource == ImagePickerSource.camera
            ? ImageSource.camera
            : ImageSource.gallery,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
      return image?.path;
    } catch (e) {
      throw ImageUtilException(e.toString());
    }
  }

  Future<String?> cropImageInSquare(String imagePath) async {
    try {
      final croppedFilePath = await _themeProviderImageCropper.cropImage(
        imagePath: imagePath,
      );

      return croppedFilePath;
    } catch (e) {
      throw ImageUtilException(e.toString());
    }
  }
}

class ImageUtilException implements Exception {
  ImageUtilException(this.message);

  final String message;

  @override
  String toString() => 'ImageUtilException: $message';
}

class ThemeProviderImageCropper {
  ThemeProviderImageCropper() : _cropper = ImageCropper();

  final ImageCropper _cropper;

  Future<String?> cropImage({required String imagePath}) async {
    final file = await _cropper.cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(lockAspectRatio: true),
        IOSUiSettings(minimumAspectRatio: 1),
      ],
    );

    return file?.path;
  }
}
