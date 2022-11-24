import 'package:acme_theme_provider/src/core/configs/dropdown_button_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreDropdownButton<T extends Object> extends CoreWidget<T> {
  const CoreDropdownButton({
    super.key,
    required super.parent,
    this.alignment = AlignmentDirectional.centerStart,
    this.items,
    this.onChanged,
    this.onTap,
    this.selectedItemBuilder,
    this.disabledHint,
    this.focusNode,
    this.value,
    this.icon,
    this.hint,
    this.underline,
  });

  final DropdownButtonBuilder? selectedItemBuilder;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final AlignmentGeometry alignment;
  final VoidCallback? onTap;
  final Widget? icon;
  final Widget? underline;
  final Widget? hint;
  final Widget? disabledHint;
  final FocusNode? focusNode;
  final T? value;

  @override
  CoreState<CoreDropdownButton, DropdownButtonConfig> createState() =>
      _CoreDropdownButtonState();
}

class _CoreDropdownButtonState
    extends CoreState<CoreDropdownButton, DropdownButtonConfig> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: config.style,
      autofocus: config.autofocus,
      elevation: config.elevation,
      isDense: config.isDense,
      borderRadius: config.borderRadius,
      isExpanded: config.isExpanded,
      dropdownColor: config.dropdownColor,
      enableFeedback: config.enabledFeedback,
      focusColor: config.focusColor,
      iconDisabledColor: config.iconDisabledColor,
      iconEnabledColor: config.iconEnabledColor,
      iconSize: config.iconSize,
      itemHeight: config.itemHeight,
      menuMaxHeight: config.menuMaxHeight,
      value: widget.value,
      icon: widget.icon,
      underline: widget.underline,
      hint: widget.hint,
      focusNode: widget.focusNode,
      alignment: widget.alignment,
      disabledHint: widget.disabledHint,
      items: widget.items,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      selectedItemBuilder: widget.selectedItemBuilder,
    );
  }
}
