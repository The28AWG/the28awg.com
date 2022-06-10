import 'package:the28awg/components/components.dart';

class Breakpoint {
  final BuildContext context;

  Breakpoint(this.context);

  double get width => context.mediaQuery.size.width;

  bool get xs => width < 600;

  bool get sm => width >= 600 && width < 960;

  bool get md => width >= 960 && width < 1264;

  bool get lg => width >= 1264 && width < 1904;

  bool get xl => width >= 1904;

  String get name => this.sm
      ? 'sm'
      : this.md
          ? 'md'
          : this.lg
              ? 'lg'
              : this.xl
                  ? 'xl'
                  : 'xs';

  Widget adaptive({
    required Widget xs,
    Widget? sm,
    Widget? md,
    Widget? lg,
    Widget? xl,
  }) =>
      this.sm
          ? sm ?? xs
          : this.md
              ? md ?? sm ?? xs
              : this.lg
                  ? lg ?? md ?? sm ?? xs
                  : this.xl
                      ? xl ?? md ?? sm ?? xs
                      : xs;
}
