import 'package:calculator_flutter/number_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double? numberField;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                NumberInput(onChanged: (val) => numberField),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      flex: 1,
                      child: FilledButton(
                        onPressed: () {},
                        child: FaIcon(FontAwesomeIcons.plus),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FilledButton(
                        onPressed: () {},
                        child: FaIcon(FontAwesomeIcons.minus),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FilledButton(
                        onPressed: () {},
                        child: FaIcon(FontAwesomeIcons.xmark),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FilledButton(
                        onPressed: () {},
                        child: FaIcon(FontAwesomeIcons.divide),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
