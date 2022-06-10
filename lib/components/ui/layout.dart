import 'package:the28awg/components/components.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const Layout({
    Key? key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: title,
          actions: actions,
        ),
        floatingActionButton: floatingActionButton,
        body: body,
      );
}
