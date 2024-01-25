// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../configs/chip_config.dart';
import '../core_widget.dart';

abstract class CoreChip extends CoreWidget<ChipConfig> {
  const CoreChip({
    super.key,
    super.name,
    required this.label,
    this.focusNode,
    this.avatar,
    this.deleteIcon,
    this.onDeleted,
    this.deleteButtonTooltipMessage,
  });

  final Widget label;
  final FocusNode? focusNode;
  final Widget? avatar;
  final Widget? deleteIcon;
  final VoidCallback? onDeleted;
  final String? deleteButtonTooltipMessage;

  @override
  Widget render(BuildContext context, ChipConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(chipTheme: config.theme),
      child: Chip(
        label: label,
        focusNode: focusNode,
        avatar: avatar,
        deleteButtonTooltipMessage: deleteButtonTooltipMessage,
        deleteIcon: deleteIcon ?? Icon(config.defaultDeleteIcon),
        onDeleted: onDeleted,
        materialTapTargetSize: config.materialTapTargetSize,
        clipBehavior: config.clipBehaviour,
        visualDensity: config.visualDensity,
        autofocus: config.autofocus,
      ),
    );
  }
}
