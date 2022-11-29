import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/another_ui.dart';
import 'package:example/features/home/presentation/home_ui.dart';
import 'package:example/features/add_post/presentation/add_post_ui.dart';
import 'package:example/features/home/presentation/new_ui.dart';
import 'package:example/ui/notifications_ui.dart';
import 'package:example/ui/search_ui.dart';

enum Routes with RoutesMixin {
  home('/home'),
  note('/note'),
  newUI('/new'),
  anotherUI('/another'),
  search('/'),
  notifications('/notifications');

  const Routes(this.path);

  @override
  final String path;
}

class NoteRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(routes: [
      AppRoute(
        builder: (context, state) => SearchUI(),
        route: Routes.search,
      ),
      AppRoute(
        builder: (context, state) => AddPostUI(),
        route: Routes.note,
      ),
      AppRoute(
        builder: (context, state) => NewUI(),
        route: Routes.newUI,
      ),
      AppRoute(
        builder: (context, state) => AnotherUI(),
        route: Routes.anotherUI,
      ),
      AppRoute(
        builder: (context, state) => NotificationsUI(),
        route: Routes.notifications,
      ),
    ]);
  }
}
