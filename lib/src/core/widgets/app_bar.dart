import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:flutter/material.dart';

import '../configs/app_bar_config.dart';

class CoreAppBar extends StatefulWidget {
  const CoreAppBar({
    super.key,
    required this.parent,
    required this.title,
    this.leading,
  });

  final Widget parent;
  final Widget title;
  final Widget? leading;

  @override
  State<CoreAppBar> createState() => _CoreAppBarState();
}

class _CoreAppBarState extends State<CoreAppBar> {
  bool _configInitialized = false;
  late final AppBarConfig config;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_configInitialized) {
      config = context.config(widget.parent.runtimeType.toString());
      _configInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      title: widget.title,
      backgroundColor: config.theme.backgroundColor,
    );
  }
}
