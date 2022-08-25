import 'package:the28awg/components/components.dart';
import 'package:the28awg/di/di.dart';

class ThemeColorSwitch extends StatelessWidget {
  const ThemeColorSwitch({super.key});

  bool isSelectedColor(int i) =>
      Colors.primaries[i].value == getIt<ThemeController>().color.value;

  @override
  Widget build(BuildContext context) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 50,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: Colors.primaries.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: isSelectedColor(i)
              ? null
              : () => getIt<ThemeController>().color = Colors.primaries[i],
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.primaries[i],
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isSelectedColor(i) ? 1 : 0,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
