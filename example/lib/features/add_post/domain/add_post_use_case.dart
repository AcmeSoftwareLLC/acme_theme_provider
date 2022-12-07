import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/add_post/domain/add_post_entity.dart';
import 'package:example/features/add_post/domain/add_post_ui_output.dart';
import 'package:example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:example/features/add_post/external_interface/add_post_image_picker_gateway.dart';
import 'package:example/features/add_post/external_interface/get_random_user_gateway.dart';
import 'package:example/features/theme/tweet.dart';

class AddPostUseCase extends UseCase<AddPostEntity> {
  AddPostUseCase()
      : super(
          entity: AddPostEntity(),
          outputFilters: {
            AddPostUIOutput: (AddPostEntity entity) {
              return AddPostUIOutput(
                post: entity.post,
                imagePath: entity.imagePath,
              );
            },
          },
        );

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

  Future<void> getRandomUser() async {
    await request<GetRandomUserGatewayOutput, GetRandomUserSuccessInput>(
      GetRandomUserGatewayOutput(),
      onSuccess: (input) {
        return entity.merge(
          firstName: input.firstName,
          lastName: input.lastName,
          userName: input.userName,
          userImage: input.userImage,
        );
      },
      onFailure: (failure) {
        return entity;
      },
    );
  }

  Future<void> addTweet() async {
    await request<AddPostGatewayOutput, AddPostSuccessInput>(
      AddPostGatewayOutput(
        tweet: Tweet(
          post: entity.post,
          imagePath: entity.imagePath,
          firstName: entity.firstName,
          lastName: entity.lastName,
          userName: entity.userName,
          userImage: entity.userImage,
        ),
      ),
      onSuccess: (input) {
        final tweets = <String, Tweet>{};
        for (final tweet in input.tweets) {
          tweets[tweet.post] = Tweet(
            post: tweet.post,
            imagePath: tweet.imagePath,
            firstName: tweet.firstName,
            lastName: tweet.lastName,
            userName: tweet.userName,
            userImage: tweet.imagePath,
          );
        }

        return entity.merge(
          tweets: tweets,
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
    await refresh();
  }

  Future<void> addedTweet() async {
    entity = entity.merge(
      tweetAdded: true,
    );
  }

  Future<void> refresh() async {
    entity = AddPostEntity();
  }
}
