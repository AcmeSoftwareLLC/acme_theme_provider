// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/component_config.dart';
import '../../custom_colors.dart';
import '../../theme.dart';
import '../../typedefs.dart';
import 'acme_component_scope.dart';
import 'asset_theme_scope.dart';
import 'network_theme_scope.dart';

/// A [Widget] that provides a [AcmeThemeData] to its descendants.
class AcmeThemeScope<T extends Object> extends StatelessWidget {
  final String source;
  final ThemedWidgetBuilder builder;
  final ThemeOverride? overrideFn;
  final CustomColorsConverterCreator<T>? customColorsConverterCreator;

  /// Creates an [AcmeThemeScope] that provides a [AcmeThemeData] to its descendants.
  const AcmeThemeScope({
    super.key,
    required this.source,
    required this.builder,
    this.overrideFn,
    this.customColorsConverterCreator,
  });

  /// Creates an [AcmeThemeData] from the provided asset [path].
  const factory AcmeThemeScope.asset({
    Key? key,
    required String path,
    required ThemedWidgetBuilder builder,
    ThemeOverride? overrideFn,
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
  }) = AssetThemeScope;

  /// Creates an [AcmeThemeData] from the provided network [url].
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
    return scopedBuilder(context, AcmeThemeData.fromJson(source));
  }

  /// Builds the widget tree with [AcmeComponentScope].
  Widget scopedBuilder(BuildContext context, AcmeThemeData theme) {
    return AcmeComponentScope(
      components: theme.components,
      child: builder(context, theme),
    );
  }

  /// Loads the resource from [assetPath] and caches it.
  static Future<void> prefetchAsset(String assetPath) async {
    await rootBundle.loadString(assetPath);
  }

  /// Returns the [ComponentConfig] for the [name].
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
