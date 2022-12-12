import 'package:acme_theme/src/core/component_config.dart';
import 'package:acme_theme/src/custom_colors.dart';
import 'package:acme_theme/src/theme.dart';
import 'package:acme_theme/src/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'acme_component_scope.dart';
import 'asset_theme_scope.dart';
import 'network_theme_scope.dart';

class AcmeThemeScope<T extends Object> extends StatelessWidget {
  final String source;
  final ThemedWidgetBuilder builder;
  final ThemeOverride? overrideFn;
  final CustomColorsConverterCreator<T>? customColorsConverterCreator;

  const AcmeThemeScope({
    super.key,
    required this.source,
    required this.builder,
    this.overrideFn,
    this.customColorsConverterCreator,
  });

  const factory AcmeThemeScope.asset({
    Key? key,
    required String path,
    required ThemedWidgetBuilder builder,
    ThemeOverride? overrideFn,
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) = AssetThemeScope;

  factory AcmeThemeScope.network({
    Key? key,
    required String url,
    required ThemedWidgetBuilder builder,
    String? fallbackAssetPath,
    ThemeOverride? overrideFn,
    Map<String, String>? headers,
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
    String cacheKey,
  }) = NetworkThemeScope;

  @override
  Widget build(BuildContext context) {
    return scopedBuilder(context, AcmeTheme.fromJson(source));
  }

  Widget scopedBuilder(BuildContext context, AcmeTheme theme) {
    return AcmeComponentScope(
      components: theme.components,
      child: builder(context, theme),
    );
  }

  static Future<void> prefetchAsset(String assetPath) async {
    await rootBundle.loadString(assetPath);
  }

  static T componentOf<T extends ComponentConfig>(
    BuildContext context,
    String name,
  ) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AcmeComponentScope>();
    final components = result?.components;

    assert(components != null, '\n\nNo AcmeThemeProvider found in context\n');
    assert(
      components!.containsKey(name),
      '\n\nNo configuration found for "$name".\n\n'
      'Please ensure that config for the component is present in the theme json.\n',
    );

    return components![name] as T;
  }
}
