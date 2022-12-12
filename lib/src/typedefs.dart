import 'package:acme_theme/src/theme.dart';
import 'package:flutter/widgets.dart';

typedef ThemedWidgetBuilder = Widget Function(BuildContext, AcmeTheme);
typedef ThemeOverride = AcmeTheme Function(AcmeTheme);
