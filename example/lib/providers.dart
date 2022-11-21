import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/note/domain/note_entity.dart';
import 'package:example/features/home/domain/home_entity.dart';
import 'package:example/features/home/domain/home_use_case.dart';
import 'package:example/features/home/external_interface/home_notes_store_external_interface.dart';
import 'package:example/features/home/external_interface/home_get_notes_gateway.dart';
import 'package:example/features/note/domain/note_use_case.dart';

import 'package:example/features/note/external_interface/note_add_note_gateway.dart';

final providersContext = ProvidersContext();

final homeUseCaseProvider =
    UseCaseProvider<HomeEntity, HomeUseCase>((_) => HomeUseCase());
final noteUseCaseProvider =
    UseCaseProvider<NoteEntity, NoteUseCase>((_) => NoteUseCase());

final homeGetNotesGatewayProvider = GatewayProvider<HomeGetNotesGateway>(
  (_) => HomeGetNotesGateway(provider: homeUseCaseProvider),
);

final noteAddNoteGatewayProvider = GatewayProvider<NoteAddNoteGateway>(
  (_) => NoteAddNoteGateway(provider: noteUseCaseProvider),
);

final notesStoreExternalInterfaceProvider = ExternalInterfaceProvider(
    (_) => HomeNotesStoreExternalInterface(gatewayConnections: [
          () => homeGetNotesGatewayProvider.getGateway(providersContext),
          () => noteAddNoteGatewayProvider.getGateway(providersContext),
        ]));

void loadProviders() {
  homeUseCaseProvider.getUseCaseFromContext(providersContext);
  noteUseCaseProvider.getUseCaseFromContext(providersContext);
  notesStoreExternalInterfaceProvider.getExternalInterface(providersContext);
}
