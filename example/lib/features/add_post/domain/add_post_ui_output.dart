import 'package:clean_framework/clean_framework_providers.dart';

class AddPostUIOutput extends Output {
  AddPostUIOutput({
    required this.post,
    required this.imagePath,
  });

  final String post;
  final String imagePath;

  @override
  List<Object?> get props {
    return [
      post,
      imagePath,
    ];
  }
}
