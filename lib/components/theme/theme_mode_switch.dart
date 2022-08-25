import 'package:the28awg/components/components.dart';
import 'package:the28awg/di/di.dart';

class ThemeModeSwitch extends StatefulWidget {
  const ThemeModeSwitch({super.key});

  @override
  State<ThemeModeSwitch> createState() => _ThemeModeSwitchState();
}

class _ThemeModeSwitchState extends State<ThemeModeSwitch> {
  late ThemeController _themeController;
  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _themeController = getIt<ThemeController>();
    _isSelected = [
      _themeController.themeMode == ThemeMode.light,
      _themeController.themeMode == ThemeMode.system,
      _themeController.themeMode == ThemeMode.dark,
    ];
  }

  void applySystem() => setState(() {
        _isSelected[0] = false;
        _isSelected[1] = true;
        _isSelected[2] = false;
        _themeController.themeMode = ThemeMode.system;
      });

  void applyDark() => setState(() {
        _isSelected[0] = false;
        _isSelected[1] = false;
        _isSelected[2] = true;
        _themeController.themeMode = ThemeMode.dark;
      });

  void applyLight() => setState(() {
        _isSelected[0] = true;
        _isSelected[1] = false;
        _isSelected[2] = false;
        _themeController.themeMode = ThemeMode.light;
      });

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: getIt<ThemeController>(),
        builder: (_, __) => ToggleButtons(
          isSelected: _isSelected,
          children: const [
            Icon(Icons.brightness_low),
            Icon(Icons.brightness_medium),
            Icon(Icons.brightness_high),
          ],
          onPressed: (index) {
            switch (index) {
              case 2:
                applyDark();
                break;
              case 1:
                applySystem();
                break;
              default:
                applyLight();
                break;
            }
          },
        ),
      );
}
