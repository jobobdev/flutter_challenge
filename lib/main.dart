import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE64D3D),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Color(0xffE64D3D)),
          titleSmall: TextStyle(color: Colors.white),
        ),
        cardColor: const Color(0xFFFFFFFF),
      ),
      home: const HomeScreen(),
    );
  }
}
