import 'package:clean_framework/clean_framework_providers.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';

class HomeUIOutput extends Output {
  final List<Tweet> tweets;
  final bool isLoading;

  HomeUIOutput({
    required this.tweets,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [
        tweets,
        isLoading,
      ];
}
