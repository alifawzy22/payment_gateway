import 'package:flutter/material.dart';
import 'package:payment_gateway/constants.dart';
import 'package:payment_gateway/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final TextStyle? labelTextStyle;
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.label,
    this.labelTextStyle = Styles.style18,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          kPrimaryColor,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          label,
          style: labelTextStyle,
        ),
      ),
    );
  }
}
