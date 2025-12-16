import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  const CalcButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FilledButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
