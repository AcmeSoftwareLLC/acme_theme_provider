import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/widgets.dart';

abstract class CoreWidget<T extends Object> extends StatefulWidget {
  const CoreWidget({
    super.key,
    required this.parent,
  }) : assert(parent is String || parent is Widget);

  final T parent;

  @override
  CoreState createState();
}

abstract class CoreState<T extends CoreWidget, C extends ComponentConfig>
    extends State<T> {
  late C config;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    final parent = widget.parent;

    config = context.config(
      parent is String ? parent : parent.runtimeType.toString(),
    );

    return _NullWidget();
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError('CoreWidgets must call super.build()');
  }
}
