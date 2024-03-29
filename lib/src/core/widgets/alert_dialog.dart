// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../configs/alert_dialog_config.dart';
import '../core_widget.dart';

abstract class CoreAlertDialog extends CoreWidget<AlertDialogConfig> {
  const CoreAlertDialog({
    super.key,
    super.name,
    this.icon,
    this.content,
    this.title,
    this.actions,
    this.scrollable = false,
    this.semanticLabel,
    this.overflowBarAlignment,
  });

  final Widget? icon;
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  final bool scrollable;
  final String? semanticLabel;
  final OverflowBarAlignment? overflowBarAlignment;

  @override
  Widget render(BuildContext context, AlertDialogConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(dialogTheme: config.theme),
      child: AlertDialog(
        icon: icon,
        content: content,
        title: title,
        actions: actions,
        scrollable: scrollable,
        semanticLabel: semanticLabel,
        actionsOverflowAlignment: overflowBarAlignment,
        actionsAlignment: config.actionsAlignment,
        clipBehavior: config.clipBehavior,
        actionsOverflowButtonSpacing: config.actionsOverflowButtonSpacing,
        actionsOverflowDirection: config.actionsOverflowDirection,
        actionsPadding: config.actionsPadding,
        buttonPadding: config.buttonPadding,
        contentPadding: config.contentPadding,
        contentTextStyle: config.contentTextStyle,
        iconColor: config.iconColor,
        iconPadding: config.iconPadding,
        insetPadding: config.insetPadding as EdgeInsets,
        titlePadding: config.titlePadding,
      ),
    );
  }
}
