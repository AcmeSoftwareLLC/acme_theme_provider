import 'package:clean_framework/clean_framework_providers.dart';

class PostImageEntity extends Entity {
  final String imageUrl;

  PostImageEntity({this.imageUrl = ''});

  PostImageEntity merge({
    String? imageUrl,
  }) {
    return PostImageEntity(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props {
    return [imageUrl];
  }
}
