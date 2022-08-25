import 'package:the28awg/components/components.dart';

class ThemeColorScheme extends StatelessWidget {
  const ThemeColorScheme({super.key});

  @override
  Widget build(BuildContext context) => GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: [
          ColorTile(
            color: Theme.of(context).colorScheme.primary,
            name: 'primary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onPrimary,
            name: 'onPrimary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.primaryContainer,
            name: 'primaryContainer',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            name: 'onPrimaryContainer',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.inversePrimary,
            name: 'inversePrimary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.secondary,
            name: 'secondary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onSecondary,
            name: 'onSecondary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.secondaryContainer,
            name: 'secondary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            name: 'onSecondary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.tertiary,
            name: 'tertiary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onTertiary,
            name: 'onTertiary',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            name: 'tertiaryContainer',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            name: 'onTertiaryContainer',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.error,
            name: 'error',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onError,
            name: 'onError',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.errorContainer,
            name: 'errorContainer',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onErrorContainer,
            name: 'onErrorContainer',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.background,
            name: 'background',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onBackground,
            name: 'onBackground',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.surface,
            name: 'surface',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onSurface,
            name: 'onSurface',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onInverseSurface,
            name: 'onInverseSurface',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.surfaceVariant,
            name: 'surfaceVariant',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.surfaceTint,
            name: 'surfaceTint',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            name: 'onSurfaceVariant',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.outline,
            name: 'outline',
          ),
          ColorTile(
            color: Theme.of(context).colorScheme.shadow,
            name: 'shadow',
          ),
        ],
      );
}

class ColorTile extends StatelessWidget {
  final Color color;
  final String name;

  const ColorTile({
    super.key,
    required this.color,
    required this.name,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(),
          color: this.color,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Theme.of(context).cardColor.withOpacity(0.5),
              ),
              child: this.name.t(),
            ),
          ),
        ),
      );
}
