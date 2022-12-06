import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/brand_colors.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

void main() {
  loadProviders();
  runApp(SampleThemeApp());
}

class SampleThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      child: ThemeScope(
        notifier: ThemeNotifier(),
        child: Builder(builder: (context) {
          return AcmeThemeProvider<BrandColors>.asset(
            path: ThemeScope.of(context).assetPath,
            customColorsConverterCreator: BrandColorsConverter.new,
            builder: (context, theme) {
              return AppRouterScope(
                builder: (context) => MaterialApp.router(
                  title: 'Twitter Clone App',
                  theme: theme.lightTheme,
                  darkTheme: theme.darkTheme,
                  themeMode: theme.themeMode,
                  routerConfig: context.router.config,
                ),
                create: () => NoteRouter(),
              );
            },
          );
        },),
      ),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  String _assetPath = 'assets/example-theme.acme';

  String get assetPath => _assetPath;

  void changeAsset(String assetPath) {
    if (_assetPath != assetPath) {
      _assetPath = assetPath;
      notifyListeners();
    }
  }
}

class ThemeScope extends InheritedNotifier<ThemeNotifier> {
  ThemeScope({
    required super.notifier,
    required super.child,
  });



  static ThemeNotifier of(BuildContext context){
    final scope = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert (scope != null);
    return scope!.notifier!;
  }
}
