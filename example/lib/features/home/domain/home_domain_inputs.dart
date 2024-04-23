import 'package:acme_theme_example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:clean_framework/clean_framework.dart';

class HomeGetAllTweetsDomainInput extends SuccessDomainInput {
  const HomeGetAllTweetsDomainInput({required this.tweets});

  final List<TweetData> tweets;
}

class HomeGetTweetDomainInput extends SuccessDomainInput {
  const HomeGetTweetDomainInput({required this.tweet});

  final Tweet tweet;
}
