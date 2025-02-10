import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomPAIDButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomPAIDButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xFF34A853),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      child: Text(
        text,
        style: Styles.style22.copyWith(
          color: Color(0xFF34A853),
        ),
      ),
    );
  }
}
