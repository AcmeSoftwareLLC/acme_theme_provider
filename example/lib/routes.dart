import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/features/home/presentation/home_page.dart';
import 'package:example/features/add_post/presentation/add_post_ui.dart';

enum Routes with RoutesMixin {
  home('/'),
  addTweet('/addTweet');

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
    ]);
  }
}
