import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework_rest/clean_framework_rest.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_external_interface.dart';
import 'package:example/features/add_post/external_interface/get_random_user_gateway.dart';
import 'package:example/features/home/external_interface/home_get_tweet_gateway.dart';
import 'package:example/features/add_post/domain/add_post_entity.dart';
import 'package:example/features/home/domain/home_entity.dart';
import 'package:example/features/home/domain/home_use_case.dart';
import 'package:example/features/home/external_interface/home_tweets_store_external_interface.dart';
import 'package:example/features/home/external_interface/home_get_all_tweets_gateway.dart';
import 'package:example/features/add_post/domain/add_post_use_case.dart';
import 'package:example/features/add_post/external_interface/add_post_gateway.dart';
import 'package:example/features/add_post/external_interface/add_post_image_picker_gateway.dart';

final providersContext = ProvidersContext();

final homeUseCaseProvider =
    UseCaseProvider<HomeEntity, HomeUseCase>((_) => HomeUseCase());
final addPostUseCaseProvider =
    UseCaseProvider<AddPostEntity, AddPostUseCase>((_) => AddPostUseCase());

final noteImagePickerGatewayProvider = GatewayProvider<AddPostPickerGateway>(
  (_) => AddPostPickerGateway(),
);

final homeGetAllTweetsGatewayProvider =
    GatewayProvider<HomeGetAllTweetsGateway>(
  (_) => HomeGetAllTweetsGateway(provider: homeUseCaseProvider),
);

final homeGetTweetGatewayProvider = GatewayProvider<HomeGetTweetGateway>(
  (_) => HomeGetTweetGateway(provider: homeUseCaseProvider),
);

final addPostGatewayProvider = GatewayProvider<AddPostGateway>(
  (_) => AddPostGateway(provider: addPostUseCaseProvider),
);

final notesStoreExternalInterfaceProvider = ExternalInterfaceProvider(
    (_) => HomeTweetsStoreExternalInterface(gatewayConnections: [
          () => homeGetAllTweetsGatewayProvider.getGateway(providersContext),
          () => homeGetTweetGatewayProvider.getGateway(providersContext),
          () => addPostGatewayProvider.getGateway(providersContext),
        ]));

final imageUtilExternalInterface = ExternalInterfaceProvider(
  (_) => ImageUtilExternalInterface(
    gatewayConnections: [
      () => noteImagePickerGatewayProvider.getGateway(providersContext),
    ],
  ),
);
final getRandomUserProvider = GatewayProvider<GetRandomUserGateway>(
  (_) => GetRandomUserGateway(),
);
final getRandomUser = ExternalInterfaceProvider(
  (_) => RestExternalInterface(
    baseUrl: 'https://randomuser.me/api/',
    gatewayConnections: [
      () => getRandomUserProvider.getGateway(providersContext),
    ],
  ),
);

void loadProviders() {
  homeUseCaseProvider.getUseCaseFromContext(providersContext);
  addPostUseCaseProvider.getUseCaseFromContext(providersContext);
  notesStoreExternalInterfaceProvider.getExternalInterface(providersContext);
  imageUtilExternalInterface.getExternalInterface(providersContext);
  noteImagePickerGatewayProvider.getGateway(providersContext);
  getRandomUserProvider.getGateway(providersContext);
  getRandomUser.getExternalInterface(providersContext);
}
