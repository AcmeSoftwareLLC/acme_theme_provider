import 'package:acme_theme_example/core/dependency/image_util_ext_interface/image_util_external_interface.dart';
import 'package:acme_theme_example/core/dependency/random_user_ext_interface/random_user_external_interface.dart';
import 'package:acme_theme_example/core/dependency/tweet_db_ext_interface/tweet_db_external_interface.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_entity.dart';
import 'package:acme_theme_example/features/add_post/external_interface/get_random_user_gateway.dart';
import 'package:acme_theme_example/features/home/domain/home_entity.dart';
import 'package:acme_theme_example/features/home/external_interface/home_get_tweet_gateway.dart';
import 'package:acme_theme_example/features/home/domain/home_use_case.dart';
import 'package:acme_theme_example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:acme_theme_example/features/add_post/domain/add_post_use_case.dart';
import 'package:acme_theme_example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:acme_theme_example/features/add_post/external_interface/add_post_image_picker_gateway.dart';
import 'package:clean_framework/clean_framework.dart';

final providersContext = ProvidersContext();

final homeUseCaseProvider = UseCaseProvider<HomeEntity, HomeUseCase>(
  HomeUseCase.new,
);

final addPostUseCaseProvider = UseCaseProvider<AddPostEntity, AddPostUseCase>(
  AddPostUseCase.new,
);

final noteImagePickerGatewayProvider = GatewayProvider(
  AddPostPickerGateway.new,
  useCases: [addPostUseCaseProvider],
);

final homeGetAllTweetsGatewayProvider = GatewayProvider(
  HomeGetAllTweetsGateway.new,
  useCases: [
    homeUseCaseProvider,
  ],
);

final homeGetTweetGatewayProvider = GatewayProvider(
  HomeGetTweetGateway.new,
  useCases: [
    homeUseCaseProvider,
  ],
);

final addPostGatewayProvider = GatewayProvider(
  AddPostGateway.new,
  useCases: [
    addPostUseCaseProvider,
  ],
);

final notesStoreExternalInterfaceProvider = ExternalInterfaceProvider(
  TweetDbExternalInterface.new,
  gateways: [
    homeGetAllTweetsGatewayProvider,
    homeGetTweetGatewayProvider,
    addPostGatewayProvider,
  ],
);

final imageUtilExternalInterfaceProvider = ExternalInterfaceProvider(
  ImageUtilExternalInterface.new,
  gateways: [
    noteImagePickerGatewayProvider,
  ],
);

final getRandomUserGatewayProvider = GatewayProvider(
  GetRandomUserGateway.new,
  useCases: [
    addPostUseCaseProvider,
  ],
);

final getRandomUserExternalInterfaceProvider = ExternalInterfaceProvider(
  RandomUserExternalInterface.new,
  gateways: [
    getRandomUserGatewayProvider,
  ],
);
