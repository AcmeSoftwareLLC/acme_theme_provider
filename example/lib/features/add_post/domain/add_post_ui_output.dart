import 'package:clean_framework/clean_framework_providers.dart';

class AddPostUIOutput extends Output {
  AddPostUIOutput({
    required this.post,
    required this.imagePath,
    required this.showLoading,
  });

  final String post;
  final String imagePath;
  final bool showLoading;

  @override
  List<Object?> get props {
    return [
      post,
      imagePath,
      showLoading,
    ];
  }
}
