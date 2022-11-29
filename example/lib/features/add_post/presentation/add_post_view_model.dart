import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class AddPostViewModel extends ViewModel {
  const AddPostViewModel({
    required this.userName,
    required this.post,
    required this.imagePath,
    required this.tweets,
    required this.addPost,
    required this.enterUserName,
    required this.enterPost,
    required this.openGallery,
    required this.refresh,
  });

  final String userName;
  final String post;
  final String imagePath;
  final List<AddPostList> tweets;
  final VoidCallback addPost;
  final VoidCallback openGallery;
  final ValueChanged<String> enterUserName;
  final ValueChanged<String> enterPost;
  final VoidCallback refresh;

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

class AddPostList extends ViewModel {
  AddPostList({
    required this.userName,
    required this.post,
    required this.imagePath,
  });

  final String userName;
  final String post;
  final String imagePath;

  @override
  List<Object?> get props => [
        userName,
        post,
        imagePath,
      ];
}
