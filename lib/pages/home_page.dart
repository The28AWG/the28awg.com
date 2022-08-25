import 'package:the28awg/components/components.dart';
import 'package:the28awg/components/theme/theme_color_scheme.dart';
import 'package:the28awg/components/theme/theme_color_switch.dart';
import 'package:the28awg/components/theme/theme_mode_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Layout(
        title: 'test'.t(),
        actions: const [
          Icon(Icons.confirmation_num_sharp),
        ],
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Theme'),
                  ),
                  ThemeModeSwitch(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Primary Color'),
                  ),
                  ThemeColorSwitch(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Color Scheme'),
                  ),
                  ThemeColorScheme(),
                ],
              ),
            ),
          ),
        ),
      );
}
