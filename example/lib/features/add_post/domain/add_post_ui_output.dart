import 'package:clean_framework/clean_framework_providers.dart';

class AddPostUIOutput extends Output {
  AddPostUIOutput({
    required this.userName,
    required this.imagePath,
    required this.tweets,
  });

  final String userName;
  final String imagePath;
  final List<AddPostOutput> tweets;

  @override
  List<Object?> get props {
    return [userName, imagePath, tweets];
  }
}

class AddPostOutput extends Output {
  AddPostOutput({
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
