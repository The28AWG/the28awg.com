import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the28awg/components/components.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _routes = Routes();

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: context.themeController,
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
          theme: context.themeController.light,
          darkTheme: context.themeController.dark,
          themeMode: context.themeController.themeMode,
        ),
      );
}
