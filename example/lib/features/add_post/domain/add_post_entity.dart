import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';

class AddPostEntity extends Entity {
  final String post;
  final String firstName;
  final String lastName;
  final String userName;
  final String userImage;
  final String imagePath;
  final Map<String, Tweet> tweets;

  const AddPostEntity({
    this.post = '',
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.userImage = '',
    this.imagePath = '',
    this.tweets = const {},
  });

  @override
  AddPostEntity copyWith({
    String? post,
    String? firstName,
    String? lastName,
    String? userName,
    String? userImage,
    String? imagePath,
    bool? tweetAdded,
    Map<String, Tweet>? tweets,
  }) {
    return AddPostEntity(
      post: post ?? this.post,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      imagePath: imagePath ?? this.imagePath,
      tweets: tweets ?? this.tweets,
    );
  }

  @override
  List<Object?> get props {
    return [
      post,
      firstName,
      lastName,
      userName,
      userImage,
      imagePath,
      tweets,
    ];
  }
}
