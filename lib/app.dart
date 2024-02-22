import 'package:flutter/material.dart';
import 'package:simple_todo/UI/home.dart';

import 'UI/todos.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
