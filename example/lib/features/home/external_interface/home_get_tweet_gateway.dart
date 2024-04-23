import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_gateway.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_request.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_success_response.dart';
import 'package:acme_theme_example/features/home/domain/home_domain_inputs.dart';
import 'package:acme_theme_example/features/home/domain/home_domain_models.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:clean_framework/clean_framework.dart';

class HomeGetTweetGateway extends TweetDbGateway<
    HomeGetTweetDomainToGatewayModel,
    HomeGetTweetRequest,
    HomeGetTweetDomainInput> {
  @override
  HomeGetTweetRequest buildRequest(
      HomeGetTweetDomainToGatewayModel domainModel) {
    return HomeGetTweetRequest(userName: domainModel.userName);
  }

  @override
  HomeGetTweetDomainInput onSuccess(
    HomeGetTweetSuccessResponse response,
  ) {
    return HomeGetTweetDomainInput(tweet: Tweet.fromJson(response.tweet));
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    return FailureDomainInput(message: failureResponse.message);
  }
}

class HomeGetTweetRequest extends TweetDbRequest {
  HomeGetTweetRequest({required this.userName});

  final String userName;
}

class HomeGetTweetSuccessResponse extends TweetDbSuccessResponse {
  HomeGetTweetSuccessResponse({required this.tweet});

  final Map<String, dynamic> tweet;
}
