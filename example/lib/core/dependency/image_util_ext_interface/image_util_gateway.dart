import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_request.dart';
import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_response.dart';
import 'package:clean_framework/clean_framework.dart';

abstract class ImageUtilGateway<O extends DomainModel,
        R extends ImageUtilRequest, S extends SuccessDomainInput>
    extends Gateway<O, R, ImageUtilSuccessResponse, S> {}
