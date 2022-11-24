import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/domain/home_entity.dart';
import 'package:example/features/home/domain/home_ui_output.dart';
import 'package:example/features/home/external_interface/home_get_notes_gateway.dart';
import 'package:example/features/theme/note.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: HomeEntity(),
          outputFilters: {
            HomeUIOutput: (HomeEntity entity) {
              return HomeUIOutput(
                notes: entity.notes,
              );
            },
          },
        );

  Future<void> init({bool isReset = false}) async {
    await request<HomeGetNotesGatewayOutput, HomeGetNotesSuccessInput>(
      HomeGetNotesGatewayOutput(),
      onSuccess: (input) {
        return entity.copyWith(
          notes: [
            for (var noteData in input.notes)
              Note(
                  title: noteData.title,
                  content: noteData.content,
                  imagePath: noteData.imagePath,)
          ],
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
  }
}
