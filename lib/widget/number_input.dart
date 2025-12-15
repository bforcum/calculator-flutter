import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatefulWidget {
  final Function(double?) onChanged;
  const NumberInput({super.key, required this.onChanged});

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  static final RegExp filter = RegExp(r"^[+-]?(?:\d*(?:\.\d*)?|\.\d*)\$");

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        FilteringTextInputFormatter.allow(RegExp(r"[0-9\.+-]")),
        TextInputFormatter.withFunction((oldValue, newValue) {
          return filter.hasMatch(newValue.text) ? newValue : oldValue;
        }),
      ],
      controller: _controller,
      onChanged:
          (value) => setState(() {
            widget.onChanged(double.tryParse(value));
          }),
    );
  }
}
