import 'package:acme_theme_provider/acme_theme_provider.dart';
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
            child: AcmeThemeProvider.asset(
              path: 'assets/example-theme.acme',
              overrideFn: (theme) => theme.copyWith(themeMode: ThemeMode.light),
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
            child: AcmeThemeProvider.network(
              url:
                  'https://gist.githubusercontent.com/sarbagya-acme/590775de1d3866d2a0250bb192e6b585/raw/6195c092fdb9478a7498294059e781bc5d2d8a92/gistfile1.txt',
              overrideFn: (theme) => theme.copyWith(themeMode: ThemeMode.light),
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
          )
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
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
