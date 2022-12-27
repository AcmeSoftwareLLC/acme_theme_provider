import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:acme_theme_example/features/home/presentation/home_page.dart';
import 'package:acme_theme_example/features/add_post/presentation/add_post_ui.dart';
import 'package:acme_theme_example/ui/settings_ui.dart';
import 'package:acme_theme_example/ui/message_ui.dart';
import 'package:acme_theme_example/ui/notifications_ui.dart';

enum Routes with RoutesMixin {
  home('/'),
  addTweet('/note'),
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
        builder: (context, state) => const HomePage(),
        route: Routes.home,
      ),
      AppRoute(
        builder: (context, state) => AddPostUI(),
        route: Routes.addTweet,
      ),
      AppRoute(
        builder: (context, state) => const NotificationsUI(),
        route: Routes.notifications,
      ),
      AppRoute(
        builder: (context, state) => const MessageUI(),
        route: Routes.messages,
      ),
      AppRoute(
        builder: (context, state) => const SettingsUI(),
        route: Routes.settings,
      ),
    ]);
  }
}
