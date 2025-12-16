double? evalExpression(List<double> numbers, List<Operation> operations) {
  List<double> numStack = [numbers[0]];
  List<Operation> opStack = [];
  for (int i = 0; i < operations.length; i++) {
    Operation currentOp = operations[i];
    while (opStack.isNotEmpty && opStack.last.priority >= currentOp.priority) {
      processOp(numStack, opStack.last);
      opStack.removeLast();
    }

    numStack.add(numbers[i + 1]);
    opStack.add(operations[i]);
  }
  while (opStack.isNotEmpty) {
    processOp(numStack, opStack.last);
    opStack.removeLast();
  }
  return numStack.last;
}

void processOp(List<double> numStack, Operation op) {
  double r = numStack.removeLast();
  double l = numStack.removeLast();

  switch (op) {
    case Operation.add:
      numStack.add(l + r);
      break;
    case Operation.subtract:
      numStack.add(l - r);
      break;
    case Operation.multiply:
      numStack.add(l * r);
      break;
    case Operation.divide:
      if (r == 0) {
        numStack.add(double.nan);
      } else {
        numStack.add(l / r);
      }
      break;
  }
}

class ExpressionSymbol {
  final bool isOperation;
  final Operation? operation;
  final double? value;

  const ExpressionSymbol.operation(this.operation)
    : isOperation = true,
      value = null;

  const ExpressionSymbol.value(this.value)
    : isOperation = false,
      operation = null;
}

enum Operation {
  add("+", 1),
  subtract("-", 1),
  multiply("×", 2),
  divide("÷", 2);

  const Operation(this.text, this.priority);

  final String text;
  final int priority;
}
