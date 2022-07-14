library acme_theme_provider;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/asset_theme_provider.dart';
import 'src/custom_colors.dart';
import 'src/network_theme_provider.dart';
import 'src/typedefs.dart';

export 'src/custom_colors.dart';

abstract class AcmeThemeProvider<T extends Object> extends StatelessWidget {
  final String source;
  final ThemedWidgetBuilder builder;
  final ThemeOverride? overrideFn;
  final CustomColorsConverterCreator<T>? customColorsConverterCreator;

  const AcmeThemeProvider({
    super.key,
    required this.source,
    required this.builder,
    this.overrideFn,
    this.customColorsConverterCreator,
  });

  factory AcmeThemeProvider.asset({
    Key? key,
    required String path,
    required ThemedWidgetBuilder builder,
    ThemeOverride? overrideFn,
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) = AssetThemeProvider;

  factory AcmeThemeProvider.network({
    Key? key,
    required String url,
    required ThemedWidgetBuilder builder,
    ThemeOverride? overrideFn,
    Map<String, String>? headers,
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) = NetworkThemeProvider;

  static Future<void> prefetchAsset(String assetPath) async {
    await rootBundle.loadString(assetPath);
  }
}
