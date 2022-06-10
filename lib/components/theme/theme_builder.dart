import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/theme/model/input_border_enum.dart';
import 'package:the28awg/components/theme/model/visual_density_enum.dart';

class ThemeBuilder {
  final ThemeController _controller;

  ThemeBuilder(ThemeController controller) : _controller = controller;

  VisualDensity get visualDensity {
    switch (_controller.visualDensityEnum) {
      case VisualDensityEnum.comfortable:
        return VisualDensity.comfortable;
      case VisualDensityEnum.compact:
        return VisualDensity.compact;
      case VisualDensityEnum.standard:
        return VisualDensity.standard;
      default:
        return VisualDensity.adaptivePlatformDensity;
    }
  }

  InputBorder get inputBorder =>
      _controller.inputBorderEnum == InputBorderEnum.underline
          ? const UnderlineInputBorder()
          : const OutlineInputBorder();

  ThemeData get light => _themeData(Brightness.light);

  ThemeData get dark => _themeData(Brightness.dark);

  ThemeData _themeData(
    Brightness brightness,
  ) =>
      ThemeData(
        extensions: [
          Now(DateTime.now().millisecond),
        ],
        brightness: brightness,
        platform: _controller.platform,
        visualDensity: visualDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: inputBorder,
        ),
      );
}

class Now extends ThemeExtension<Now> {
  final int now;

  Now(this.now);

  @override
  ThemeExtension<Now> copyWith({
    int? now,
  }) {
    return Now(now ?? this.now);
  }

  @override
  ThemeExtension<Now> lerp(ThemeExtension<Now>? other, double t) {
    if (other is! Now) {
      return this;
    }
    return this;
  }
}
