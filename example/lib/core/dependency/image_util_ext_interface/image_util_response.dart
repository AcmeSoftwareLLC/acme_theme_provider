import 'package:clean_framework/clean_framework_legacy.dart';

class ImageUtilSuccessResponse extends SuccessResponse {
  const ImageUtilSuccessResponse(this.path);

  final String? path;
}

abstract class ImageUtilFailureResponse extends FailureResponse {
  const ImageUtilFailureResponse({super.message = ''});
}

class ImageUtilExceptionFailureResponse extends ImageUtilFailureResponse {
  const ImageUtilExceptionFailureResponse({super.message});
}

class NotSupportedImageUtilFailureResponse extends ImageUtilFailureResponse {
  const NotSupportedImageUtilFailureResponse({super.message});
}
