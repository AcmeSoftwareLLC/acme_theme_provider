import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_rest/clean_framework_rest.dart';
import 'package:example/providers.dart';

class PostImageGateway extends RestGateway<PostImageGatewayOutput, PostImageRequest, PostImageSuccessInput>{
  PostImageGateway({
    ProvidersContext? context,
    UseCaseProvider? provider,
  }) : super(
    context: context ?? providersContext,
    provider: provider ?? postImageUseCaseProvider,
  );

  @override
  PostImageRequest buildRequest(PostImageGatewayOutput output) {
    return PostImageRequest();
  }

  @override
  PostImageSuccessInput onSuccess(RestSuccessResponse response) {
    print('The data here is: ${response.data.toString()}');
    return PostImageSuccessInput(imageUrl: response.data);
  }
}

class PostImageRequest extends PostRestRequest {
  @override
  String get path => 'https://picsum.photos/200/300';
}

class PostImageGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class PostImageSuccessInput extends SuccessInput {
  PostImageSuccessInput({required this.imageUrl});

  final String imageUrl;
}
