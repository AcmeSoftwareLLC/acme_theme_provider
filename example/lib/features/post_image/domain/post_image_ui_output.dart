import 'package:clean_framework/clean_framework_providers.dart';

class PostImageUIOutput extends Output {
  final String imageUrl;

  PostImageUIOutput({required this.imageUrl});

  @override
  List<Object?> get props {
    return [imageUrl];
  }
}
