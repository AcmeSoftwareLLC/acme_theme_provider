// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/widgets.dart';

import 'theme.dart';

/// Signature which creates a [Widget] based on the [AcmeTheme].
typedef ThemedWidgetBuilder = Widget Function(BuildContext, AcmeTheme);

typedef ThemeOverride = AcmeTheme Function(AcmeTheme);
