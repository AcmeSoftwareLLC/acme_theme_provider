import 'package:acme_theme_provider/src/core/component_config.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class TextFieldConfig extends ComponentConfig {
  const TextFieldConfig({
    required this.theme,
    required this.textAlign,
    required this.clip,
    required this.textStyle,
    required this.textDirection,
    required this.maxLines,
    required this.toolbarOptions,
    required this.maxLength,
    required this.minLines,
    required this.cursorHeight,
    required this.cursorWidth,
    required this.cursorRadius,
    required this.textAlignVertical,
    required this.textCapitalization,
    required this.textInputAction,
    required this.scrollPhysics,
    required this.strutStyle,
    required this.textSelectionTheme,
    required this.mouseCursor,
    required this.keyboardType,
  });

  final InputDecorationTheme? theme;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Clip clip;
  final TextDirection? textDirection;
  final int? maxLines;
  final ToolbarOptions? toolbarOptions;
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
      textAlign:
          ThemeDecoder.decodeTextAlign(map['textAlign']) ?? TextAlign.start,
      clip: ThemeDecoder.decodeClip(map['clip']) ?? Clip.hardEdge,
      textStyle: ThemeDecoder.decodeTextStyle(map['textStyle']),
      textDirection: ThemeDecoder.decodeTextDirection(map['textDirection']),
      maxLines: map['maxLines'],
      toolbarOptions: ThemeDecoder.decodeToolbarOptions(map['toolBarOptions']),
      maxLength: map['maxLength'],
      minLines: map['minLines'],
      cursorHeight: map['cursorHeight'],
      cursorWidth: map['cursorWidth'] ?? 2.0,
      cursorRadius: ThemeDecoder.decodeRadius(map['cursorRadius']),
      textAlignVertical:
          ThemeDecoder.decodeTextAlignVertical(map['textAlignVertical']),
      textCapitalization:
          ThemeDecoder.decodeTextCapitalization(map['textCapitalization']) ??
              TextCapitalization.none,
      textInputAction:
          ThemeDecoder.decodeTextInputAction(map['textInputAction']),
      scrollPhysics: ThemeDecoder.decodeScrollPhysics(map['scrollPhysics']),
      strutStyle: ThemeDecoder.decodeStrutStyle(map['strutStyle']),
      textSelectionTheme:
          ThemeDecoder.decodeTextSelectionThemeData(map['textSelectionTheme']),
      mouseCursor: ThemeDecoder.decodeMouseCursor(map['mouseCursor']),
      keyboardType: ThemeDecoder.decodeTextInputType(map['keyboardType']),
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
    TextAlign? textAlign,
    TextStyle? textStyle,
    Clip? clip,
    TextDirection? textDirection,
    int? maxLines,
    ToolbarOptions? toolbarOptions,
    int? maxLength,
    int? minLines,
    double? cursorHeight,
    double? cursorWidth,
    Radius? cursorRadius,
    TextAlignVertical? textAlignVertical,
    TextCapitalization? textCapitalization,
    TextInputAction? textInputAction,
    ScrollPhysics? scrollPhysics,
    StrutStyle? strutStyle,
    TextSelectionThemeData? textSelectionTheme,
    MouseCursor? mouseCursor,
    TextInputType? keyboardType,
  }) {
    return TextFieldConfig(
      theme: theme ?? this.theme,
      textAlign: textAlign ?? this.textAlign,
      clip: clip ?? this.clip,
      textStyle: textStyle ?? this.textStyle,
      textDirection: textDirection ?? this.textDirection,
      maxLines: maxLines ?? this.maxLines,
      toolbarOptions: toolbarOptions ?? this.toolbarOptions,
      maxLength: maxLength ?? this.maxLength,
      minLines: minLines ?? this.minLines,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      textInputAction: textInputAction ?? this.textInputAction,
      scrollPhysics: scrollPhysics ?? this.scrollPhysics,
      strutStyle: strutStyle ?? this.strutStyle,
      textSelectionTheme: textSelectionTheme ?? this.textSelectionTheme,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      keyboardType: keyboardType ?? this.keyboardType,
    );
  }
}
