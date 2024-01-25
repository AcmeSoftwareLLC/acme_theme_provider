import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_gateway.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_request.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_success_response.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_domain_inputs.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_domain_models.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:acme_theme_example/features/theme/tweet.dart';

class AddPostGateway extends TweetDbGateway<AddPostDomainToGatewayModel,
    AddPostRequest, AddPostSuccessDomainInput> {
  @override
  AddPostRequest buildRequest(AddPostDomainToGatewayModel domainModel) {
    return AddPostRequest(
      tweet: domainModel.tweet,
    );
  }

  @override
  AddPostSuccessDomainInput onSuccess(
    AddPostSuccessResponse response,
  ) {
    final deserializer = Deserializer(response.tweets);
    return AddPostSuccessDomainInput(
      tweets: deserializer.getList(
        'data',
        converter: (map) {
          final deserializer = Deserializer(map);
          final post = deserializer.getString('post');
          final imagePath = deserializer.getString('imagePath');
          final firsName = deserializer.getString('firstName');
          final lastName = deserializer.getString('lastName');
          final userName = deserializer.getString('userName');
          final userImage = deserializer.getString('userImage');
          return Tweet(
            post: post,
            imagePath: imagePath,
            firstName: firsName,
            lastName: lastName,
            userName: userName,
            userImage: userImage,
          );
        },
      ),
    );
  }

  @override
  FailureDomainInput onFailure(FailureResponse failureResponse) {
    return FailureDomainInput(message: failureResponse.message);
  }
}

class AddPostRequest extends TweetDbRequest {
  AddPostRequest({
    required this.tweet,
  });

  final Tweet tweet;
}

class AddPostSuccessResponse extends TweetDbSuccessResponse {
  AddPostSuccessResponse({
    required this.tweets,
  });

  final List<Tweet> tweets;
}
