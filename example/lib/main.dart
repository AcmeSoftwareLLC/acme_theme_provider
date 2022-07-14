import 'package:acme_theme_provider/acme_theme_provider.dart';
import 'package:example/brand_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            child: AcmeThemeProvider<BrandColors>.asset(
              path: 'assets/example-theme.acme',
              overrideFn: (theme) => theme.copyWith(themeMode: ThemeMode.light),
              customColorsConverterCreator: BrandColorsConverter.new,
              builder: (context, theme) {
                return MaterialApp(
                  title: 'Asset Theme Example',
                  theme: theme.lightTheme,
                  darkTheme: theme.darkTheme,
                  themeMode: theme.themeMode,
                  home: MyHomePage(title: 'Asset Theme Example'),
                );
              },
            ),
          ),
          Expanded(
            child: AcmeThemeProvider<BrandColors>.network(
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
                  home: MyHomePage(title: 'Network Theme Example'),
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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
              style: TextStyle(color: BrandColors.of(context).live),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: BrandColors.of(context).dead,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
