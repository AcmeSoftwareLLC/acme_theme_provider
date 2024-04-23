import 'package:acme_theme_example/features/home/domain/home_domain_inputs.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:acme_theme_example/features/home/domain/home_entity.dart';
import 'package:acme_theme_example/features/home/domain/home_domain_models.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:flutter/foundation.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: const HomeEntity(),
          transformers: [
            HomeDomainToUIModelTransformer(),
          ],
        );

  Future<void> init({
    bool isReset = false,
  }) async {
    await request<HomeGetAllTweetsDomainInput>(
      HomeGetAllTweetsDomainToGatewayModel(),
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
    await request<HomeGetTweetDomainInput>(
        HomeGetTweetDomainToGatewayModel(userName: title), onSuccess: (input) {
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

class HomeDomainToUIModelTransformer
    extends DomainModelTransformer<HomeEntity, HomeDomainToUIModel> {
  @override
  HomeDomainToUIModel transform(HomeEntity entity) {
    return HomeDomainToUIModel(
      tweets: entity.tweets,
      isLoading: entity.isLoading,
    );
  }
}

class HomeGetAllTweetsDomainInputTransformer
    extends DomainInputTransformer<HomeEntity, HomeGetAllTweetsDomainInput> {
  @override
  HomeEntity transform(HomeEntity entity, HomeGetAllTweetsDomainInput input) {
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
  }
}
