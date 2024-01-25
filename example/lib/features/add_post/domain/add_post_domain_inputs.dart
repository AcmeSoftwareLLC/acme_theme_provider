import 'package:acme_theme_example/features/theme/tweet.dart';
import 'package:clean_framework/clean_framework.dart';

class AddPostSuccessDomainInput extends SuccessDomainInput {
  final List<Tweet> tweets;

  const AddPostSuccessDomainInput({
    required this.tweets,
  });
}

class AddPostPickerGatewaySuccessDomainInput extends SuccessDomainInput {
  const AddPostPickerGatewaySuccessDomainInput({
    required this.imagePath,
  });

  final String? imagePath;
}

class GetRandomUserSuccessDomainInput extends SuccessDomainInput {
  const GetRandomUserSuccessDomainInput({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.userImage,
  });

  final String firstName;
  final String lastName;
  final String userName;
  final String userImage;
}

class InvalidTokenFailureDomainInput extends FailureDomainInput {}
