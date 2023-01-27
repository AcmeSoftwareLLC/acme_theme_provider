import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/core/database/db_gateway.dart';
import 'package:acme_theme_example/core/database/db_request.dart';
import 'package:acme_theme_example/core/database/db_success_response.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:acme_theme_example/providers.dart';

class HomeGetTweetGateway extends DbGateway<HomeGetTweetGatewayOutput,
    HomeGetTweetSuccessResponse, HomeGetTweetSuccessInput> {
  HomeGetTweetGateway({
    required super.provider,
  }) : super(context: providersContext);

  @override
  DbRequest buildRequest(HomeGetTweetGatewayOutput output) {
    return HomeGetTweetRequest(userName: output.userName);
  }

  @override
  HomeGetTweetSuccessInput onSuccess(
    HomeGetTweetSuccessResponse response,
  ) {
    return HomeGetTweetSuccessInput(tweet: Tweet.fromJson(response.tweet));
  }
}

class HomeGetTweetRequest extends DbRequest {
  HomeGetTweetRequest({required this.userName});

  final String userName;
}

class HomeGetTweetSuccessResponse extends DbSuccessResponse {
  HomeGetTweetSuccessResponse({required this.tweet});

  final Map<String, dynamic> tweet;
}

class HomeGetTweetGatewayOutput extends Output {
  const HomeGetTweetGatewayOutput({required this.userName});

  final String userName;

  @override
  List<Object?> get props => [userName];
}

class HomeGetTweetSuccessInput extends SuccessInput {
  const HomeGetTweetSuccessInput({required this.tweet});

  final Tweet tweet;
}
