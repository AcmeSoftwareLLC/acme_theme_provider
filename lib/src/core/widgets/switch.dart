// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../configs/switch_config.dart';
import '../core_widget.dart';

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
      child: config.adaptive
          ? Switch.adaptive(
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
            )
          : Switch(
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
