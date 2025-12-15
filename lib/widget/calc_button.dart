import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  const CalcButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: FilledButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
          ),
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }
}
