import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:acme_theme_example/main.dart';

void main() {
  testWidgets('Sample app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      SampleThemeApp(
        themeMode: ThemeMode.light,
        themeData: ThemeData.light(useMaterial3: true),
        darkThemeData: ThemeData.dark(useMaterial3: true),
        onIconPressed: () {},
        isOnThemeBuilder: false,
      ),
    );

    expect(find.text('Tweets'), findsOneWidget);
  });
}
