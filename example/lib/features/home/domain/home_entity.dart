import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';

class HomeEntity extends Entity {
  final List<Tweet> tweets;
  final String userName;
  final bool isLoading;

  const HomeEntity({
    this.tweets = const [],
    this.userName = '',
    this.isLoading = true,
  });

  @override
  HomeEntity copyWith({
    List<Tweet>? tweets,
    String? userName,
    bool? isLoading,
  }) {
    return HomeEntity(
      tweets: tweets ?? this.tweets,
      userName: userName ?? this.userName,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        tweets,
        userName,
        isLoading,
      ];
}
