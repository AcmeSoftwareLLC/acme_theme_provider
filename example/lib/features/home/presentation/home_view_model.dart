import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ViewModel {
  final List<Tweet> tweets;
  final ValueChanged<String> onTweetSelected;
  final bool isLoading;

  const HomeViewModel({
    required this.tweets,
    required this.onTweetSelected,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [
        tweets,
        isLoading,
      ];
}
