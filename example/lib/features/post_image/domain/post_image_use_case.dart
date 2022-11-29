import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/post_image/domain/post_image_entity.dart';
import 'package:example/features/post_image/domain/post_image_ui_output.dart';
import 'package:example/features/post_image/external_interface/post_image_gateway.dart';

class PostImageUseCase extends UseCase<PostImageEntity> {
  PostImageUseCase()
      : super(entity: PostImageEntity(), outputFilters: {
          PostImageUIOutput: (PostImageEntity e) {
            print('in here: ${e.imageUrl}');
            return PostImageUIOutput(
              imageUrl: e.imageUrl,
            );
          }
        });

  Future<void> init() async {
    return request<PostImageGatewayOutput, PostImageSuccessInput>(
        PostImageGatewayOutput(),
        onSuccess: (input) => entity.merge(imageUrl: input.imageUrl),
        onFailure: (e) {
          return entity;
        });
  }
}
