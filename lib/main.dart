import 'package:calculator_flutter/util/solve_equation.dart';
import 'package:calculator_flutter/widget/calc_button.dart';
import 'package:calculator_flutter/widget/calculation_entry.dart';
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

  List<CalculationEntry> pastResults = [];

  int numberFieldKeyValue = 0;
  void Function()? performOperation(Operation op) =>
      numberField == null
          ? null
          : () {
            setState(() {
              numbers.add(numberField!);
              operations.add(op);
              numberField = null;
              numberFieldKeyValue++;
            });
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
                  key: ValueKey(numberFieldKeyValue),
                  init: numberField,
                  onChanged: (val) => setState(() => numberField = val),
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.plus),
                      onPressed: performOperation(Operation.add),
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.minus),
                      onPressed: performOperation(Operation.subtract),
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.xmark),
                      onPressed: performOperation(Operation.multiply),
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.divide),
                      onPressed: performOperation(Operation.divide),
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.deleteLeft),
                      onPressed:
                          numbers.isEmpty
                              ? numberField == null
                                  ? null
                                  : () => setState(() {
                                    numberField = null;
                                    numberFieldKeyValue++;
                                  })
                              : () => setState(() {
                                numberField = numbers.lastOrNull;
                                numbers.removeLast();
                                operations.removeLast();
                                numberFieldKeyValue++;
                              }),
                    ),
                    CalcButton(
                      icon: FaIcon(FontAwesomeIcons.equals),
                      onPressed:
                          numberField == null || operations.isEmpty
                              ? null
                              : () => setState(() {
                                pastResults.add(
                                  CalculationEntry(
                                    // Spread operator to duplicate lists
                                    numbers: [...numbers, numberField!],
                                    operations: [...operations],
                                  ),
                                );
                                numberField = null;
                                numbers.clear();
                                operations.clear();
                                numberFieldKeyValue++;
                              }),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      CalculationEntry(
                        numbers: [...numbers, numberField],
                        editing: true,
                        operations: operations,
                      ),
                      if (pastResults.isNotEmpty) Divider(),
                      ...pastResults,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
