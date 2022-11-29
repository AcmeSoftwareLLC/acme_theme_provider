import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

abstract class CoreSnackBar extends SnackBar
    implements CoreWidget<SnackBarConfig> {
  const CoreSnackBar({
    super.key,
    super.animation,
    required super.content,
    this.name,
    super.duration,
    super.dismissDirection,
    super.onVisible,
    super.action,
  });

  @override
  final String? name;

  @override
  State<CoreSnackBar> createState() => _CoreSnackBarState();

  @override
  Widget render(BuildContext context, SnackBarConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(snackBarTheme: config.theme),
      child: SnackBar(
        content: content,
        duration: duration,
        action: action,
        //animation: const AlwaysStoppedAnimation(1.0),
        animation: animation,
        dismissDirection: dismissDirection,
        onVisible: onVisible,
        padding: config.padding,
        clipBehavior: config.clip,
        width: config.width,
      ),
    );
  }

  @override
  Widget build(BuildContext context, Widget child) => child;
}

class _CoreSnackBarState extends State<CoreSnackBar> {
  @override
  Widget build(BuildContext context) {
    final child = widget.render(
      context,
      context.config<SnackBarConfig>(
        widget.name ?? widget.runtimeType.toString(),
      ),
    );
    return widget.build(context, child);
  }
}
