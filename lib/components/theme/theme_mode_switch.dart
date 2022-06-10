import 'package:the28awg/components/components.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: context.themeController,
        builder: (_, __) => IconButton(
          onPressed: () {
            if (context.themeController.themeMode == ThemeMode.dark) {
              context.themeController.themeMode = ThemeMode.light;
            } else {
              context.themeController.themeMode = ThemeMode.dark;
            }
          },
          icon: Icon(
            context.themeController.themeMode == ThemeMode.dark
                ? Icons.bedtime
                : Icons.wb_sunny,
          ),
        ),
      );
}
