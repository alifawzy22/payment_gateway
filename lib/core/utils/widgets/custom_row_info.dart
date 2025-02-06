import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/styles.dart';

class CustomRowInfo extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String value;
  final TextStyle? valueStyle;

  const CustomRowInfo({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle = Styles.style18,
    this.valueStyle = Styles.style18,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Spacer(),
          Text(
            value,
            style: valueStyle,
          ),
        ],
      ),
    );
  }
}
