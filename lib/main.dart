import 'package:calculator_flutter/widget/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 20),
          bodySmall: TextStyle(fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Calculator"))),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            color: Color.from(alpha: 1, red: 0.863, green: 0.882, blue: 0.922),
            child: Calculator(),
          ),
        ),
      ),
    );
  }
}
