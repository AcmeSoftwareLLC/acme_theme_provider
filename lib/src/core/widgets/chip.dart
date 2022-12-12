import 'package:acme_theme_provider/src/core/configs/chip_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

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
        deleteIcon: deleteIcon,
        onDeleted: onDeleted,
        materialTapTargetSize: config.materialTapTargetSize,
        clipBehavior: config.clipBehaviour,
        visualDensity: config.visualDensity,
        autofocus: config.autofocus,
      ),
    );
  }
}
