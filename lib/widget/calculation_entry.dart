import 'dart:math';

import 'package:calculator_flutter/util/solve_equation.dart';
import 'package:calculator_flutter/util/util.dart';
import 'package:flutter/material.dart';

class CalculationEntry extends StatelessWidget {
  final List<double?> numbers;
  final List<Operation> operations;
  final bool editing;
  const CalculationEntry({
    super.key,
    required this.numbers,
    required this.operations,
    this.editing = false,
  }) : assert(numbers.length == operations.length + 1);

  @override
  Widget build(BuildContext context) {
    // Alternate between rows and operations
    List<TextSpan> spans = List.generate(max(numbers.length * 2 - 1, 0), (i) {
      String text;
      Color color =
          (editing && i >= numbers.length * 2 - 3) ? Colors.grey : Colors.black;
      if (i & 1 == 0) {
        double? num = numbers[i ~/ 2];
        if (num == null) {
          text = "";
        } else {
          text = doubleToString(num);
        }
      } else {
        text = " ${operations[(i - 1) ~/ 2].text} ";
      }
      return TextSpan(text: text, style: TextStyle(color: color));
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              clipBehavior: Clip.hardEdge,
              child: RichText(text: TextSpan(children: spans)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "= ${doubleToString(evalExpression(numbers.map((e) => e ?? 0).toList(), operations))}",
            ),
          ),
        ],
      ),
    );
  }
}
