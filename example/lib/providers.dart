import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/core/dependency/image_util_ext_interface/image_util_external_interface.dart';
import 'package:example/features/home/external_interface/home_get_note_gateway.dart';
import 'package:example/features/note/domain/note_entity.dart';
import 'package:example/features/home/domain/home_entity.dart';
import 'package:example/features/home/domain/home_use_case.dart';
import 'package:example/features/home/external_interface/home_notes_store_external_interface.dart';
import 'package:example/features/home/external_interface/home_get_all_notes_gateway.dart';
import 'package:example/features/note/domain/note_use_case.dart';
import 'package:example/features/note/external_interface/note_add_note_gateway.dart';
import 'package:example/features/note/external_interface/note_image_picker_gateway.dart';

final providersContext = ProvidersContext();

final homeUseCaseProvider =
    UseCaseProvider<HomeEntity, HomeUseCase>((_) => HomeUseCase());
final noteUseCaseProvider =
    UseCaseProvider<NoteEntity, NoteUseCase>((_) => NoteUseCase());

final noteImagePickerGatewayProvider = GatewayProvider<NoteImagePickerGateway>(
  (_) => NoteImagePickerGateway(),
);

final homeGetAllNotesGatewayProvider = GatewayProvider<HomeGetAllNotesGateway>(
  (_) => HomeGetAllNotesGateway(provider: homeUseCaseProvider),
);

final homeGetNoteGatewayProvider = GatewayProvider<HomeGetNoteGateway>(
  (_) => HomeGetNoteGateway(provider: homeUseCaseProvider),
);

final noteAddNoteGatewayProvider = GatewayProvider<NoteAddNoteGateway>(
  (_) => NoteAddNoteGateway(provider: noteUseCaseProvider),
);

final notesStoreExternalInterfaceProvider = ExternalInterfaceProvider(
    (_) => HomeNotesStoreExternalInterface(gatewayConnections: [
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
