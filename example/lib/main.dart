import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:example/brand_colors.dart';
import 'package:example/providers.dart';
import 'package:example/routes.dart';
import 'package:flutter/material.dart';

void main() {
  loadProviders();
  runApp(
    SampleThemeApp(
      themeMode: ThemeMode.light,
      themeData: ThemeData.light(),
      darkThemeData: ThemeData.dark(),
      onSettingIconPressed: () {
        print('setting pressed');
      },
    ),
  );
}

class SampleThemeApp extends StatelessWidget {
  final ThemeMode themeMode;
  final ThemeData? themeData;
  final ThemeData? darkThemeData;
  final VoidCallback onSettingIconPressed;

  const SampleThemeApp({
    super.key,
    required this.themeMode,
    required this.themeData,
    required this.darkThemeData,
    required this.onSettingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListenerScope(
      onSettingPressed: onSettingIconPressed,
      child: AppProvidersContainer(
        providersContext: providersContext,
        child: ThemeScope(
          notifier: ThemeNotifier(),
          child: Builder(
            builder: (context) {
              return AcmeThemeProvider<BrandColors>.asset(
                path: ThemeScope.of(context).assetPath,
                customColorsConverterCreator: BrandColorsConverter.new,
                builder: (context, theme) {
                  return AppRouterScope(
                    builder: (context) => MaterialApp.router(
                      title: 'Twitter Clone App',
                      theme: themeData,
                      darkTheme: darkThemeData,
                      themeMode: themeMode,
                      routerConfig: context.router.config,
                    ),
                    create: () => NoteRouter(),
                  );
                },
              );
            },
          ),
        ),
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

  static ThemeNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(scope != null);
    return scope!.notifier!;
  }
}

class SettingsListenerScope extends InheritedWidget {
  const SettingsListenerScope({
    super.key,
    required super.child,
    required this.onSettingPressed,
  });

  final VoidCallback onSettingPressed;

  static SettingsListenerScope of(BuildContext context) {
    final SettingsListenerScope? result =
        context.dependOnInheritedWidgetOfExactType<SettingsListenerScope>();
    assert(result != null, 'No SettingsListner found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SettingsListenerScope old) {
    return false;
  }
}
