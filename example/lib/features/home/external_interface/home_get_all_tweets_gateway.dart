import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
import 'package:example/providers.dart';

class HomeGetAllTweetsGateway extends DbGateway<HomeGetAllTweetsGatewayOutput,
    HomeGetAllTweetsSuccessResponse, HomeGetAllTweetsSuccessInput> {
  HomeGetAllTweetsGateway({
    required super.provider,
  }) : super(context: providersContext);

  @override
  DbRequest buildRequest(HomeGetAllTweetsGatewayOutput output) {
    return HomeGetAllTweetsRequest();
  }

  @override
  HomeGetAllTweetsSuccessInput onSuccess(
    HomeGetAllTweetsSuccessResponse response,
  ) {
    return HomeGetAllTweetsSuccessInput(
      tweets: response.tweets.map(_getTweetData).toList(growable: false),
    );
  }

  TweetData _getTweetData(Map<String, dynamic> mapData) {
    final deserializer = Deserializer(mapData);
    final tweetItem = deserializer('value');
    return TweetData(
      userName: deserializer.getString('key'),
      post: tweetItem.getString('post'),
      imagePath: tweetItem.getString('imagePath'),
    );
  }
}

class HomeGetAllTweetsRequest extends DbRequest {}

class HomeGetAllTweetsSuccessResponse extends DbSuccessResponse {
  HomeGetAllTweetsSuccessResponse({required this.tweets});

  final List<Map<String, dynamic>> tweets;
}

class HomeGetAllTweetsGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class HomeGetAllTweetsSuccessInput extends SuccessInput {
  HomeGetAllTweetsSuccessInput({required this.tweets});

  final List<TweetData> tweets;
}

class TweetData {
  final String userName;
  final String post;
  final String imagePath;

  const TweetData({
    required this.userName,
    required this.post,
    required this.imagePath,
  });
}
