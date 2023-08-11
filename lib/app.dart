import 'package:flutter/material.dart';

import 'presentation/pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieTrailerPage(),
    );
  }
}