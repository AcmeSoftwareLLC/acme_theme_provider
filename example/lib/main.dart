import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/brand_colors.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

void main() {
  loadProviders();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      child: AcmeThemeProvider<BrandColors>.asset(
        path: 'assets/example-theme.acme',
        overrideFn: (theme) => theme.copyWith(themeMode: ThemeMode.light),
        customColorsConverterCreator: BrandColorsConverter.new,
        builder: (context, theme) {
          return AppRouterScope(
            builder: (context) => MaterialApp.router(
              title: 'Notes Example App',
              theme: theme.lightTheme,
              darkTheme: theme.darkTheme,
              themeMode: theme.themeMode,
              routerConfig: context.router.config,
            ), create: () => NoteRouter(),
          );
        },
      ),
    );
  }
}
