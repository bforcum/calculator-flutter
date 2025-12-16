import 'package:calculator_flutter/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  static final RegExp filter = RegExp(r"^[+-]?\d*\.?\d*$");

  final Function(double?) onChanged;
  final double? init;
  const NumberInput({super.key, this.init, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: doubleToString(init),
      keyboardType: TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      validator:
          (value) =>
              double.tryParse(value ?? "NaN") == null
                  ? "Please enter a valid number"
                  : null,

      inputFormatters: [
        // FilteringTextInputFormatter.allow(RegExp(r"[0-9\.+-]")),
        TextInputFormatter.withFunction(
          (oldValue, newValue) =>
              filter.hasMatch(newValue.text) ? newValue : oldValue,
        ),
      ],
      onChanged: (value) => onChanged(double.tryParse(value)),
    );
  }
}
