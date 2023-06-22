import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_entity.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_ui_output.dart';
import 'package:acme_theme_example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:acme_theme_example/features/add_post/external_interface/add_post_image_picker_gateway.dart';
import 'package:acme_theme_example/features/add_post/external_interface/get_random_user_gateway.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:flutter/foundation.dart';

class AddPostUseCase extends UseCase<AddPostEntity> {
  AddPostUseCase()
      : super(
          entity: const AddPostEntity(),
          transformers: [AddPostUIOutputTransformer()],
        );

  void onPostEntered({required String post}) {
    entity = entity.copyWith(post: post);
  }

  Future<void> pickImage() async {
    await request<AddPostPickerGatewaySuccessInput>(
      const AddPostPickerGatewayOutput(),
      onSuccess: (AddPostPickerGatewaySuccessInput input) {
        return entity.copyWith(
          imagePath: input.imagePath,
        );
      },
      onFailure: (failure) => entity,
    );
  }

  Future<void> getRandomUser() async {
    await request<GetRandomUserSuccessInput>(
      const GetRandomUserGatewayOutput(),
      onSuccess: (input) {
        return entity.copyWith(
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
    await request<AddPostSuccessInput>(
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
        return entity.copyWith(
          tweets: tweets,
        );
      },
      onFailure: (e) {
        if (kDebugMode) {
          print('the error is: ${e.message}');
        }
        return entity;
      },
    );
  }

  Future<void> addedTweet() async {
    entity = entity.copyWith(
      tweetAdded: true,
    );
  }

  Future<void> refresh() async {
    entity = const AddPostEntity();
  }
}

class AddPostUIOutputTransformer
    extends OutputTransformer<AddPostEntity, AddPostUIOutput> {
  @override
  AddPostUIOutput transform(AddPostEntity entity) {
    return AddPostUIOutput(
      post: entity.post,
      imagePath: entity.imagePath,
    );
  }
}
