// Copyright (c) 2022. Acme Software LLC. All rights reserved.

import 'package:flutter/widgets.dart';

import 'theme.dart';

/// Signature to create a [Widget] based on the [AcmeThemeData].
typedef ThemedWidgetBuilder = Widget Function(BuildContext, AcmeThemeData);

/// Signature to create a new [AcmeThemeData] based on the resolved [AcmeThemeData].
typedef ThemeOverride = AcmeThemeData Function(AcmeThemeData);
