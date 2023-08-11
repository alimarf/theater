import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app.dart';

import 'initializer.dart';

void main() async {
  runApp(const App());

  await Initializer.init();
}
