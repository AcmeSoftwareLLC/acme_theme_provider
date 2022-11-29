import 'package:clean_framework/clean_framework_providers.dart';

class PostImageViewModel extends ViewModel {
  final String imageUrl;

  PostImageViewModel({required this.imageUrl});

  @override
  List<Object?> get props {
    return [imageUrl];
  }
}
