import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/pages.dart';
import 'package:the28awg/components/unknown_page.dart';

export 'package:auto_route/auto_route.dart';
export 'package:the28awg/components/routes.gr.dart';

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
      guards: [
        AuthGuard,
      ],
    ),
  ],
)
class $Routes {}

class Go {
  final BuildContext context;

  Go(this.context);

  Future<T?> push<T extends Object?>(
    PageRouteInfo<void> route,
  ) =>
      this.context.router.push(route);

  void home() => push(const HomeRoute());
}

extension GoExtension on BuildContext {
  Go get go => Go(this);
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) {
    resolver.next(true);
  }
}
