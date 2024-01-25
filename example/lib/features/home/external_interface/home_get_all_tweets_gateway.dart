import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_gateway.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_request.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_success_response.dart';
import 'package:acme_theme_example/features/home/domain/home_domain_inputs.dart';
import 'package:acme_theme_example/features/home/domain/home_domain_models.dart';
import 'package:clean_framework/clean_framework.dart';

class HomeGetAllTweetsGateway extends TweetDbGateway<
    HomeGetAllTweetsDomainToGatewayModel,
    HomeGetAllTweetsRequest,
    HomeGetAllTweetsDomainInput> {
  @override
  HomeGetAllTweetsRequest buildRequest(
      HomeGetAllTweetsDomainToGatewayModel domainModel) {
    return HomeGetAllTweetsRequest();
  }

  @override
  HomeGetAllTweetsDomainInput onSuccess(
    HomeGetAllTweetsSuccessResponse response,
  ) {
    return HomeGetAllTweetsDomainInput(
      tweets: response.tweets.map(_getTweetData).toList(growable: false),
    );
  }

  TweetData _getTweetData(Map<String, dynamic> mapData) {
    final deserializer = Deserializer(mapData);
    final tweetItem = deserializer('value');
    return TweetData(
      userName: deserializer.getString('key'),
      imagePath: tweetItem.getString('imagePath'),
      firstName: tweetItem.getString('firstName'),
      lastName: tweetItem.getString('lastName'),
      emailId: tweetItem.getString('userName'),
      userImage: tweetItem.getString('userImage'),
    );
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    return FailureDomainInput(message: failureResponse.message);
  }
}

class HomeGetAllTweetsRequest extends TweetDbRequest {}

class HomeGetAllTweetsSuccessResponse extends TweetDbSuccessResponse {
  HomeGetAllTweetsSuccessResponse({required this.tweets});

  final List<Map<String, dynamic>> tweets;
}

class TweetData {
  final String userName;
  final String firstName;
  final String lastName;
  final String emailId;
  final String userImage;
  final String imagePath;

  const TweetData({
    required this.userName,
    required this.imagePath,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.userImage,
  });
}
