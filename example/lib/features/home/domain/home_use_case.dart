import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/home/domain/home_entity.dart';
import 'package:acme_theme_example/features/home/domain/home_ui_output.dart';
import 'package:acme_theme_example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:acme_theme_example/features/home/external_interface/home_get_tweet_gateway.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:flutter/foundation.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: const HomeEntity(),
          transformers: [HomeUIOutputTransformer()],
        );

  Future<void> init({bool isReset = false}) async {
    await request<HomeGetAllTweetsSuccessInput>(
      HomeGetAllTweetsGatewayOutput(),
      onSuccess: (input) {
        return entity.copyWith(
          tweets: [
            for (var tweetData in input.tweets)
              Tweet(
                post: tweetData.userName,
                imagePath: tweetData.imagePath,
                firstName: tweetData.firstName,
                lastName: tweetData.lastName,
                userName: tweetData.emailId,
                userImage: tweetData.userImage,
              )
          ],
          isLoading: false,
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

  Future<void> getSelectedTweet(String title) async {
    await request<HomeGetTweetSuccessInput>(
        HomeGetTweetGatewayOutput(userName: title), onSuccess: (input) {
      return entity.copyWith(
        userName: input.tweet.post,
      );
    }, onFailure: (e) {
      return entity;
    });
  }

  Future<void> refresh() async {
    entity = const HomeEntity();
  }
}

class HomeUIOutputTransformer
    extends OutputTransformer<HomeEntity, HomeUIOutput> {
  @override
  HomeUIOutput transform(HomeEntity entity) {
    return HomeUIOutput(
      tweets: entity.tweets,
      isLoading: entity.isLoading,
    );
  }
}
