import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:clean_framework/clean_framework_legacy.dart';

class AddPostDomainToUIModel extends DomainModel {
  const AddPostDomainToUIModel({
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

class AddPostDomainToGatewayModel extends DomainModel {
  const AddPostDomainToGatewayModel({
    required this.tweet,
  });

  final Tweet tweet;

  @override
  List<Object?> get props => [tweet];
}

class AddPostPickerDomainToGatewayModel extends DomainModel {
  const AddPostPickerDomainToGatewayModel();

  @override
  List<Object?> get props => [];
}

class GetRandomUserDomainToGatewayModel extends DomainModel {
  const GetRandomUserDomainToGatewayModel();

  @override
  List<Object?> get props => [];
}
