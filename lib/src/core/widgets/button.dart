import 'package:acme_theme_provider/src/core/configs/button_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreButton extends CoreWidget<ButtonConfig> {
  const CoreButton({
    super.key,
    super.name,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
  });

  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialStatesController? statesController;

  @override
  Widget render(BuildContext context, ButtonConfig config) {
    final buttonType = config.buttonType;
    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: config.style,
          clipBehavior: config.clip,
          onHover: onHover,
          onFocusChange: onFocusChange,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          statesController: statesController,
          child: child,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: config.style,
          clipBehavior: config.clip,
          onHover: onHover,
          onFocusChange: onFocusChange,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          statesController: statesController,
          child: child,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: config.style,
          clipBehavior: config.clip,
          onHover: onHover,
          onFocusChange: onFocusChange,
          onLongPress: onLongPress,
          focusNode: focusNode,
          autofocus: autofocus,
          statesController: statesController,
          child: child,
        );
      case ButtonType.unknown:
        throw UnsupportedError('Unsupported button type');
    }
  }
}
