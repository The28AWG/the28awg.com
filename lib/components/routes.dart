import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/pages.dart';
import 'package:the28awg/components/unknown_page.dart';

export 'package:auto_route/auto_route.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/*',
      page: UnknownPage,
    ),
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
  ],
)
class Routes extends _$Routes {}

extension DefaultRoutes on StackRouter {
  void home() => push(const HomeRoute());
}
