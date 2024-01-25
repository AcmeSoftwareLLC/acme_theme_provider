import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';

class HomeDomainToUIModel extends DomainModel {
  final List<Tweet> tweets;
  final bool isLoading;

  const HomeDomainToUIModel({
    required this.tweets,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [
        tweets,
        isLoading,
      ];
}

class HomeGetAllTweetsDomainToGatewayModel extends DomainModel {
  @override
  List<Object?> get props => [];
}

class HomeGetTweetDomainToGatewayModel extends DomainModel {
  const HomeGetTweetDomainToGatewayModel({required this.userName});

  final String userName;

  @override
  List<Object?> get props => [userName];
}
