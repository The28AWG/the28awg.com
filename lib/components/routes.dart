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

class Go {
  final BuildContext context;

  Go(this.context);

  Future<T?> push<T extends Object?>(
    PageRouteInfo route,
  ) =>
      this.context.router.push(route);

  void home() => push(const HomeRoute());
}

extension GoExtension on BuildContext {
  Go get go => Go(this);
}
