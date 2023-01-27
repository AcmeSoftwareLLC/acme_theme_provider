import 'package:clean_framework/clean_framework_legacy.dart';
import 'package:flutter/cupertino.dart';

class AddPostViewModel extends ViewModel {
  const AddPostViewModel({
    required this.post,
    required this.imagePath,
    required this.addTweet,
    required this.enterPost,
    required this.openGallery,
    required this.refresh,
  });

  final String post;
  final String imagePath;
  final VoidCallback addTweet;
  final VoidCallback openGallery;
  final ValueChanged<String> enterPost;
  final VoidCallback refresh;

  @override
  List<Object?> get props {
    return [
      post,
      imagePath,
    ];
  }
}
