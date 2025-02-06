import 'package:flutter/material.dart';
import 'package:payment_gateway/core/utils/assets_data.dart';
import 'package:payment_gateway/core/utils/styles.dart';
import 'package:payment_gateway/core/utils/widgets/custom_elevated_button.dart';
import 'package:payment_gateway/core/utils/widgets/custom_row_info.dart';
import 'package:payment_gateway/features/home/presentation/views/payment_details_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: Image.asset(
            AssetsData.card,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        CustomRowInfo(
          title: 'Order Subtotal',
          value: r'42.97$',
        ),
        SizedBox(
          height: 8,
        ),
        CustomRowInfo(
          title: 'Discount',
          value: r'0$',
        ),
        SizedBox(
          height: 8,
        ),
        CustomRowInfo(
          title: 'Shipping',
          value: r'8$',
        ),
        Divider(
          thickness: 2,
          indent: 32,
          endIndent: 32,
          height: 32,
        ),
        CustomRowInfo(
          title: 'Total',
          titleStyle: Styles.style24,
          value: r'50.97$',
          valueStyle: Styles.style24,
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomElevatedButton(
            label: 'Complete Payment',
            labelTextStyle: Styles.style22,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentDetailsView(),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
