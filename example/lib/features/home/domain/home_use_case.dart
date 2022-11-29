import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/domain/home_entity.dart';
import 'package:example/features/home/domain/home_ui_output.dart';
import 'package:example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:example/features/home/external_interface/home_get_tweet_gateway.dart';
import 'package:example/features/theme/tweet.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: HomeEntity(),
          outputFilters: {
            HomeUIOutput: (HomeEntity entity) {
              return HomeUIOutput(
                tweets: entity.tweets,
                isLoading: entity.isLoading,
              );
            },
          },
        );

  Future<void> init({bool isReset = false}) async {
    await request<HomeGetAllTweetsGatewayOutput, HomeGetAllTweetsSuccessInput>(
      HomeGetAllTweetsGatewayOutput(),
      onSuccess: (input) {
        return entity.copyWith(
          tweets: [
            for (var tweetData in input.tweets)
              Tweet(
                userName: tweetData.userName,
                imagePath: tweetData.imagePath,
              )
          ],
          isLoading: false,
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
  }

  Future<void> getSelectedTweet(String title) async {
    await request<HomeGetTweetGatewayOutput, HomeGetTweetSuccessInput>(
        HomeGetTweetGatewayOutput(userName: title), onSuccess: (input) {
      return entity.copyWith(
        userName: input.tweet.userName,
      );
    }, onFailure: (e) {
      return entity;
    });
  }
}
