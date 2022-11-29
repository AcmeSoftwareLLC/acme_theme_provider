import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_external_interface.dart';
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
final noteUseCaseProvider =
    UseCaseProvider<AddPostEntity, AddPostUseCase>((_) => AddPostUseCase());

final noteImagePickerGatewayProvider = GatewayProvider<AddPostPickerGateway>(
  (_) => AddPostPickerGateway(),
);

final homeGetAllNotesGatewayProvider = GatewayProvider<HomeGetAllTweetsGateway>(
  (_) => HomeGetAllTweetsGateway(provider: homeUseCaseProvider),
);

final homeGetNoteGatewayProvider = GatewayProvider<HomeGetTweetGateway>(
  (_) => HomeGetTweetGateway(provider: homeUseCaseProvider),
);

final noteAddNoteGatewayProvider = GatewayProvider<AddPostGateway>(
  (_) => AddPostGateway(provider: noteUseCaseProvider),
);

final notesStoreExternalInterfaceProvider = ExternalInterfaceProvider(
    (_) => HomeTweetsStoreExternalInterface(gatewayConnections: [
          () => homeGetAllNotesGatewayProvider.getGateway(providersContext),
          () => homeGetNoteGatewayProvider.getGateway(providersContext),
          () => noteAddNoteGatewayProvider.getGateway(providersContext),
        ]));

final imageUtilExternalInterface = ExternalInterfaceProvider(
  (_) => ImageUtilExternalInterface(
    gatewayConnections: [
      () => noteImagePickerGatewayProvider.getGateway(providersContext),
    ],
  ),
);

void loadProviders() {
  homeUseCaseProvider.getUseCaseFromContext(providersContext);
  noteUseCaseProvider.getUseCaseFromContext(providersContext);
  notesStoreExternalInterfaceProvider.getExternalInterface(providersContext);
  imageUtilExternalInterface.getExternalInterface(providersContext);
  noteImagePickerGatewayProvider.getGateway(providersContext);
}
