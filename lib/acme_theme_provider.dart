library acme_theme_provider;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/asset_theme_provider.dart';
import 'src/network_theme_provider.dart';
import 'src/typedefs.dart';

abstract class AcmeThemeProvider extends StatelessWidget {
  final String source;
  final ThemedWidgetBuilder builder;
  final ThemeOverride? overrideFn;

  const AcmeThemeProvider({
    Key? key,
    required this.source,
    required this.builder,
    this.overrideFn,
  }) : super(key: key);

  factory AcmeThemeProvider.asset({
    Key? key,
    required String path,
    required ThemedWidgetBuilder builder,
    ThemeOverride? overrideFn,
  }) = AssetThemeProvider;

  factory AcmeThemeProvider.network({
    Key? key,
    required String url,
    required ThemedWidgetBuilder builder,
    ThemeOverride? overrideFn,
    Map<String, String>? headers,
  }) = NetworkThemeProvider;

  static Future<void> prefetchAsset(String assetPath) async {
    await rootBundle.loadString(assetPath);
  }
}
