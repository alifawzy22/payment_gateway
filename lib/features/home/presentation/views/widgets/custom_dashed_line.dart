import 'package:flutter/material.dart';
import 'package:payment_gateway/constants.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        20,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                  color: kThankYouDashedLineColor,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
      ),
    );
  }
}
