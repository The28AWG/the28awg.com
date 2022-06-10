import 'package:flutter/foundation.dart';
import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/theme/model/input_border_enum.dart';
import 'package:the28awg/components/theme/model/visual_density_enum.dart';
import 'package:the28awg/components/theme/theme_builder.dart';

class ThemeController with ChangeNotifier {
  late ThemeBuilder builder = ThemeBuilder(this);
  static const ThemeMode defaultThemeMode = ThemeMode.system;
  static const VisualDensityEnum defaultVisualDensityEnum =
      VisualDensityEnum.adaptivePlatformDensity;
  static const InputBorderEnum defaultInputBorderEnum = InputBorderEnum.outline;

  Future<void> loadAll() async {
    _themeMode = defaultThemeMode;
    _platform = defaultTargetPlatform;
    _visualDensityEnum = defaultVisualDensityEnum;
    _inputBorderEnum = defaultInputBorderEnum;
  }

  Future<void> resetAllToDefaults() async {
    await setThemeMode(defaultThemeMode, false);
    await setPlatform(
      defaultTargetPlatform,
      false,
    );
    await setVisualDensityEnum(
      defaultVisualDensityEnum,
      false,
    );
    await setInputBorderEnum(
      defaultInputBorderEnum,
      false,
    );
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

  late VisualDensityEnum _visualDensityEnum;

  VisualDensityEnum get visualDensityEnum => _visualDensityEnum;

  set visualDensityEnum(VisualDensityEnum value) => setVisualDensityEnum(value);

  Future<void> setVisualDensityEnum(
    VisualDensityEnum? value, [
    bool notify = true,
  ]) async {
    if (value == null) return;
    if (value == _visualDensityEnum) return;
    _visualDensityEnum = value;
    if (notify) notifyListeners();
  }

  late InputBorderEnum _inputBorderEnum;

  InputBorderEnum get inputBorderEnum => _inputBorderEnum;

  set inputBorderEnum(InputBorderEnum value) => setInputBorderEnum(value);

  Future<void> setInputBorderEnum(
    InputBorderEnum? value, [
    bool notify = true,
  ]) async {
    if (value == null) return;
    if (value.index == _inputBorderEnum.index) return;
    _inputBorderEnum = value;
    if (notify) notifyListeners();
  }
}
