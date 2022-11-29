import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/add_post/external_interface/get_random_user_gateway.dart';
import 'package:example/features/theme/tweet.dart';

class AddPostEntity extends Entity {
  final String userName;

  final String imagePath;
  final Map<String, RandomUsers> randomUsers;
  final Map<String, Tweet> tweets;

  AddPostEntity({
    this.userName = '',
    this.imagePath = '',
    this.tweets = const {},
    this.randomUsers = const {},
  });

  AddPostEntity merge({
    String? userName,
    String? imagePath,
    Map<String, Tweet>? tweets,
    Map<String, RandomUsers>? randomUsers,
  }) {
    return AddPostEntity(
      userName: userName ?? this.userName,
      imagePath: imagePath ?? this.imagePath,
      tweets: tweets ?? this.tweets,
      randomUsers: randomUsers ?? this.randomUsers,
    );
  }

  @override
  List<Object?> get props {
    return [
      userName,
      imagePath,
      tweets,
      randomUsers,
    ];
  }
}
