import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/widgets.dart';

abstract class CoreWidget<C extends ComponentConfig> extends StatefulWidget {
  const CoreWidget({
    super.key,
    this.name,
  });

  final String? name;

  @override
  State<CoreWidget> createState() => _CoreState<C>();

  Widget render(BuildContext context, C config);

  Widget build(BuildContext context, Widget child) => child;
}

class _CoreState<C extends ComponentConfig> extends State<CoreWidget> {
  @override
  Widget build(BuildContext context) {
    final child = widget.render(
      context,
      context.config<C>(widget.name ?? widget.runtimeType.toString()),
    );

    return widget.build(context, child);
  }
}
