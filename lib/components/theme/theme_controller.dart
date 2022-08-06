import 'package:flutter/foundation.dart';
import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/theme/theme_builder.dart';

class ThemeController with ChangeNotifier {
  late ThemeBuilder builder = ThemeBuilder(this);
  static const ThemeMode defaultThemeMode = ThemeMode.system;
  static VisualDensity defaultVisualDensity =
      VisualDensity.adaptivePlatformDensity;
  static Color defaultColor = const Color(0xFF8E24AA);

  Future<void> loadAll() async {
    _themeMode = defaultThemeMode;
    _platform = defaultTargetPlatform;
    _visualDensity = defaultVisualDensity;
    _color = defaultColor;
  }

  Future<void> resetAllToDefaults() async {
    await setThemeMode(defaultThemeMode, false);
    await setPlatform(
      defaultTargetPlatform,
      false,
    );
    await setVisualDensity(
      defaultVisualDensity,
      false,
    );
    await setColor(defaultColor);
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

  late VisualDensity _visualDensity;

  VisualDensity get visualDensity => _visualDensity;

  set visualDensityEnum(VisualDensity value) => setVisualDensity(value);

  Future<void> setVisualDensity(
    VisualDensity? value, [
    bool notify = true,
  ]) async {
    if (value == null) return;
    if (value == _visualDensity) return;
    _visualDensity = value;
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
