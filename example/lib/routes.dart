import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/another_ui.dart';
import 'package:example/features/home/presentation/home_page.dart';
import 'package:example/features/add_post/presentation/add_post_ui.dart';
import 'package:example/features/home/presentation/new_ui.dart';
import 'package:example/features/settings/presentation/settings_ui.dart';
import 'package:example/ui/message_ui.dart';
import 'package:example/ui/notifications_ui.dart';

enum Routes with RoutesMixin {
  home('/'),
  addTweet('/note'),
  newUI('/new'),
  anotherUI('/another'),
  search('/search'),
  notifications('/notifications'),
  messages('/messages'),
  settings('/settings');

  const Routes(this.path);

  @override
  final String path;
}

class NoteRouter extends AppRouter<Routes> {
  @override
  RouterConfiguration configureRouter() {
    return RouterConfiguration(routes: [
      AppRoute(
        builder: (context, state) => HomePage(),
        route: Routes.home,
      ),
      AppRoute(
        builder: (context, state) => AddPostUI(),
        route: Routes.addTweet,
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
      AppRoute(builder: (context, state) => MessageUI(), route: Routes.messages),
      AppRoute(builder: (context, state) => SettingsUI(), route: Routes.settings),
    ]);
  }
}
