import 'package:calculator_flutter/widget/calc_button.dart';
import 'package:calculator_flutter/widget/number_input.dart';
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
  List<double> numbers = [];
  List<Operation> operations = [];

  void Function()? get add =>
      numberField == null
          ? null
          : () {
            numbers.add(numberField!);
            operations.add(Operation.add);
          };
  void Function()? get subtract =>
      numberField == null
          ? null
          : () {
            numbers.add(numberField!);
            operations.add(Operation.subtract);
          };
  void Function()? get multiply =>
      numberField == null
          ? null
          : () {
            numbers.add(numberField!);
            operations.add(Operation.multiply);
          };
  void Function()? get divide =>
      numberField == null
          ? null
          : () {
            numbers.add(numberField!);
            operations.add(Operation.divide);
          };

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
                NumberInput(
                  onChanged: (val) => setState(() => numberField = val),
                ),
                Row(
                  spacing: 20,
                  children: [
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.plus),
                      onPressed: add,
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.minus),
                      onPressed: subtract,
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.xmark),
                      onPressed: divide,
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.divide),
                      onPressed: divide,
                    ),
                  ],
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text.rich(TextSpan()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Operation { add, subtract, multiply, divide }
