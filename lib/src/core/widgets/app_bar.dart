import 'package:acme_theme_provider/src/core/configs/app_bar_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreAppBar extends CoreWidget {
  const CoreAppBar({
    super.key,
    required super.parent,
    required this.title,
    this.leading,
  });

  final Widget title;
  final Widget? leading;

  @override
  CoreState<CoreAppBar, AppBarConfig> createState() => _CoreAppBarState();
}

class _CoreAppBarState extends CoreState<CoreAppBar, AppBarConfig> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      title: widget.title,
      backgroundColor: config.theme.backgroundColor,
    );
  }
}
