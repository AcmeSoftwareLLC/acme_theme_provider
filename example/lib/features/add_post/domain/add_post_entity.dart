import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/theme/tweet.dart';

class AddPostEntity extends Entity {
  final String post;
  final String firstName;
  final String lastName;
  final String userName;
  final String userImage;
  final String imagePath;
  final bool showLoading;
  final Map<String, Tweet> tweets;

  AddPostEntity({
    this.post = '',
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.userImage = '',
    this.imagePath = '',
    this.showLoading = false,
    this.tweets = const {},
  });

  AddPostEntity merge({
    String? post,
    String? firstName,
    String? lastName,
    String? userName,
    String? userImage,
    String? imagePath,
    bool? showLoading,
    Map<String, Tweet>? tweets,
  }) {
    return AddPostEntity(
      post: post ?? this.post,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      imagePath: imagePath ?? this.imagePath,
      showLoading: showLoading ?? this.showLoading,
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
      showLoading,
      tweets,
    ];
  }
}
