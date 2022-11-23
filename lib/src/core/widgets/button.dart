import 'package:acme_theme_provider/src/core/configs/button_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreButton<T extends Object> extends CoreWidget<T> {
  const CoreButton({
    super.key,
    required super.parent,
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
  CoreState<CoreButton, ButtonConfig> createState() => _CoreButtonState();
}

class _CoreButtonState extends CoreState<CoreButton, ButtonConfig> {
  @override
  Widget build(BuildContext context) {
    final buttonType = config.buttonType;
    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: widget.onPressed,
          style: config.style,
          clipBehavior: config.clip,
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          onLongPress: widget.onLongPress,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          statesController: widget.statesController,
          child: widget.child,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: widget.onPressed,
          style: config.style,
          clipBehavior: config.clip,
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          onLongPress: widget.onLongPress,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          statesController: widget.statesController,
          child: widget.child,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: widget.onPressed,
          style: config.style,
          clipBehavior: config.clip,
          onHover: widget.onHover,
          onFocusChange: widget.onFocusChange,
          onLongPress: widget.onLongPress,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          statesController: widget.statesController,
          child: widget.child,
        );
      case ButtonType.unknown:
        throw UnsupportedError('Unsupported button type');
    }
  }
}
