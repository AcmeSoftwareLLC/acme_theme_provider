// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../configs/dropdown_menu_config.dart';
import '../core_widget.dart';

abstract class CoreDropdownMenu<T> extends CoreWidget<DropdownMenuConfig> {
  const CoreDropdownMenu({
    super.key,
    super.name,
    this.enabled = true,
    this.enableFilter = false,
    this.enableSearch = true,
    this.leadingIcon,
    this.trailingIcon,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.selectedTrailingIcon,
    this.controller,
    this.initialSelection,
    this.onSelected,
    required this.dropdownMenuEntries,
  });

  final bool enabled;
  final bool enableFilter;
  final bool enableSearch;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? selectedTrailingIcon;
  final TextEditingController? controller;
  final dynamic initialSelection;
  final void Function(dynamic)? onSelected;
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;

  @override
  @nonVirtual
  Widget render(BuildContext context, DropdownMenuConfig config) {
    return DropdownMenu(
      width: config.width,
      menuHeight: config.menuHeight,
      textStyle: config.textStyle,
      inputDecorationTheme: config.inputDecorationTheme,
      menuStyle: config.menuStyle,
      requestFocusOnTap: config.requestFocusOnTap,
      expandedInsets: config.expandedInsets,
      enabled: enabled,
      enableFilter: enableFilter,
      enableSearch: enableSearch,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      label: label,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      selectedTrailingIcon: selectedTrailingIcon,
      controller: controller,
      initialSelection: initialSelection,
      onSelected: onSelected,
      dropdownMenuEntries: dropdownMenuEntries,
    );
  }
}
