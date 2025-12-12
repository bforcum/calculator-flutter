import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatefulWidget {
  final Function(double?) onChanged;
  const NumberInput({super.key, required this.onChanged});

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  static final RegExp filter = RegExp("^[+-]?(?:\\d*(?:\\.\\d*)?|\\.\\d*)\$");

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
        FilteringTextInputFormatter.allow(RegExp(r"[0-9.+-]")),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text;
          return text.isEmpty || RegExp(r"^[+-]?\.?").hasMatch(text)
              ? newValue
              : double.tryParse(text) == null
              ? oldValue
              : newValue;
        }),
      ],
      controller: _controller,
      onChanged:
          (value) => setState(() {
            if (filter.hasMatch(value)) _controller.text = value;
            widget.onChanged(double.tryParse(value));
          }),
    );
  }
}
