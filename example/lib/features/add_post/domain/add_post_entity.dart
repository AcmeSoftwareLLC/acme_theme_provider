import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/tweet.dart';

class AddPostEntity extends Entity {
  final String userName;
  final String post;
  final String imagePath;

  final Map<String, Tweet> tweets;

  AddPostEntity({
    this.userName = '',
    this.post = '',
    this.imagePath = '',
    this.tweets = const {},
  });

  AddPostEntity merge({
    String? userName,
    String? post,
    String? imagePath,
    Map<String, Tweet>? tweets,
  }) {
    return AddPostEntity(
      userName: userName ?? this.userName,
      post: post ?? this.post,
      imagePath: imagePath ?? this.imagePath,
      tweets: tweets ?? this.tweets,
    );
  }

  @override
  List<Object?> get props {
    return [
      userName,
      post,
      imagePath,
      tweets,
    ];
  }
}
