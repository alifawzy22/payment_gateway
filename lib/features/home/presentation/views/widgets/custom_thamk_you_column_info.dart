import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/styles.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_credit_card_container.dart';
import 'package:payment_gateway/features/home/presentation/views/widgets/custom_row_payment_info.dart';

class CustomThankYouColumnInfo extends StatelessWidget {
  const CustomThankYouColumnInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Thank You',
          style: Styles.style25,
        ),
        Text(
          'Your Transaction is Successfully',
        ),
        SizedBox(
          height: 16,
        ),
        CustomRowPaymentInfo(
          title: 'Date',
          value: '01/24/2023',
        ),
        SizedBox(
          height: 8,
        ),
        CustomRowPaymentInfo(
          title: 'Time',
          value: '10:15 AM',
        ),
        SizedBox(
          height: 8,
        ),
        CustomRowPaymentInfo(
          title: 'To',
          value: 'Sam Louis',
        ),
        Divider(
          height: 25,
          thickness: 2,
        ),
        CustomRowPaymentInfo(
          title: 'Total',
          value: r'$50.97',
          titleTextStyle: Styles.style25,
          valueTextStyle: Styles.style25,
        ),
        SizedBox(
          height: 12,
        ),
        CustomCreditCardContainer(),
      ],
    );
  }
}
