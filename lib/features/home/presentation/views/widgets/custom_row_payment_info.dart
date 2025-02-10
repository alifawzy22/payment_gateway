import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/styles.dart';

class CustomRowPaymentInfo extends StatelessWidget {
  final String title, value;
  final TextStyle? titleTextStyle, valueTextStyle;
  const CustomRowPaymentInfo({
    super.key,
    required this.title,
    required this.value,
    this.titleTextStyle = Styles.style18,
    this.valueTextStyle = Styles.styleSemiBold18,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: titleTextStyle,
        ),
        Spacer(),
        Text(
          value,
          style: valueTextStyle,
        ),
      ],
    );
  }
}
