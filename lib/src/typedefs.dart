import 'package:flutter/widgets.dart';

import 'theme.dart';

typedef ThemedWidgetBuilder = Widget Function(BuildContext, AcmeTheme);
typedef ThemeOverride = AcmeTheme Function(AcmeTheme);
