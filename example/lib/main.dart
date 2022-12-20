import 'package:acme_theme/acme_theme.dart';
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
      themeData: ThemeData.light(useMaterial3: true),
      darkThemeData: ThemeData.dark(useMaterial3: true),
      onIconPressed: () {},
      isOnThemeBuilder: false,
    ),
  );
}

class SampleThemeApp extends StatelessWidget {
  final ThemeMode themeMode;
  final ThemeData? themeData;
  final ThemeData? darkThemeData;
  final VoidCallback onIconPressed;
  final bool isOnThemeBuilder;

  const SampleThemeApp({
    super.key,
    required this.themeMode,
    required this.themeData,
    required this.darkThemeData,
    required this.onIconPressed,
    required this.isOnThemeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SampleAppListenerScope(
      onIconPressed: onIconPressed,
      isOnThemeBuilder: isOnThemeBuilder,
      child: AppProvidersContainer(
        providersContext: providersContext,
        child: ThemeScope(
          notifier: ThemeNotifier(),
          child: Builder(
            builder: (context) {
              return AcmeThemeScope<BrandColors>.asset(
                path: ThemeScope.of(context).assetPath,
                customColorsConverterCreator: BrandColorsConverter.new,
                builder: (context, theme) {
                  return AppRouterScope(
                    builder: (context) => MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      useInheritedMediaQuery: true,
                      title: 'Twitter Clone App',
                      theme: isOnThemeBuilder ? themeData : theme.lightTheme,
                      darkTheme:
                          isOnThemeBuilder ? darkThemeData : theme.darkTheme,
                      themeMode: isOnThemeBuilder ? themeMode : theme.themeMode,
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
  const ThemeScope({
    super.key,
    required super.notifier,
    required super.child,
  });

  static ThemeNotifier of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(scope != null);
    return scope!.notifier!;
  }
}

class SampleAppListenerScope extends InheritedWidget {
  const SampleAppListenerScope({
    super.key,
    required super.child,
    required this.onIconPressed,
    required this.isOnThemeBuilder,
  });

  final VoidCallback onIconPressed;
  final bool isOnThemeBuilder;

  static SampleAppListenerScope of(BuildContext context) {
    final SampleAppListenerScope? result =
        context.dependOnInheritedWidgetOfExactType<SampleAppListenerScope>();
    assert(result != null, 'No SettingsListner found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SampleAppListenerScope oldWidget) {
    return false;
  }
}
