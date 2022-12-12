import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class AlertDialogConfig extends ComponentConfig {
  const AlertDialogConfig({
    required this.theme,
    required this.actionsAlignment,
    required this.clipBehavior,
    required this.actionsOverflowButtonSpacing,
    required this.actionsOverflowDirection,
    required this.actionsPadding,
    required this.buttonPadding,
    required this.contentPadding,
    required this.contentTextStyle,
    required this.iconColor,
    required this.iconPadding,
    required this.insetPadding,
    required this.titlePadding,
  });

  final DialogTheme? theme;
  final MainAxisAlignment? actionsAlignment;
  final Clip clipBehavior;
  final double? actionsOverflowButtonSpacing;
  final VerticalDirection? actionsOverflowDirection;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? iconPadding;
  final EdgeInsetsGeometry insetPadding;
  final EdgeInsetsGeometry? titlePadding;
  final Color? iconColor;
  final TextStyle? contentTextStyle;

  factory AlertDialogConfig.fromMap(Map<String, dynamic> map) {
    return AlertDialogConfig(
      theme: ThemeDecoder.decodeDialogTheme(map['theme']),
      actionsAlignment:
          ThemeDecoder.decodeMainAxisAlignment(map['actionsAlignment']),
      clipBehavior: ThemeDecoder.decodeClip(map['clipBehavior']) ?? Clip.none,
      actionsOverflowButtonSpacing: map['actionsOverflowButtonSpacing'],
      actionsOverflowDirection:
          ThemeDecoder.decodeVerticalDirection(map['actionsOverflowDirection']),
      actionsPadding:
          ThemeDecoder.decodeEdgeInsetsGeometry(map['actionsPadding']),
      buttonPadding:
          ThemeDecoder.decodeEdgeInsetsGeometry(map['buttonPadding']),
      contentPadding:
          ThemeDecoder.decodeEdgeInsetsGeometry(map['contentPadding']),
      contentTextStyle: ThemeDecoder.decodeTextStyle(map['contentTextStyle']),
      iconColor: ThemeDecoder.decodeColor(map['iconColor']),
      iconPadding: ThemeDecoder.decodeEdgeInsetsGeometry(map['iconPadding']),
      insetPadding:
          ThemeDecoder.decodeEdgeInsetsGeometry(map['insetPadding']) ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      titlePadding: ThemeDecoder.decodeEdgeInsetsGeometry(map['titlePadding']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.alertDialog.value,
      'theme': ThemeEncoder.encodeDialogTheme(theme),
      'actionsAlignment':
          ThemeEncoder.encodeMainAxisAlignment(actionsAlignment),
      'clipBehavior': ThemeEncoder.encodeClip(clipBehavior),
      'actionsOverflowButtonSpacing': actionsOverflowButtonSpacing,
      'actionsOverflowDirection':
          ThemeEncoder.encodeVerticalDirection(actionsOverflowDirection),
      'actionsPadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(actionsPadding as EdgeInsets?),
      'buttonPadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(buttonPadding as EdgeInsets?),
      'contentPadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(contentPadding as EdgeInsets?),
      'contentTextStyle': ThemeEncoder.encodeTextStyle(contentTextStyle),
      'iconColor': ThemeEncoder.encodeColor(iconColor),
      'iconPadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(iconPadding as EdgeInsets?),
      'insetPadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(insetPadding as EdgeInsets?),
      'titlePadding':
          ThemeEncoder.encodeEdgeInsetsGeometry(titlePadding as EdgeInsets?),
    };
  }

  AlertDialogConfig copyWith({
    DialogTheme? theme,
    MainAxisAlignment? actionsAlignment,
    Clip? clipBehavior,
    double? actionsOverflowButtonSpacing,
    VerticalDirection? actionsOverflowDirection,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? buttonPadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? iconPadding,
    EdgeInsetsGeometry? insetPadding,
    EdgeInsetsGeometry? titlePadding,
    Color? iconColor,
    TextStyle? contentTextStyle,
  }) {
    return AlertDialogConfig(
      theme: theme ?? this.theme,
      actionsAlignment: actionsAlignment ?? this.actionsAlignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      actionsOverflowButtonSpacing:
          actionsOverflowButtonSpacing ?? this.actionsOverflowButtonSpacing,
      actionsOverflowDirection:
          actionsOverflowDirection ?? this.actionsOverflowDirection,
      actionsPadding: actionsPadding ?? this.actionsPadding,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      contentPadding: contentPadding ?? this.contentPadding,
      iconPadding: iconPadding ?? this.iconPadding,
      insetPadding: insetPadding ?? this.insetPadding,
      titlePadding: titlePadding ?? this.titlePadding,
      iconColor: iconColor ?? this.iconColor,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
    );
  }
}
