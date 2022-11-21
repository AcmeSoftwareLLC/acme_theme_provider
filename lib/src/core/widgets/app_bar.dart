import 'package:acme_theme_provider/src/core/configs/app_bar_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreAppBar<T extends Object> extends CoreWidget<T> {
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
    final dividerConfig = config.divider;
    final dividerThickness = dividerConfig?.thickness;

    final bottom = dividerConfig == null || dividerThickness == null
        ? null
        : PreferredSize(
            preferredSize: Size.fromHeight(dividerThickness),
            child: Divider(
              height: 0,
              thickness: dividerThickness,
              color: dividerConfig.color,
            ),
          );

    return Theme(
      data: Theme.of(context).copyWith(appBarTheme: config.theme),
      child: AppBar(
        leading: widget.leading,
        title: widget.title,
        bottom: bottom,
      ),
    );
  }
}
