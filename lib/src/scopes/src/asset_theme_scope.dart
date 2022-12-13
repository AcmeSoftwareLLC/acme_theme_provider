// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';

import '../../theme.dart';
import 'acme_theme_scope.dart';

class AssetThemeScope<T extends Object> extends AcmeThemeScope<T> {
  const AssetThemeScope({
    super.key,
    required this.path,
    required super.builder,
    super.overrideFn,
    super.customColorsConverterCreator,
  }) : super(source: path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(source),
      builder: (context, snapshot) {
        AcmeTheme theme;

        if (snapshot.hasData) {
          theme = AcmeTheme<T>.fromJson(
            snapshot.data!,
            customColorsConverterCreator: customColorsConverterCreator,
          );
        } else {
          theme = AcmeTheme<T>.fallback(
            customColorsConverterCreator: customColorsConverterCreator,
          );
        }

        theme = overrideFn?.call(theme) ?? theme;
        return scopedBuilder(context, theme);
      },
    );
  }
}
