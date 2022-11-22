import 'package:acme_theme_provider/src/core/configs/app_bar_config.dart';
import 'package:acme_theme_provider/src/core/core_widget.dart';
import 'package:flutter/material.dart';

class CoreAppBar<T extends Object> extends CoreWidget<T> {
  const CoreAppBar({
    super.key,
    required super.parent,
    required this.title,
    this.leading,
    this.actions,
    this.flexibleSpace,
    this.shapeBorder,
  });

  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final ShapeBorder? shapeBorder;

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
        actions: widget.actions,
        flexibleSpace: widget.flexibleSpace,
        shape: widget.shapeBorder,
        elevation: config.elevation,
        scrolledUnderElevation: config.scrolledUnderElevation,
        titleSpacing: config.titleSpacing,
        toolbarHeight: config.toolbarHeight,
        leadingWidth: config.leadingWidth,
        toolbarOpacity: config.toolbarOpacity,
        bottomOpacity: config.bottomOpacity,
        bottom: bottom,
      ),
    );
  }
}
