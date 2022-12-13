import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../configs/dropdown_button_config.dart';
import '../core_widget.dart';

abstract class CoreDropdownButton<T> extends CoreWidget<DropdownButtonConfig> {
  const CoreDropdownButton({
    super.key,
    super.name,
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
  @nonVirtual
  Widget render(BuildContext context, DropdownButtonConfig config) {
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
      value: value,
      icon: icon,
      underline: underline,
      hint: hint,
      focusNode: focusNode,
      alignment: alignment,
      disabledHint: disabledHint,
      items: items,
      onChanged: onChanged,
      onTap: onTap,
      selectedItemBuilder: selectedItemBuilder,
    );
  }
}
