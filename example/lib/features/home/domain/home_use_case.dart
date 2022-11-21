
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:example/features/home/domain/home_entity.dart';
import 'package:example/features/home/domain/home_ui_output.dart';
import 'package:example/features/home/external_interface/home_get_notes_gateway.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
    entity: HomeEntity(),
    outputFilters: {
      HomeUIOutput: (HomeEntity entity) {
        return HomeUIOutput(
          noteTitles: entity.noteTitles,
          title: entity.noteTitles.first,
          noteDate: 'DateTime(2022)',
        );
      },
    },
  );

  Future<void> init({bool isReset = false}) async {
    await request<HomeGetNotesGatewayOutput, HomeGetNotesSuccessInput>(
      HomeGetNotesGatewayOutput(),
      onSuccess: (input) {
        print('The data is: ${input.noteTitles.first}');
        return entity.copyWith(
            noteTitles: input.noteTitles
        );
      },
      onFailure: (e) {
        print('the error is: ${e.message}');
        return entity;
      },
    );
  }
}
