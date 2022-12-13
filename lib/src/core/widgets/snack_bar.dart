// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../../../acme_theme.dart';
import '../core_widget.dart';

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
    super.backgroundColor,
    super.elevation,
    super.margin,
    super.padding,
    super.width,
    super.shape,
    super.behavior,
    super.clipBehavior,
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

  @override
  SnackBar withAnimation(Animation<double> newAnimation, {Key? fallbackKey}) {
    return _SnackBar(
      key: key ?? fallbackKey,
      name: runtimeType.toString(),
      content: content,
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      duration: duration,
      animation: newAnimation,
      onVisible: onVisible,
      dismissDirection: dismissDirection,
      clipBehavior: clipBehavior,
    );
  }
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

class _SnackBar extends CoreSnackBar {
  const _SnackBar({
    required super.key,
    required super.name,
    required super.content,
    required super.backgroundColor,
    required super.elevation,
    required super.margin,
    required super.padding,
    required super.width,
    required super.shape,
    required super.behavior,
    required super.action,
    required super.duration,
    required super.animation,
    required super.onVisible,
    required super.dismissDirection,
    required super.clipBehavior,
  });
}
