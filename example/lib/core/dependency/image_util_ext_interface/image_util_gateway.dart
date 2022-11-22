import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_response.dart';

abstract class ImageUtilGateway<O extends Output, R extends ImageUtilRequest,
    S extends SuccessInput> extends Gateway<O, R, ImageUtilSuccessResponse, S> {
  ImageUtilGateway({
    required ProvidersContext context,
    required UseCaseProvider provider,
  }) : super(
          context: context,
          provider: provider,
        );
}
