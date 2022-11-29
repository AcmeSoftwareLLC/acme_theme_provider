import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/acme_database.dart';
import 'package:example/core/database/db_external_interface.dart';
import 'package:example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:example/features/home/external_interface/home_get_tweet_gateway.dart';
import 'package:example/features/add_post/external_interface/add_post_gateway.dart';

class HomeTweetsStoreExternalInterface extends DbExternalInterface {
  HomeTweetsStoreExternalInterface({required super.gatewayConnections});

  MapStoreRef get _tweetStore => db.store('tweet_store');

  @override
  void handleRequest() {
    on<HomeGetAllTweetsRequest>((request, send) async {
      final tweets = await db.findAll(store: _tweetStore);
      send(HomeGetAllTweetsSuccessResponse(tweets: tweets));
    });

    on<HomeGetTweetRequest>((request, send) async {
      final tweet =
          await db.findFirst(store: _tweetStore, key: request.userName);
      send(HomeGetTweetSuccessResponse(tweet: tweet!));
    });

    on<AddPostRequest>((request, send) async {
      print(request.tweet.post);
      await db.update(
        store: _tweetStore,
        key: request.tweet.userName,
        value: request.tweet.toJson(),
      );
    });
  }

  @override
  FailureResponse onError(Object error) {
    // TODO: implement onError
    throw UnimplementedError();
  }
}
