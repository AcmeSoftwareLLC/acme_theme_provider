import 'package:clean_framework/clean_framework_providers.dart';

class HomeEntity extends Entity {
  final List<String>? noteTitles;

  HomeEntity({this.noteTitles});

  HomeEntity copyWith({
    List<String>? noteTitles,
  }) {
    return HomeEntity(
      noteTitles: noteTitles ?? this.noteTitles,
    );
  }

  @override
  List<Object?> get props {
    return [
      noteTitles,
    ];
  }
}
