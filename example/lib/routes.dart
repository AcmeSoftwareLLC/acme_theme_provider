import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/home_ui.dart';
import 'package:flutter/material.dart';

enum Routes with RoutesMixin {
  home('/'),
  note('note');

  const Routes(this.path);

  @override
  final String path;
}

class NoteRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(routes: [
      AppRoute(
        builder: (context, state) => HomeUI(),
        route: Routes.home,
      ),
    ]);
  }
}
