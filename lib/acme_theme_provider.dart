library acme_theme_provider;

import 'package:acme_theme_provider/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/providers/asset_theme_provider.dart';
import 'src/core/component_config.dart';
import 'src/custom_colors.dart';
import 'src/providers/network_theme_provider.dart';
import 'src/typedefs.dart';

export 'src/custom_colors.dart';
export 'src/theme.dart' show TextStyleBuilder;

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

  const factory AcmeThemeProvider.asset({
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
    String? fallbackAssetPath,
    ThemeOverride? overrideFn,
    Map<String, String>? headers,
    CustomColorsConverterCreator<T>? customColorsConverterCreator,
    String cacheKey,
  }) = NetworkThemeProvider;

  Widget scopedBuilder(BuildContext context, AcmeTheme theme) {
    return ComponentScope(
      components: theme.components,
      child: builder(context, theme),
    );
  }

  static Future<void> prefetchAsset(String assetPath) async {
    await rootBundle.loadString(assetPath);
  }

  static T _of<T extends ComponentConfig>(BuildContext context, String name) {
    final result = context.dependOnInheritedWidgetOfExactType<ComponentScope>();
    assert(result != null, 'No AcmeThemeProvider found in context');

    return result!.components[name] as T;
  }
}

class ComponentScope extends InheritedWidget {
  const ComponentScope({
    super.key,
    required this.components,
    required super.child,
  });

  final Map<String, ComponentConfig> components;

  @override
  bool updateShouldNotify(ComponentScope oldWidget) {
    return oldWidget.components != components;
  }
}

extension ComponentConfigExtension on BuildContext {
  T config<T extends ComponentConfig>(String name) {
    return AcmeThemeProvider._of<T>(this, name);
  }
}
