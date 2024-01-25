import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_request.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_success_response.dart';
import 'package:acme_theme_example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:acme_theme_example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:acme_theme_example/features/home/external_interface/home_get_tweet_gateway.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:acme_theme_example/core/database/acme_database.dart';
import 'package:flutter/widgets.dart';

class TweetDbExternalInterface
    extends ExternalInterface<TweetDbRequest, TweetDbSuccessResponse> {
  TweetDbExternalInterface() : db = AcmeDatabase() {
    db.init();
  }

  @protected
  final AcmeDatabase db;

  MapStoreRef get _tweetStore => db.store('tweet_store');

  @override
  void handleRequest() {
    on<HomeGetAllTweetsRequest>(
      (request, send) async {
        final tweets = await db.findAll(store: _tweetStore);
        send(HomeGetAllTweetsSuccessResponse(tweets: tweets));
      },
    );

    on<HomeGetTweetRequest>(
      (request, send) async {
        final tweet =
            await db.findFirst(store: _tweetStore, key: request.userName);
        send(HomeGetTweetSuccessResponse(tweet: tweet!));
      },
    );

    on<AddPostRequest>(
      (request, send) async {
        await db.update(
          store: _tweetStore,
          key: request.tweet.post,
          value: request.tweet.toJson(),
        );
      },
    );
  }

  @override
  FailureResponse onError(Object error) {
    return error as FailureResponse;
  }
}
