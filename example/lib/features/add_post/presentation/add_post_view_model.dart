import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class AddPostViewModel extends ViewModel {
  const AddPostViewModel({
    required this.userName,
    required this.imagePath,
    required this.tweets,
    required this.getRandomUser,
    required this.addTweet,
    required this.enterUserName,
    required this.openGallery,
    required this.refresh,
  });

  final String userName;

  final String imagePath;
  final List<AddPostList> tweets;
  final VoidCallback getRandomUser;
  final VoidCallback addTweet;
  final VoidCallback openGallery;
  final ValueChanged<String> enterUserName;

  final VoidCallback refresh;

  @override
  List<Object?> get props {
    return [
      userName,
      imagePath,
      tweets,
    ];
  }
}

class AddPostList extends ViewModel {
  AddPostList({
    required this.userName,
    required this.imagePath,
  });

  final String userName;

  final String imagePath;

  @override
  List<Object?> get props => [
        userName,
        imagePath,
      ];
}
