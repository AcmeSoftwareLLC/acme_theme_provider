import 'package:flutter/material.dart';

import '../../../acme_theme.dart';
import '../core_widget.dart';

abstract class CoreAppBar extends AppBar implements CoreWidget<AppBarConfig> {
  CoreAppBar({
    super.key,
    super.title,
    this.name,
    super.leading,
    super.actions,
    super.flexibleSpace,
    super.toolbarHeight,
    super.bottom,
  });

  @override
  final String? name;

  @override
  State<CoreAppBar> createState() => _CoreAppBarState();

  @override
  Widget render(BuildContext context, AppBarConfig config) {
    final dividerConfig = config.divider;
    final dividerThickness = dividerConfig?.thickness;

    final bottomWidget = dividerConfig == null || dividerThickness == null
        ? null
        : PreferredSize(
            preferredSize: Size.fromHeight(
              dividerThickness + (bottom?.preferredSize.height ?? 0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 0,
                  thickness: dividerThickness,
                  color: dividerConfig.color,
                ),
                if (bottom != null) bottom!,
              ],
            ),
          );

    return Theme(
      data: Theme.of(context).copyWith(appBarTheme: config.theme),
      child: AppBar(
        leading: leading,
        title: title,
        actions: actions,
        flexibleSpace: flexibleSpace,
        leadingWidth: config.leadingWidth,
        toolbarOpacity: config.toolbarOpacity,
        bottomOpacity: config.bottomOpacity,
        bottom: bottomWidget,
        toolbarHeight: toolbarHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context, Widget child) => child;
}

class _CoreAppBarState extends State<CoreAppBar> {
  @override
  Widget build(BuildContext context) {
    final child = widget.render(
      context,
      context.config<AppBarConfig>(
        widget.name ?? widget.runtimeType.toString(),
      ),
    );

    return widget.build(context, child);
  }
}
