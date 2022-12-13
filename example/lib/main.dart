import 'package:acme_theme/acme_theme.dart';
import 'package:example/brand_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            child: AcmeThemeScope<BrandColors>.asset(
              path: 'assets/example-theme.acme',
              overrideFn: (theme) => theme.copyWith(themeMode: ThemeMode.light),
              customColorsConverterCreator: BrandColorsConverter.new,
              builder: (context, theme) {
                return MaterialApp(
                  title: 'Asset Theme Example',
                  theme: theme.lightTheme,
                  darkTheme: theme.darkTheme,
                  themeMode: theme.themeMode,
                  home: const MyHomePage(title: 'Asset Theme Example'),
                );
              },
            ),
          ),
          Expanded(
            child: AcmeThemeScope<BrandColors>.network(
              url:
                  'https://raw.githubusercontent.com/MattHamburger/acme_theme_provider/sarbagya/custom-colors/example/assets/example-theme.acme',
              overrideFn: (theme) => theme.copyWith(themeMode: ThemeMode.dark),
              customColorsConverterCreator: BrandColorsConverter.new,
              builder: (context, theme) {
                return MaterialApp(
                  title: 'Network Theme Example',
                  theme: theme.lightTheme,
                  darkTheme: theme.darkTheme,
                  themeMode: theme.themeMode,
                  home: const MyHomePage(title: 'Network Theme Example'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: BrandColors.of(context).live.color),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: BrandColors.of(context).dead.color,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
