// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../../../acme_theme.dart';
import '../configs/button_config.dart';
import '../core_widget.dart';

abstract class CoreButton extends CoreWidget<ButtonConfig> {
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
    final theme = Theme.of(context).copyWith(buttonTheme: config.theme);
    switch (buttonType) {
      case ButtonType.elevated:
        return Theme(
          data: theme,
          child: ElevatedButton(
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
          ),
        );
      case ButtonType.outlined:
        return Theme(
          data: theme,
          child: OutlinedButton(
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
          ),
        );
      case ButtonType.text:
        return Theme(
          data: theme,
          child: TextButton(
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
          ),
        );
      case ButtonType.unknown:
        throw UnsupportedError('Unsupported button type');
    }
  }

  @override
  StringBuffer getWidgetbookExportCode(BuildContext context) {
    ButtonConfig config =
        context.config<ButtonConfig>(name ?? runtimeType.toString());

    StringBuffer buffer = CoreWidget.getInitGeneratedCode();

    // TODO(Chris): Get these from the user.
    // TODO(Chris): Write custom serialization methods for every relevant/used data type. This is required in order to generate Use case code.
    String useCaseName = 'test button';
    String useCaseMethodName = 'testButton';
    String buttonTypeName = 'Button';

    if (config.buttonType == ButtonType.elevated) {
      buttonTypeName = 'ElevatedButton';
    } else if (config.buttonType == ButtonType.outlined) {
      buttonTypeName = 'OutlinedButton';
    } else if (config.buttonType == ButtonType.text) {
      buttonTypeName = 'TextButton';
    }

    // USE CASE
    buffer.writeln('@widgetbook.UseCase(');
    buffer.writeln(
      "name: '$useCaseName',",
    );
    buffer.writeln(
      'type: $buttonTypeName,',
    );
    buffer.writeln(')');
    // USE CASE METHOD
    buffer.writeln(
      '$buttonTypeName ${useCaseMethodName}Component(BuildContext context) {',
    );
    buffer.writeln('return $buttonTypeName(');

    if (config.buttonType == ButtonType.elevated) {
      buffer.writeln('onPressed: () {},');
    } else if (config.buttonType == ButtonType.outlined) {
      buffer.writeln('onPressed: () {},');
    } else if (config.buttonType == ButtonType.text) {
      buffer.writeln('onPressed: () {},');
    }

    buffer.writeln(');');
    buffer.writeln('}');

    return buffer;
  }

  StringBuffer _getButtonStyleWidgetbookExportCode(
      StringBuffer currentBuffer, ButtonStyle? style) {
    if (style == null) {
      return currentBuffer;
    }

    return currentBuffer;
  }
}
