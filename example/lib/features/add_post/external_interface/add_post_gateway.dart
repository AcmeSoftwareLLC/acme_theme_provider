import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/database/db_gateway.dart';
import 'package:example/core/database/db_request.dart';
import 'package:example/core/database/db_success_response.dart';
import 'package:example/features/theme/tweet.dart';
import 'package:example/providers.dart';

class AddPostGateway extends DbGateway<AddPostGatewayOutput,
    AddPostSuccessResponse, AddPostSuccessInput> {
  AddPostGateway({
    required super.provider,
  }) : super(
          context: providersContext,
        );

  @override
  DbRequest buildRequest(AddPostGatewayOutput output) {
    return AddPostRequest(
      tweet: output.tweet,
    );
  }

  @override
  AddPostSuccessInput onSuccess(
    AddPostSuccessResponse response,
  ) {
    final deserializer = Deserializer(response.tweets);
    return AddPostSuccessInput(
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
}

class AddPostRequest extends DbRequest {
  AddPostRequest({
    required this.tweet,
  });

  final Tweet tweet;
}

class AddPostSuccessResponse extends DbSuccessResponse {
  AddPostSuccessResponse({
    required this.tweets,
  });

  final List<Tweet> tweets;
}

class AddPostGatewayOutput extends Output {
  AddPostGatewayOutput({
    required this.tweet,
  });

  final Tweet tweet;

  @override
  List<Object?> get props => [tweet];
}

class AddPostSuccessInput extends SuccessInput {
  final List<Tweet> tweets;

  AddPostSuccessInput({
    required this.tweets,
  });
}