import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:the28awg/components/components.dart';
import 'package:the28awg/di/di.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _routes = Routes(authGuard: AuthGuard());
  late ThemeController _themeController;

  @override
  void initState() {
    super.initState();
    _themeController = getIt<ThemeController>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => FlutterNativeSplash.remove(),
    );
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _themeController,
        builder: (context, __) => MaterialApp.router(
          routerDelegate: _routes.delegate(),
          routeInformationParser: _routes.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateTitle: (context) => context.ln.title,
          theme: _themeController.light,
          darkTheme: _themeController.dark,
          themeMode: _themeController.themeMode,
        ),
      );
}
