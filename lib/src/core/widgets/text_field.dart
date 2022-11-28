import 'package:acme_theme_provider/src/core/configs/text_field_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreTextField<T extends Object> extends CoreWidget<T> {
  const CoreTextField({
    super.key,
    required super.parent,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.inputDecoration,
    this.controller,
    this.autofillHints,
    this.buildCounter,
    this.restorationId,
    this.scrollController,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.selectionControls,
  });

  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final InputDecoration? inputDecoration;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final InputCounterWidgetBuilder? buildCounter;
  final String? restorationId;
  final ScrollController? scrollController;
  final TextSelectionControls? selectionControls;
  final AppPrivateCommandCallback? onAppPrivateCommand;

  @override
  CoreState<CoreTextField, TextFieldConfig> createState() =>
      _CoreTextFieldState();
}

class _CoreTextFieldState extends CoreState<CoreTextField, TextFieldConfig> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: config.theme,
        textSelectionTheme: config.textSelectionTheme,
      ),
      child: TextField(
        style: config.textStyle,
        clipBehavior: config.clip,
        textAlign: config.textAlign,
        maxLines: config.maxLines,
        textDirection: config.textDirection,
        toolbarOptions: config.toolbarOptions,
        maxLength: config.maxLength,
        autofillHints: widget.autofillHints,
        buildCounter: widget.buildCounter,
        cursorHeight: config.cursorHeight,
        cursorRadius: config.cursorRadius,
        cursorWidth: config.cursorWidth,
        keyboardType: config.keyboardType,
        minLines: config.minLines,
        mouseCursor: config.mouseCursor,
        scrollPhysics: config.scrollPhysics,
        strutStyle: config.strutStyle,
        textAlignVertical: config.textAlignVertical,
        textCapitalization: config.textCapitalization,
        textInputAction: config.textInputAction,
        onTap: widget.onTap,
        decoration: widget.inputDecoration,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        selectionControls: widget.selectionControls,
        onAppPrivateCommand: widget.onAppPrivateCommand,
        onSubmitted: widget.onSubmitted,
        restorationId: widget.restorationId,
        scrollController: widget.scrollController,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
