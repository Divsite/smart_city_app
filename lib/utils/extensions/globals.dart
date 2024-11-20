library global;

import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';

Alice globalAlice = Alice(
  showNotification: !kReleaseMode,
  showInspectorOnShake: !kReleaseMode,
  maxCallsCount: 1000,
);