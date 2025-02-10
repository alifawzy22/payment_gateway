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
        backgroundColor: WidgetStateProperty.all(
          Color(0xFF34A853),
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xFF34A853),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.075,
        child: Center(
          child: Text(
            text,
            style: Styles.style22,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
