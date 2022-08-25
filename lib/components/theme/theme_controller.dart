import 'package:flutter/foundation.dart';
import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/theme/theme_builder.dart';
import 'package:the28awg/di/di.dart';

@singleton
class ThemeController with ChangeNotifier {
  late ThemeBuilder builder = ThemeBuilder(this);

  @factoryMethod
  static Future<ThemeController> create() async {
    ThemeController themeController = ThemeController();
    await themeController.loadAll();
    return themeController;
  }

  Future<void> loadAll() async {
    _themeMode = ThemeMode.system;
    _platform = defaultTargetPlatform;
    _color = Colors.purple;
  }

  Future<void> resetAllToDefaults() async {
    await setThemeMode(ThemeMode.system, false);
    await setPlatform(
      defaultTargetPlatform,
      false,
    );
    await setColor(Colors.purple);
    notifyListeners();
  }

  ThemeData get light => builder.light;

  ThemeData get dark => builder.dark;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) => setThemeMode(value);

  Future<void> setThemeMode(
    ThemeMode? value, [
    bool notify = true,
  ]) async {
    if (value == null) return;
    if (value == _themeMode) return;
    _themeMode = value;
    if (notify) notifyListeners();
  }

  late TargetPlatform _platform;

  TargetPlatform get platform => _platform;

  set platform(TargetPlatform value) => setPlatform(value);

  Future<void> setPlatform(
    TargetPlatform? value, [
    bool notify = true,
  ]) async {
    if (value == null) return;
    if (value == _platform) return;
    _platform = value;
    if (notify) notifyListeners();
  }

  late Color _color;

  Color get color => _color;

  set color(Color value) => setColor(value);

  Future<void> setColor(
    Color? value, [
    bool notify = true,
  ]) async {
    if (value == null) return;
    if (value == _color) return;
    _color = value;
    if (notify) notifyListeners();
  }
}
