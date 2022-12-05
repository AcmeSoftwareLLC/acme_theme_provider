import 'package:acme_theme_provider/src/core/configs/dialog_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

abstract class CoreDialog extends CoreWidget<DialogConfig> {
  const CoreDialog({
    super.key,
    super.name,
    required this.child,
    this.insetAnimationCurve = Curves.decelerate,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
  });

  final Widget child;
  final Curve insetAnimationCurve;
  final Duration insetAnimationDuration;

  @override
  Widget render(BuildContext context, DialogConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(dialogTheme: config.theme),
      child: Dialog(
        insetPadding: config.insetPadding as EdgeInsets?,
        clipBehavior: config.clipBehavior,
        insetAnimationCurve: insetAnimationCurve,
        insetAnimationDuration: insetAnimationDuration,
        child: child,
      ),
    );
  }
}
