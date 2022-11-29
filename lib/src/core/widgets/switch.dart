import 'package:acme_theme_provider/src/core/configs/switch_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

abstract class CoreSwitch extends CoreWidget<SwitchConfig> {
  const CoreSwitch({
    super.key,
    super.name,
    required this.value,
    required this.onChanged,
    this.focusNode,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.onActiveThumbImageError,
    this.onInactiveThumbImageError,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final FocusNode? focusNode;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final ImageErrorListener? onActiveThumbImageError;
  final ImageErrorListener? onInactiveThumbImageError;

  @override
  Widget render(BuildContext context, SwitchConfig config) {
    return Theme(
      data: Theme.of(context).copyWith(switchTheme: config.theme),
      child: Switch(
        value: value,
        onChanged: onChanged,
        focusNode: focusNode,
        activeThumbImage: activeThumbImage,
        inactiveThumbImage: inactiveThumbImage,
        onActiveThumbImageError: onActiveThumbImageError,
        onInactiveThumbImageError: onInactiveThumbImageError,
        focusColor: config.focusColor,
        autofocus: config.autofocus,
        dragStartBehavior: config.dragStartBehavior,
        activeColor: config.activeColor,
        activeTrackColor: config.activeTrackColor,
        hoverColor: config.hoverColor,
        inactiveThumbColor: config.inactiveThumbColor,
        inactiveTrackColor: config.inactiveTrackColor,
      ),
    );
  }
}
