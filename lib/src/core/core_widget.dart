// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../acme_theme.dart';

/// A widget that provides appropriate [ComponentConfig] to it's renderer.
@internal
abstract class CoreWidget<C extends ComponentConfig> extends StatefulWidget {
  const CoreWidget({
    super.key,
    this.name,
  });

  /// The name of the component declared in raw component config.
  ///
  /// If the name is not provided, the name will be resolved from the runtime type of the sub class.
  final String? name;

  @override
  State<CoreWidget> createState() => _CoreState<C>();

  /// Builds a widget based on the provided [config].
  Widget render(BuildContext context, C config);

  /// Builds a widget based on the provided [child].
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
