import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/add_post/domain/add_post_entity.dart';
import 'package:example/features/add_post/domain/add_post_ui_output.dart';
import 'package:example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:example/features/add_post/external_interface/add_post_image_picker_gateway.dart';
import 'package:example/features/theme/tweet.dart';

class AddPostUseCase extends UseCase<AddPostEntity> {
  AddPostUseCase()
      : super(
          entity: AddPostEntity(),
          outputFilters: {
            AddPostUIOutput: (AddPostEntity entity) {
              final noteListOutput = entity.tweets.values
                  .map(
                    (note) => AddPostOutput(
                      userName: note.userName,
                      post: note.post,
                      imagePath: note.imagePath,
                    ),
                  )
                  .toList();
              return AddPostUIOutput(
                userName: entity.userName,
                post: entity.post,
                imagePath: entity.imagePath,
                tweets: noteListOutput,
              );
            },
          },
        );

  void onUserNameEntered({required String userName}) {
    entity = entity.merge(userName: userName);
  }

  void onPostEntered({required String post}) {
    entity = entity.merge(post: post);
  }

  Future<void> pickImage() async {
    await request<AddPostPickerGatewayOutput, AddPostPickerGatewaySuccessInput>(
      AddPostPickerGatewayOutput(),
      onSuccess: (AddPostPickerGatewaySuccessInput input) {
        return entity.merge(
          imagePath: input.imagePath,
        );
      },
      onFailure: (failure) => entity,
    );
  }

  Future<void> addPost() async {
    await request<AddPostGatewayOutput, AddPostSuccessInput>(
      AddPostGatewayOutput(
        tweet: Tweet(
          userName: entity.userName,
          post: entity.post,
          imagePath: entity.imagePath,
        ),
      ),
      onSuccess: (input) {
        final notes = <String, Tweet>{};
        for (final note in input.tweets) {
          notes[note.userName] = Tweet(
            userName: note.userName,
            post: note.post,
            imagePath: note.imagePath,
          );
        }
        return entity.merge(
          tweets: notes,
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
    await refresh();
  }

  Future<void> refresh() async {
    entity = AddPostEntity();
  }
}
