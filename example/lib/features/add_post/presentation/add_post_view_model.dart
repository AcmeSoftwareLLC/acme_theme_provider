import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class AddPostViewModel extends ViewModel {
  const AddPostViewModel({
    required this.post,
    required this.imagePath,
    required this.showLoading,
    required this.addTweet,
    required this.enterPost,
    required this.openGallery,
    required this.refresh,
  });

  final String post;
  final String imagePath;
  final bool showLoading;
  final VoidCallback addTweet;
  final VoidCallback openGallery;
  final ValueChanged<String> enterPost;
  final VoidCallback refresh;

  @override
  List<Object?> get props {
    return [
      post,
      showLoading,
      imagePath,
    ];
  }
}
