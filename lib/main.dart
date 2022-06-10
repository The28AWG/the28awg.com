import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the28awg/components/app.dart';
import 'package:the28awg/components/components.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  ThemeController themeController = ThemeController();
  await themeController.loadAll();
  runApp(InheritedProvider.value(
    value: themeController,
    child: const App(),
  ));
}
