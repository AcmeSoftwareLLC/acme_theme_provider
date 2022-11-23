import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class TextFieldConfig extends ComponentConfig {
  const TextFieldConfig({
    required this.theme,
    required this.textAlign,
    required this.clip,
    required this.textStyle,
  });

  final InputDecorationTheme? theme;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Clip clip;
  final TextDirection? textDirection;
  final int? maxLines;
  final ToolbarOptions toolbarOptions;
  final int? maxLength;
  final int? minLines;
  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final ScrollPhysics? scrollPhysics;
  final StrutStyle? strutStyle;
  final TextSelectionThemeData? textSelectionTheme;
  final MouseCursor? mouseCursor;
  final TextInputType? keyboardType;

  factory TextFieldConfig.fromMap(Map<String, dynamic> map) {
    return TextFieldConfig(
      theme: ThemeDecoder.decodeInputDecorationTheme(map['theme']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': ComponentType.button.value,
      'theme': ThemeEncoder.encodeInputDecorationTheme(theme),
      'textAlign': ThemeEncoder.encodeTextAlign(textAlign),
      'clip': ThemeEncoder.encodeClip(clip),
      'textStyle': ThemeEncoder.encodeTextStyle(textStyle),
      'textDirection': ThemeEncoder.encodeTextDirection(textDirection),
      'toolBarOptions': ThemeEncoder.encodeToolbarOptions(toolbarOptions),
      'textAlignVertical':
          ThemeEncoder.encodeTextAlignVertical(textAlignVertical),
      'textCapitalization':
          ThemeEncoder.encodeTextCapitalization(textCapitalization),
      'textInputAction': ThemeEncoder.encodeTextInputAction(textInputAction),
      'scrollPhysics': ThemeEncoder.encodeScrollPhysics(scrollPhysics),
      'textSelectionTheme':
          ThemeEncoder.encodeTextSelectionThemeData(textSelectionTheme),
      'strutStyle': ThemeEncoder.encodeStrutStyle(strutStyle),
      'mouseCursor': ThemeEncoder.encodeMouseCursor(mouseCursor),
      'keyboardType': ThemeEncoder.encodeTextInputType(keyboardType),
      'minLines': minLines,
      'maxLines': maxLines,
      'maxLength': maxLength,
      'cursorHeight': cursorHeight,
      'cursorWidth': cursorWidth,
      'cursorRadius': ThemeEncoder.encodeRadius(cursorRadius),
    };
  }

  TextFieldConfig copyWith({
    InputDecorationTheme? theme,
  }) {
    return TextFieldConfig(
      theme: theme ?? this.theme,
    );
  }
}
